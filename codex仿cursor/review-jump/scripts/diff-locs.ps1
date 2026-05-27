param(
  [int]$Unified = 0
)

$ErrorActionPreference = "Stop"

function Get-DiffText {
  git diff --no-color --unified=$Unified
}

$diff = Get-DiffText
if (-not $diff) {
  Write-Output "No diff."
  exit 0
}

$currentPath = $null

foreach ($line in ($diff -split "`n")) {
  # diff header: diff --git a/path b/path
  if ($line -match '^diff --git a/(.+?) b/(.+?)\s*$') {
    $currentPath = $Matches[2]
    continue
  }

  # hunk header: @@ -oldStart,oldCount +newStart,newCount @@
  if ($line -match '^@@\s+-(\d+)(?:,(\d+))?\s+\+(\d+)(?:,(\d+))?\s+@@') {
    if (-not $currentPath) { continue }
    $newStart = [int]$Matches[3]
    $newCount = if ($Matches[4]) { [int]$Matches[4] } else { 1 }
    $hint = if ($newCount -le 1) { "change" } else { "changes($newCount)" }
    Write-Output ("{0}:{1} {2}" -f $currentPath, $newStart, $hint)
    continue
  }
}

