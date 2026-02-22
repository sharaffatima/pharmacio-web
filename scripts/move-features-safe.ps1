# scripts\move-features-safe.ps1
Param(
  [string]$BranchName = "feature/ADM-123-ui-cleanup"
)

$ErrorActionPreference = 'Stop'
Write-Host "Safe move script â€” moving existing files only (no content changes)."

# create feature dirs
$features = @("offers","compare","upload","permissions","dashboard","inventory","alerts","proposals")
foreach ($f in $features) {
  $d = Join-Path "lib\features" $f
  if (-not (Test-Path $d)) {
    New-Item -ItemType Directory -Path $d -Force | Out-Null
    Write-Host "Created $d"
  } else {
    Write-Host "Exists: $d"
  }
}

# mapping patterns (only move if file exists)
$map = @{
 "offers" = @("offers_list_screen.dart","offers_repository.dart","offer.dart","models/offer.dart")
 "compare" = @("compare_screen.dart")
 "upload" = @("upload_offers_screen.dart")
 "permissions" = @("permissions_screen.dart")
 "dashboard" = @("dashboard_screen.dart")
 "inventory" = @("inventory_screen.dart")
 "alerts" = @("alerts_screen.dart")
 "proposals" = @("proposals_screen.dart")
}

$notFound = @()

foreach ($feat in $map.Keys) {
  foreach ($pat in $map[$feat]) {
    # search for exact filename anywhere under lib
    $found = Get-ChildItem -Path .\lib -Recurse -Filter $pat -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($found) {
      $targetDir = Join-Path "lib\features" $feat
      if (-not (Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force | Out-Null }
      $target = Join-Path $targetDir $found.Name
      try {
        $resolvedTarget = $null
        try { $resolvedTarget = (Resolve-Path $target -ErrorAction SilentlyContinue).Path } catch { $resolvedTarget = $null }
        if ($resolvedTarget -ne $found.FullName) {
          # If the source and target are different, move
          if ($found.FullName -ne $resolvedTarget) {
            Move-Item -Path $found.FullName -Destination $target -Force
            Write-Host "Moved: $($found.FullName) -> $target"
          } else {
            Write-Host "Already at $target"
          }
        } else {
          Write-Host "Already at $target"
        }
      } catch {
        Write-Host "Failed moving $($found.FullName): $_"
        $notFound += "$feat : $pat (move failed)"
      }
    } else {
      Write-Host "Not found: $pat (feature $feat)"
      $notFound += "$feat : $pat"
    }
  }
}

if ($notFound.Count -gt 0) {
  Write-Host "`nFiles missing (move skipped) â€” check manually:`n"
  $notFound | ForEach-Object { Write-Host $_ }
  Write-Host "----------------------------------------`n"
}

# Normalize imports: convert backslashes to forward slashes in Dart files
Get-ChildItem -Path .\lib -Recurse -Filter *.dart | ForEach-Object {
  $path = $_.FullName
  try {
    $txt = Get-Content $path -Raw -ErrorAction Stop
    $newtxt = $txt -replace "\\", "/"
    if ($newtxt -ne $txt) {
      Set-Content -Path $path -Value $newtxt -Encoding UTF8
      Write-Host "Normalized slashes in: $path"
    }
  } catch {
    Write-Host "Could not read/normalize $path : $_"
  }
}

Write-Host "`nDone moving files. Please run package get, format and analyze next."
