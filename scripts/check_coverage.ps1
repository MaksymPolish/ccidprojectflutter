param(
  [int]$MinCoverage = 70
)

$lcovPath = Join-Path -Path (Get-Location) -ChildPath "coverage\lcov.info"
if (-not (Test-Path $lcovPath)) {
  Write-Host "❌ coverage/lcov.info not found. Run 'flutter test --coverage' first." -ForegroundColor Red
  exit 1
}

$LF_total = 0
$LH_total = 0

Get-Content $lcovPath | ForEach-Object {
  if ($_ -match '^LF:(\d+)') { $LF_total += [int]$matches[1] }
  if ($_ -match '^LH:(\d+)') { $LH_total += [int]$matches[1] }
}

if ($LF_total -eq 0) {
  Write-Host "❌ No executable lines (LF) found in lcov.info." -ForegroundColor Red
  exit 1
}

$percent = [math]::Round((($LH_total / $LF_total) * 100), 2)
Write-Host "Current coverage: $percent% ($LH_total of $LF_total)"
Write-Host "Minimum required: $MinCoverage%"

if ($percent -lt $MinCoverage) {
  Write-Host "❌ Coverage $percent% is below minimum $MinCoverage%" -ForegroundColor Red
  exit 1
} else {
  Write-Host "✅ Coverage check passed!" -ForegroundColor Green
  exit 0
}
