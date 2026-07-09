# Carrega as variaveis do .env e roda os testes Robot Framework.
# Uso: .\run_tests.ps1 [argumentos extras para o robot]
#   .\run_tests.ps1 tests/
#   .\run_tests.ps1 --test "Login Com Sucesso" tests/login_test.robot

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

$EnvFile = Join-Path $ScriptDir ".env"
if (Test-Path $EnvFile) {
    Get-Content $EnvFile | ForEach-Object {
        $line = $_.Trim()
        if ($line -and -not $line.StartsWith("#") -and $line.Contains("=")) {
            $name, $value = $line.Split("=", 2)
            $name = $name.Trim()
            $value = $value.Trim().Trim('"').Trim("'")
            [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }
} else {
    Write-Warning "Arquivo .env nao encontrado em $ScriptDir"
}

$VenvActivate = Join-Path $ScriptDir "venv\Scripts\Activate.ps1"
if (Test-Path $VenvActivate) {
    & $VenvActivate
}

if ($args.Count -eq 0) {
    python -m robot --outputdir results tests/
} else {
    python -m robot --outputdir results @args
}
