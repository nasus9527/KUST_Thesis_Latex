param(
    [string]$Version = "dev",
    [string]$OutputDir = "dist"
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDir
$outputRoot = Join-Path $projectRoot $OutputDir
$stagingRoot = Join-Path $outputRoot "release-staging"
$packageRootName = "KUSTThesis-$Version"
$packageRoot = Join-Path $stagingRoot $packageRootName
$zipPath = Join-Path $outputRoot "$packageRootName.zip"

$includeFiles = @(
    ".gitignore",
    "Compile.bat",
    "kustthesis.cls",
    "LICENSE",
    "main.tex",
    "README.md",
    "setup.tex",
    "docs/START_HERE.md",
    "logo.jpeg"
)

$includeDirs = @(
    "contents",
    "figures",
    "image"
)

function Copy-PathIntoPackage {
    param(
        [string]$RelativePath
    )

    $sourcePath = Join-Path $projectRoot $RelativePath
    if (-not (Test-Path $sourcePath)) {
        Write-Warning "Skip missing path: $RelativePath"
        return
    }

    $destinationPath = Join-Path $packageRoot $RelativePath
    $destinationParent = Split-Path -Parent $destinationPath

    if (-not (Test-Path $destinationParent)) {
        New-Item -ItemType Directory -Path $destinationParent -Force | Out-Null
    }

    Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
}

if (-not (Test-Path $outputRoot)) {
    New-Item -ItemType Directory -Path $outputRoot -Force | Out-Null
}

if (Test-Path $stagingRoot) {
    Remove-Item -Path $stagingRoot -Recurse -Force
}

if (Test-Path $zipPath) {
    Remove-Item -Path $zipPath -Force
}

New-Item -ItemType Directory -Path $packageRoot -Force | Out-Null

foreach ($file in $includeFiles) {
    Copy-PathIntoPackage -RelativePath $file
}

foreach ($dir in $includeDirs) {
    Copy-PathIntoPackage -RelativePath $dir
}

Compress-Archive -Path (Join-Path $stagingRoot $packageRootName) -DestinationPath $zipPath -Force

Write-Host "Release package created:" -ForegroundColor Green
Write-Host $zipPath

