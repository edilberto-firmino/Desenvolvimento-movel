$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.IO.Compression
$root = Split-Path $PSScriptRoot -Parent
$source = Join-Path $root 'Desenvolvimento para dispositivos moveis - Planejamento Estratégico Complementar - Disciplina EaD - Inbec.docx'
$output = Join-Path $root 'Desenvolvimento para dispositivos moveis - Plano atualizado com links.docx'
$resources = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'resources.json') -Raw -Encoding UTF8 | ConvertFrom-Json
Copy-Item -LiteralPath $source -Destination $output
$zip = [System.IO.Compression.ZipFile]::Open($output, [System.IO.Compression.ZipArchiveMode]::Update)
function Read-Part($name) {
    $reader = [System.IO.StreamReader]::new($zip.GetEntry($name).Open())
    try { $reader.ReadToEnd() } finally { $reader.Dispose() }
}
[xml]$doc = Read-Part 'word/document.xml'
[xml]$rels = Read-Part 'word/_rels/document.xml.rels'
$w = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
$r = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships'
$ns = [System.Xml.XmlNamespaceManager]::new($doc.NameTable)
$ns.AddNamespace('w', $w)
$script:linkCount = 0
function Set-Text($p, [string]$text) {
    foreach ($child in @($p.ChildNodes)) { if ($child.LocalName -ne 'pPr') { [void]$p.RemoveChild($child) } }
    $run = $doc.CreateElement('w','r',$w)
    $t = $doc.CreateElement('w','t',$w)
    [void]$t.SetAttribute('space','http://www.w3.org/XML/1998/namespace','preserve')
    $t.InnerText = $text
    [void]$run.AppendChild($t)
    [void]$p.AppendChild($run)
}
function Add-Reference($template, $resource, [string]$prefix) {
    $p = $template.CloneNode($true)
    foreach ($attribute in @($p.Attributes)) { if ($attribute.LocalName -in @('paraId','textId')) { [void]$p.RemoveAttributeNode($attribute) } }
    Set-Text $p ($prefix + $resource.title + ' (' + $resource.language + '). Disponível em: ')
    $script:linkCount++
    $id = 'rIdMaterial' + $script:linkCount
    $rel = $rels.CreateElement('Relationship',$rels.DocumentElement.NamespaceURI)
    $rel.SetAttribute('Id',$id)
    $rel.SetAttribute('Type',$r + '/hyperlink')
    $rel.SetAttribute('Target',$resource.url)
    $rel.SetAttribute('TargetMode','External')
    [void]$rels.DocumentElement.AppendChild($rel)
    $link = $doc.CreateElement('w','hyperlink',$w)
    [void]$link.SetAttribute('id',$r,$id)
    $run = $doc.CreateElement('w','r',$w)
    $pr = $doc.CreateElement('w','rPr',$w)
    $color = $doc.CreateElement('w','color',$w)
    [void]$color.SetAttribute('val',$w,'0563C1')
    $underline = $doc.CreateElement('w','u',$w)
    [void]$underline.SetAttribute('val',$w,'single')
    [void]$pr.AppendChild($color)
    [void]$pr.AppendChild($underline)
    [void]$run.AppendChild($pr)
    $t = $doc.CreateElement('w','t',$w)
    $t.InnerText = $resource.url
    [void]$run.AppendChild($t)
    [void]$link.AppendChild($run)
    [void]$p.AppendChild($link)
    $tail = $doc.CreateElement('w','r',$w)
    $tailText = $doc.CreateElement('w','t',$w)
    $tailText.InnerText = '. Acesso em: 14 out. 2026.'
    [void]$tail.AppendChild($tailText)
    [void]$p.AppendChild($tail)
    return ,$p
}
$mediaInstructions = @(
    'Acompanhe o vídeo e o tutorial de criação do primeiro aplicativo. Observe a configuração do projeto, a organização inicial dos arquivos e a execução no dispositivo. O vídeo está incorporado na página indicada, junto ao passo a passo.',
    'Explore o tutorial interativo Thinking in React. Observe como uma interface é dividida em componentes e como os dados orientam sua organização. Relacione o exemplo ao fluxo de telas e ao protótipo do aplicativo planejado.',
    'Acompanhe o vídeo e o tutorial de construção de uma tela no Expo. Observe o uso de componentes, propriedades e arquivos separados. Compare a implementação apresentada com os componentes reutilizáveis do seu projeto. O vídeo está incorporado na página indicada.',
    'Acompanhe o vídeo de navegação do Expo e os exemplos de Flexbox. Observe a organização das rotas, a transição entre telas e a distribuição visual dos componentes. O vídeo está incorporado no tutorial de navegação indicado.',
    'Retome os vídeos e os tutoriais de construção de tela e navegação do Expo. Percorra os exemplos e compare o fluxo completo com a versão atual do aplicativo, identificando comportamentos e ajustes necessários. Os vídeos estão incorporados nas páginas indicadas.',
    'Acompanhe o tutorial digital de uso do AsyncStorage e examine os exemplos de gravação, leitura e remoção de dados. Adapte uma operação ao projeto e verifique sua persistência após reabrir o aplicativo. Material em texto e código, com acesso direto pelo link abaixo.',
    'Explore os tutoriais digitais de comunicação em rede e Fetch API. Observe os exemplos de requisições e tratamento das respostas e adapte-os à API do projeto. Analise também os estados de carregamento e falha. Materiais em texto e código, com acesso direto pelos links abaixo.',
    'Acompanhe o vídeo e o tutorial de seleção de imagens no Expo. Observe a abertura da galeria, o retorno da seleção e o tratamento do cancelamento. Relacione o exemplo às permissões e aos testes do seu aplicativo. O vídeo está incorporado na página indicada.',
    'Acompanhe o tutorial digital introdutório do EAS e identifique as etapas de configuração, geração e compartilhamento de versões do aplicativo. Relacione o roteiro à preparação da demonstração técnica. O link abaixo abre diretamente o material da série oficial.',
    'Acompanhe o vídeo e o tutorial de distribuição interna do Expo. Observe como uma versão pode ser compartilhada para instalação e testes e use o roteiro para revisar as instruções de entrega do projeto. O vídeo está incorporado na página indicada.'
)
$unit = -1
$dimension = 0
$moreTextDone = $false
$edits = 0
foreach ($p in @($doc.SelectNodes('//w:body//w:p',$ns))) {
    $text = ($p.SelectNodes('.//w:t',$ns) | ForEach-Object { $_.InnerText }) -join ''
    if ($text -match '^UNIDADE DE ENSINO E APRENDIZAGEM [IVX]+$') { $unit++; $dimension=0 }
    if ($unit -lt 0 -or $unit -gt 9) { continue }
    if ($text -match '^DIMENSÃO ([1-4])') { $dimension=[int]$Matches[1]; $moreTextDone=$false; continue }
    if ($text -like 'Leitura sugerida:*' -or $text -like 'Mídia sugerida:*' -or $text -like 'Material complementar:*') {
        $items = @()
        $prefix = ''
        if ($text -like 'Leitura sugerida:*') { $items=@($resources[$unit].reading); $prefix='Leitura indicada: ' }
        elseif ($text -like 'Mídia sugerida:*') { $items=@($resources[$unit].media) }
        else { $items=@($resources[$unit].more); $prefix='Material complementar: ' }
        foreach ($item in $items) {
            $label = $prefix
            if (-not $label) { $label=$item.kind + ': ' }
            $newP = Add-Reference $p $item $label
            [void]$p.ParentNode.InsertBefore($newP,$p)
        }
        [void]$p.ParentNode.RemoveChild($p)
        $edits++
    }
    elseif ($dimension -eq 2 -and -not [string]::IsNullOrWhiteSpace($text)) { Set-Text $p $mediaInstructions[$unit]; $edits++ }
    elseif ($dimension -eq 4 -and -not $moreTextDone -and -not [string]::IsNullOrWhiteSpace($text)) { Set-Text $p $resources[$unit].text; $moreTextDone=$true; $edits++ }
}
if ($unit -ne 9 -or $edits -ne 50) { throw "Unexpected update counts: unit=$unit edits=$edits" }
foreach ($part in @(@('word/document.xml',$doc),@('word/_rels/document.xml.rels',$rels))) {
    $zip.GetEntry($part[0]).Delete()
    $entry = $zip.CreateEntry($part[0])
    $stream = $entry.Open()
    $settings = [System.Xml.XmlWriterSettings]::new()
    $settings.Encoding = [System.Text.UTF8Encoding]::new($false)
    $settings.Indent = $false
    $writer = [System.Xml.XmlWriter]::Create($stream,$settings)
    try { $part[1].Save($writer) } finally { $writer.Dispose(); $stream.Dispose() }
}
$zip.Dispose()
Write-Output "Updated units: $($unit+1); changed paragraphs: $edits; clickable references: $script:linkCount"
Write-Output $output
