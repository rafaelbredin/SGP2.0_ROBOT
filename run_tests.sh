#!/bin/bash
# Carrega as variáveis do .env e roda os testes Robot Framework.
# Uso: ./run_tests.sh [argumentos extras para o robot]
#   ./run_tests.sh tests/
#   ./run_tests.sh --test "Login Com Sucesso" tests/login_test.robot

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ -f .env ]; then
    set -a
    source .env
    set +a
else
    echo "Aviso: arquivo .env não encontrado em $SCRIPT_DIR" >&2
fi

if [ -f venv/bin/activate ]; then
    source venv/bin/activate
fi

if [ "$#" -eq 0 ]; then
    python -m robot --outputdir results tests/
else
    python -m robot --outputdir results "$@"
fi
