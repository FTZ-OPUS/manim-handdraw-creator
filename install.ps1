$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

py -3 -m venv .venv
& .\.venv\Scripts\python.exe -m pip install -r requirements.txt
if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed; see the Manim installation guide in README.md.' }
& .\.venv\Scripts\python.exe scripts\check_environment.py
if ($LASTEXITCODE -ne 0) { throw 'Environment check failed.' }

Write-Host 'Installed in .venv. Run .\.venv\Scripts\python.exe scripts\prepare_pair.py --help'
