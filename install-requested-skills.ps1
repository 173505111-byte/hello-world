$ErrorActionPreference = "Stop"

$skillsRoot = Join-Path $env:USERPROFILE ".codex\skills"

$frontendDir = Join-Path $skillsRoot "frontend-design"
$humanizerDir = Join-Path $skillsRoot "humanizer"

New-Item -ItemType Directory -Force -Path $frontendDir | Out-Null
Invoke-WebRequest `
  -Uri "https://raw.githubusercontent.com/anthropics/skills/main/skills/frontend-design/SKILL.md" `
  -OutFile (Join-Path $frontendDir "SKILL.md")

New-Item -ItemType Directory -Force -Path $humanizerDir | Out-Null
Invoke-WebRequest `
  -Uri "https://raw.githubusercontent.com/blader/humanizer/main/SKILL.md" `
  -OutFile (Join-Path $humanizerDir "SKILL.md")

Write-Host "Installed frontend-design to $frontendDir"
Write-Host "Installed humanizer to $humanizerDir"
Write-Host "Restart Codex to pick up new skills."
