<#
.SYNOPSIS
Instala as skills frontend-expert e dev-expert num projeto (.claude/skills).

.EXAMPLE
.\install.ps1
Instala no diretorio atual (rode de dentro do seu projeto).

.EXAMPLE
.\install.ps1 -Destino "C:\projetos\site-do-cliente"
Instala num projeto em outro caminho.
#>
param(
    [string]$Destino = "."
)

$ErrorActionPreference = "Stop"

$origem = Join-Path $PSScriptRoot "skills"
if (-not (Test-Path $origem)) {
    Write-Error "Pasta 'skills' nao encontrada ao lado deste script. Rode install.ps1 de dentro da pasta 'Skills para Devs'."
    exit 1
}

$raizDestino = (Resolve-Path $Destino).Path
$destinoClaude = Join-Path $raizDestino ".claude\skills"
New-Item -ItemType Directory -Force -Path $destinoClaude | Out-Null

foreach ($skill in @("frontend-expert", "dev-expert")) {
    $origemSkill = Join-Path $origem $skill
    $destinoSkill = Join-Path $destinoClaude $skill

    if (Test-Path $destinoSkill) {
        $backup = "$destinoSkill.bak"
        if (Test-Path $backup) { Remove-Item -Recurse -Force $backup }
        Rename-Item -Path $destinoSkill -NewName (Split-Path $backup -Leaf)
        Write-Host "Aviso: ja existia '$skill' em .claude\skills. Versao anterior guardada em '$skill.bak'." -ForegroundColor Yellow
    }

    Copy-Item -Recurse -Path $origemSkill -Destination $destinoSkill
    Write-Host "Instalado: $skill" -ForegroundColor Green
}

Write-Host ""
Write-Host "Pronto. Abra o Claude Code dentro de '$raizDestino' - as skills 'frontend-expert' e 'dev-expert' carregam sozinhas."
