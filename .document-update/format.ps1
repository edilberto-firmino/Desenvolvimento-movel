$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.IO.Compression
$root=Split-Path $PSScriptRoot -Parent
$reference=Join-Path $root 'Inovação e Startups - Planejamento Estratégico Complementar - exemplo.docx'
$inputFile=Join-Path $root 'Desenvolvimento para dispositivos moveis - Plano atualizado com links.docx'
$outputFile=Join-Path $root 'Desenvolvimento para dispositivos moveis - Formatado conforme exemplo.docx'
$referenceHash=(Get-FileHash -LiteralPath $reference -Algorithm SHA256).Hash
function Read-Part($archive,$name){$rd=[System.IO.StreamReader]::new($archive.GetEntry($name).Open());try{$rd.ReadToEnd()}finally{$rd.Dispose()}}
$refZip=[System.IO.Compression.ZipFile]::OpenRead($reference)
[xml]$ref=Read-Part $refZip 'word/document.xml'
[xml]$refNum=Read-Part $refZip 'word/numbering.xml'
Copy-Item -LiteralPath $inputFile -Destination $outputFile
$zip=[System.IO.Compression.ZipFile]::Open($outputFile,[System.IO.Compression.ZipArchiveMode]::Update)
[xml]$doc=Read-Part $zip 'word/document.xml'
[xml]$numbering=Read-Part $zip 'word/numbering.xml'
$w='http://schemas.openxmlformats.org/wordprocessingml/2006/main'
$ns=[System.Xml.XmlNamespaceManager]::new($doc.NameTable);$ns.AddNamespace('w',$w)
$rn=[System.Xml.XmlNamespaceManager]::new($ref.NameTable);$rn.AddNamespace('w',$w)
$nn=[System.Xml.XmlNamespaceManager]::new($numbering.NameTable);$nn.AddNamespace('w',$w)
$rnn=[System.Xml.XmlNamespaceManager]::new($refNum.NameTable);$rnn.AddNamespace('w',$w)
$rps=@($ref.SelectNodes('//w:body//w:p',$rn))
$beforeTexts=@($doc.SelectNodes('//w:body//w:p',$ns)|ForEach-Object{($_.SelectNodes('.//w:t',$ns)|ForEach-Object{$_.InnerText}) -join ''})
function Replace-Property($node,$name,$template){$old=$node.SelectSingleNode('w:'+$name,$ns);if($old){[void]$node.RemoveChild($old)};if($template){[void]$node.PrependChild($doc.ImportNode($template,$true))}}
function Format-Paragraph($p,$prototype,[bool]$bold=$false,[bool]$keep=$false){
    $pr=$prototype.SelectSingleNode('w:pPr',$rn)
    Replace-Property $p 'pPr' $pr
    $ppr=$p.SelectSingleNode('w:pPr',$ns)
    foreach($extra in @($ppr.SelectNodes('w:numPr|w:pStyle',$ns))){[void]$ppr.RemoveChild($extra)}
    if($keep -and -not $ppr.SelectSingleNode('w:keepNext',$ns)){[void]$ppr.PrependChild($doc.CreateElement('w','keepNext',$w))}
    foreach($run in @($p.SelectNodes('.//w:r',$ns))){
        $oldPr=$run.SelectSingleNode('w:rPr',$ns)
        $isLink=$run.ParentNode.LocalName -eq 'hyperlink'
        $newPr=$doc.CreateElement('w','rPr',$w)
        $fonts=$doc.CreateElement('w','rFonts',$w)
        foreach($att in @('ascii','hAnsi','eastAsia','cs')){[void]$fonts.SetAttribute($att,$w,'Calibri')}
        [void]$newPr.AppendChild($fonts)
        $protoRun=$prototype.SelectSingleNode('w:r/w:rPr',$rn)
        $size='22';if($protoRun){$sz=$protoRun.SelectSingleNode('w:sz',$rn);if($sz){$size=$sz.GetAttribute('val',$w)}}
        foreach($tag in @('sz','szCs')){$el=$doc.CreateElement('w',$tag,$w);[void]$el.SetAttribute('val',$w,$size);[void]$newPr.AppendChild($el)}
        $color=$doc.CreateElement('w','color',$w);$value='000000';if($isLink){$value='0563C1'};[void]$color.SetAttribute('val',$w,$value);[void]$newPr.AppendChild($color)
        if($isLink){$u=$doc.CreateElement('w','u',$w);[void]$u.SetAttribute('val',$w,'single');[void]$newPr.AppendChild($u)}
        if($bold){[void]$newPr.AppendChild($doc.CreateElement('w','b',$w));[void]$newPr.AppendChild($doc.CreateElement('w','bCs',$w))}
        if($oldPr){[void]$run.RemoveChild($oldPr)}
        [void]$run.PrependChild($newPr)
    }
}
function Bold-Range($p,[string]$pattern){
    foreach($run in @($p.SelectNodes('w:r',$ns))){
        $t=$run.SelectSingleNode('w:t',$ns);if(-not $t){continue}
        $matches=[regex]::Matches($t.InnerText,$pattern)
        if($matches.Count -eq 0){continue}
        $cursor=0
        foreach($m in $matches){
            foreach($piece in @(@($t.InnerText.Substring($cursor,$m.Index-$cursor),$false),@($m.Value,$true))){
                if(-not $piece[0]){continue};$clone=$run.CloneNode($true);$clone.SelectSingleNode('w:t',$ns).InnerText=$piece[0];[void]$clone.SelectSingleNode('w:t',$ns).SetAttribute('space','http://www.w3.org/XML/1998/namespace','preserve');if($piece[1]){[void]$clone.SelectSingleNode('w:rPr',$ns).AppendChild($doc.CreateElement('w','b',$w))};[void]$p.InsertBefore($clone,$run)
            };$cursor=$m.Index+$m.Length
        }
        if($cursor -lt $t.InnerText.Length){$clone=$run.CloneNode($true);$clone.SelectSingleNode('w:t',$ns).InnerText=$t.InnerText.Substring($cursor);[void]$clone.SelectSingleNode('w:t',$ns).SetAttribute('space','http://www.w3.org/XML/1998/namespace','preserve');[void]$p.InsertBefore($clone,$run)}
        [void]$p.RemoveChild($run)
    }
}
# Import only the reference's list formatting, using fresh identifiers.
$numRef=$refNum.SelectSingleNode('//w:num[@w:numId="20"]',$rnn)
$absId=$numRef.SelectSingleNode('w:abstractNumId',$rnn).GetAttribute('val',$w)
$newAbs=1+($numbering.SelectNodes('//w:abstractNum',$nn)|ForEach-Object{[int]$_.GetAttribute('abstractNumId',$w)}|Measure-Object -Maximum).Maximum
$abs=$numbering.ImportNode($refNum.SelectSingleNode('//w:abstractNum[@w:abstractNumId="'+$absId+'"]',$rnn),$true)
[void]$abs.SetAttribute('abstractNumId',$w,[string]$newAbs)
$firstNum=$numbering.SelectSingleNode('//w:num',$nn);[void]$numbering.DocumentElement.InsertBefore($abs,$firstNum)
$script:nextNum=1+($numbering.SelectNodes('//w:num',$nn)|ForEach-Object{[int]$_.GetAttribute('numId',$w)}|Measure-Object -Maximum).Maximum
function New-List{ $id=$script:nextNum;$script:nextNum++;$num=$numbering.CreateElement('w','num',$w);[void]$num.SetAttribute('numId',$w,[string]$id);$a=$numbering.CreateElement('w','abstractNumId',$w);[void]$a.SetAttribute('val',$w,[string]$newAbs);[void]$num.AppendChild($a);$ov=$numbering.CreateElement('w','lvlOverride',$w);[void]$ov.SetAttribute('ilvl',$w,'0');$start=$numbering.CreateElement('w','startOverride',$w);[void]$start.SetAttribute('val',$w,'1');[void]$ov.AppendChild($start);[void]$num.AppendChild($ov);[void]$numbering.DocumentElement.AppendChild($num);return $id }
function Add-List($p,$id){$pr=$p.SelectSingleNode('w:pPr',$ns);$np=$doc.CreateElement('w','numPr',$w);foreach($spec in @(@('ilvl','0'),@('numId',[string]$id))){$el=$doc.CreateElement('w',$spec[0],$w);[void]$el.SetAttribute('val',$w,$spec[1]);[void]$np.AppendChild($el)};[void]$pr.PrependChild($np)}
$headingPattern='^(UNIDADE DE ENSINO E APRENDIZAGEM|TEMA DA UNIDADE CURRICULAR|APRESENTAÇÃO DA UNIDADE|OBJETIVOS DE APRENDIZAGEM|DIMENSÃO [1-4]|DISTRIBUIÇÃO DAS ATIVIDADES AVALIATIVAS)'
$unitStarted=$false;$objectives=$false;$activity=$false;$activityList=$false;$themeNext=$false;$listId=0;$listItems=0;$boldHeadings=0
foreach($p in @($doc.SelectNodes('//w:body//w:p',$ns))){
    $text=($p.SelectNodes('.//w:t',$ns)|ForEach-Object{$_.InnerText}) -join ''
    if($text -match '^UNIDADE DE ENSINO E APRENDIZAGEM'){$unitStarted=$true;$objectives=$false;$activity=$false;$activityList=$false}
    if(-not $unitStarted){
        $proto=$rps[35];$bold=$false;$keep=$false
        $matching=@($rps|Where-Object{$_.InnerText.Trim() -eq $text.Trim() -and $text.Trim()})
        if($matching.Count){$proto=$matching[0];$bold=$null -ne $proto.SelectSingleNode('.//w:rPr/w:b[not(@w:val="0")]',$rn)}
        elseif($p.SelectSingleNode('ancestor::w:tbl',$ns)){$proto=$rps[35]}
        if($text -match '^NÚCLEO'){$proto=$rps[0];$bold=$true;$keep=$true}
        elseif($text -match '^PLANEJAMENTO'){$proto=$rps[1];$bold=$true;$keep=$true}
        elseif($text -match '^1ª PARTE'){$proto=$rps[18];$bold=$true;$keep=$true}
        elseif($text -match '^(CURSO:|COORDENAÇÃO:|DISCIPLINA:|PROFESSOR \(A\):|CARGA HORÁRIA DISCIPLINA:|PERÍODO:)'){$bold=$true;$keep=$true}
        Format-Paragraph $p $proto $bold $keep
        Bold-Range $p '(Desenvolvimento de Dispositivos Móveis|Dispositivos Móveis|React Native e Expo)'
        continue
    }
    $proto=$rps[133];$bold=$false;$keep=$false
    if($text -match $headingPattern){$proto=$rps[132];$bold=$true;$keep=$true;$boldHeadings++;$objectives=$false;$activityList=$false
        if($text -match '^OBJETIVOS'){$objectives=$true;$listId=New-List}
        if($text -match '^DIMENSÃO 3'){$activity=$true}else{$activity=$false}
        if($text -match '^TEMA DA UNIDADE CURRICULAR'){$themeNext=$true}
    }
    elseif($themeNext -and $text.Trim()){$proto=$rps[131];$bold=$true;$keep=$true;$themeNext=$false}
    elseif($text -match '^DATA:'){$bold=$true;$keep=$true}
    elseif($text -match '^Atividade –'){$proto=$rps[149];$bold=$true;$keep=$true}
    elseif($text -match '^(Ferramenta Moodle:|Pontuação:)'){$activityList=$false;$activity=$false}
    elseif($text -match '^(UEA|Atividade|Pontuação|Avaliação)$' -or $text -match '^Total AV[12]' -or $text -match '^\+ avaliação presencial'){$bold=$true}
    Format-Paragraph $p $proto $bold $keep
    if($objectives -and $text.Trim() -and $text -notmatch '^(OBJETIVOS|Ao final deste conteúdo)'){Add-List $p $listId;$listItems++}
    if($activity -and $activityList -and $text.Trim()){Add-List $p $listId;$listItems++}
    if($activity -and $text.TrimEnd().EndsWith(':') -and $text -notmatch '^DIMENSÃO'){$activityList=$true;$listId=New-List}
    Bold-Range $p '^(Ferramenta Moodle:|Pontuação:|Leitura indicada:|Material complementar:|Vídeo e tutorial:|Tutorial interativo:|Tutorial com exemplos:|Tutorial digital:)'
    if($text -match '^Pontuação:'){Bold-Range $p '(0,8 ponto – AV[12]|2ª Avaliação)'}
    if($text -match '^Prepare uma apresentação'){Bold-Range $p '3 a 5 minutos'}
    if($text -match '^Prepare o ambiente'){Bold-Range $p 'aproximadamente duas páginas'}
}
# Transfer table geometry and borders; preserve every cell's text and relationships.
$tables=@($doc.SelectNodes('//w:body/w:tbl',$ns));$refTables=@($ref.SelectNodes('//w:body/w:tbl',$rn))
for($i=0;$i -lt $tables.Count;$i++){
    $tp=$refTables[$i].SelectSingleNode('w:tblPr',$rn)
    Replace-Property $tables[$i] 'tblPr' $tp
    $style=$tables[$i].SelectSingleNode('w:tblPr/w:tblStyle',$ns);if($style){[void]$style.ParentNode.RemoveChild($style)}
    $oldGrid=$tables[$i].SelectSingleNode('w:tblGrid',$ns);$newGrid=$doc.ImportNode($refTables[$i].SelectSingleNode('w:tblGrid',$rn),$true);if($oldGrid){[void]$tables[$i].ReplaceChild($newGrid,$oldGrid)}
    $rows=@($tables[$i].SelectNodes('w:tr',$ns));$refRows=@($refTables[$i].SelectNodes('w:tr',$rn))
    for($j=0;$j -lt $rows.Count;$j++){
        $refRow=$refRows[[Math]::Min($j,$refRows.Count-1)]
        $cells=@($rows[$j].SelectNodes('w:tc',$ns));$refCells=@($refRow.SelectNodes('w:tc',$rn))
        if($cells.Count -eq $refCells.Count){for($k=0;$k -lt $cells.Count;$k++){Replace-Property $cells[$k] 'tcPr' $refCells[$k].SelectSingleNode('w:tcPr',$rn)}}
    }
}
$section=$doc.SelectSingleNode('//w:body/w:sectPr',$ns);$refSection=$ref.SelectSingleNode('//w:body/w:sectPr',$rn)
foreach($name in @('pgSz','pgMar','cols','docGrid')){ $old=$section.SelectSingleNode('w:'+$name,$ns);$replacement=$doc.ImportNode($refSection.SelectSingleNode('w:'+$name,$rn),$true);if($old){[void]$section.ReplaceChild($replacement,$old)} }
$afterTexts=@($doc.SelectNodes('//w:body//w:p',$ns)|ForEach-Object{($_.SelectNodes('.//w:t',$ns)|ForEach-Object{$_.InnerText}) -join ''})
if(($beforeTexts -join "`n") -cne ($afterTexts -join "`n")){throw 'Content changed during formatting'}
foreach($part in @(@('word/document.xml',$doc),@('word/numbering.xml',$numbering))){$zip.GetEntry($part[0]).Delete();$entry=$zip.CreateEntry($part[0]);$stream=$entry.Open();$settings=[System.Xml.XmlWriterSettings]::new();$settings.Encoding=[System.Text.UTF8Encoding]::new($false);$writer=[System.Xml.XmlWriter]::Create($stream,$settings);try{$part[1].Save($writer)}finally{$writer.Dispose();$stream.Dispose()}}
$zip.Dispose();$refZip.Dispose()
if((Get-FileHash -LiteralPath $reference -Algorithm SHA256).Hash -ne $referenceHash){throw 'Reference modified'}
@"
Reference: $reference
SHA256: $referenceHash
Format-only patch of existing mobile plan. No reference subject content copied.
Page geometry: A4 11906 x 16838 twips; top/bottom 720; left 1276; right 1274; header 1304; footer 709.
Typography: reference paragraph properties; explicit Calibri; introduction 12 pt; body 11 pt; first title 14 pt; line spacing 276 twentieths (1.15).
Roles: bold section headings, unit themes, activity names, metadata labels, Moodle and reference labels; scoring emphasis. Reference decimal list geometry, 720 twip left and 360 twip hanging; separate restart per list.
Tables: reference borders, margins, widths, grids and matching cell properties. Original text retained in all cells.
Preserve-only: all paragraphs and source text, all 52 material hyperlinks, remaining package parts, headers and image relationships. No source prose imported.
Visual verification unresolved: packaged rendering dependencies unavailable in this Windows environment. Structural and content comparison required.
"@ | Set-Content -LiteralPath (Join-Path $PSScriptRoot 'artifact.md') -Encoding UTF8
"Verified unchanged text in $($afterTexts.Count) paragraphs; $listItems numbered items; $boldHeadings bold section headings."
$outputFile
