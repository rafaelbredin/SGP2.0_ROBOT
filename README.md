# SGP2.0 Robot - Testes Automatizados

Projeto de testes automatizados utilizando **Robot Framework** com a biblioteca **Browser** (baseada em Playwright).

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Configuração do ambiente](#configuração-do-ambiente)
- [Configuração do Git e SSH](#configuração-do-git-e-ssh)
- [Variáveis de ambiente](#variáveis-de-ambiente)
- [Executando os testes](#executando-os-testes)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Problemas comuns](#problemas-comuns)

---

## Pré-requisitos

Antes de começar, você precisa ter instalado na máquina:

- **Python 3.10+** — [python.org/downloads](https://www.python.org/downloads/)
- **Git** — [git-scm.com/download/win](https://git-scm.com/download/win)
- Uma conta no **GitHub** com acesso ao repositório

### Instalando o Python

1. Baixe o instalador em [python.org/downloads](https://www.python.org/downloads/)
2. Na primeira tela do instalador, **marque a opção "Add python.exe to PATH"** antes de clicar em instalar
3. Após instalar, feche e abra um novo terminal e confirme:

```powershell
python --version
```

### Instalando o Git

1. Baixe em [git-scm.com/download/win](https://git-scm.com/download/win)
2. Siga a instalação com as opções padrão
3. Feche e abra um novo terminal e confirme:

```powershell
git --version
```

---

## Configuração do ambiente

### 1. Clonar o repositório

```powershell
git clone git@github.com:elrafapc/SGP2.0.git
cd SGP2.0
```

### 2. Criar o ambiente virtual (venv)

```powershell
python -m venv venv
```

### 3. Liberar execução de scripts no PowerShell (necessário apenas uma vez por máquina)

Por padrão, o Windows bloqueia a execução de scripts `.ps1`, o que impede a ativação do venv. Para liberar:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

Confirme digitando **S** quando solicitado.

### 4. Ativar o ambiente virtual

```powershell
venv\Scripts\activate
```

Você deve ver `(venv)` no início da linha do terminal, confirmando que está ativo. **Esse comando precisa ser rodado toda vez que você abrir um novo terminal para trabalhar no projeto.**

### 5. Instalar as dependências do projeto

Com o venv ativado:

```powershell
pip install -r requirements.txt
```

### 6. Inicializar os navegadores da biblioteca Browser

Esse passo baixa os navegadores (Chromium, Firefox, WebKit) usados pelos testes:

```powershell
python -m Browser.entry init
```

> Esse comando pode demorar alguns minutos, dependendo da conexão.

---

## Configuração do Git e SSH

Para conseguir fazer `pull` e `push` no repositório, é necessário configurar uma chave SSH vinculada à sua conta do GitHub.

### 1. Verificar se já existe uma chave SSH

```powershell
ls -al ~/.ssh
```

Se já existir um arquivo `id_ed25519.pub`, pule para o passo 4.

### 2. Gerar uma nova chave SSH

```powershell
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"
```

Aceite o local padrão apertando Enter e defina uma senha (opcional).

### 3. Habilitar e iniciar o serviço ssh-agent (Windows)

Abra o PowerShell **como Administrador**:

```powershell
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
```

Depois, em um terminal normal:

```powershell
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

### 4. Copiar a chave pública

```powershell
cat ~/.ssh/id_ed25519.pub
```

Copie todo o conteúdo exibido.

### 5. Cadastrar a chave no GitHub

1. Acesse **github.com** → foto de perfil → **Settings**
2. Vá em **SSH and GPG keys** → **New SSH key**
3. Cole a chave copiada e salve

### 6. Testar a conexão

```powershell
ssh -T git@github.com
```

### 7. Configurar nome e e-mail do Git (uma vez por máquina)

```powershell
git config --global user.name "Seu Nome"
git config --global user.email "seuemail@exemplo.com"
```

---

## Variáveis de ambiente

Os testes utilizam credenciais de login armazenadas em variáveis de ambiente, para não deixar dados sensíveis no código. As variáveis são lidas nos arquivos `.robot` com a sintaxe `%{PV_EMAIL}` / `%{PV_PASSWORD}` (variável de ambiente do sistema, não variável do Robot).

### Variáveis necessárias

| Variável       | Descrição                     |
|----------------|--------------------------------|
| `PV_EMAIL`     | E-mail de login usado nos testes |
| `PV_PASSWORD`  | Senha de login usada nos testes  |

### macOS / Linux — via arquivo `.env` (recomendado)

1. Copie o arquivo de exemplo e preencha com suas credenciais:

   ```bash
   cp .env.example .env
   ```

   ```
   PV_EMAIL="seuemail@exemplo.com"
   PV_PASSWORD="suasenha"
   ```

2. O `.env` **não é carregado automaticamente** pelo Robot Framework — use o script `run_tests.sh` (veja a seção [Executando os testes](#executando-os-testes)), que lê o `.env` e roda os testes em um único comando. O `.env` já está no `.gitignore`, então nunca é versionado.

### macOS / Linux — configuração permanente (alternativa)

Adicione ao final do seu `~/.zshrc` (ou `~/.bashrc`):

```bash
export PV_EMAIL="seuemail@exemplo.com"
export PV_PASSWORD="suasenha"
```

Depois rode `source ~/.zshrc` ou abra um novo terminal. Assim as variáveis ficam disponíveis mesmo rodando `python -m robot` diretamente, sem passar pelo `run_tests.sh`.

### Windows — configuração permanente

1. Pesquise **"Editar variáveis de ambiente do sistema"** no menu Iniciar do Windows
2. Clique em **Variáveis de Ambiente**
3. Em **"Variáveis do usuário"**, clique em **Novo** e adicione:
   - `PV_EMAIL` → seu e-mail de login
   - `PV_PASSWORD` → sua senha de login
4. Clique OK em tudo
5. **Feche e abra um novo terminal** para que as variáveis sejam carregadas

### Windows — configuração temporária (apenas na sessão atual do terminal)

```powershell
$env:PV_EMAIL = "seuemail@exemplo.com"
$env:PV_PASSWORD = "suasenha"
```

---

## Executando os testes

### macOS / Linux — usando `run_tests.sh` (recomendado)

O script `run_tests.sh`, na raiz do projeto, ativa o venv, carrega o `.env` e roda o robot — tudo em um comando, sem precisar exportar variáveis manualmente toda vez.

**Rodar todos os testes:**

```bash
./run_tests.sh
```

**Rodar um arquivo específico:**

```bash
./run_tests.sh tests/login_test.robot
./run_tests.sh tests/comprar_passar_test.robot
```

**Rodar um teste específico** (pelo nome do caso, dentro de um arquivo):

```bash
./run_tests.sh --test "Login Com Sucesso" tests/login_test.robot
./run_tests.sh --test "Sanidade - Portal Carrega" tests/login_test.robot
```

**Rodar testes com uma tag específica:**

```bash
./run_tests.sh --include minhatag tests/
```

### Windows — usando `run_tests.ps1` (recomendado)

`./run_tests.sh` **não funciona no Windows** — é um script bash e o Windows Explorer/PowerShell tenta abri-lo em vez de executá-lo. Use o `run_tests.ps1` equivalente, que ativa o venv, carrega o `.env` e roda o robot.

> Se for a primeira vez rodando um script `.ps1` nesta máquina, libere a execução (uma vez só): `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`

**Rodar todos os testes:**

```powershell
.\run_tests.ps1
```

**Rodar um arquivo específico:**

```powershell
.\run_tests.ps1 tests/login_test.robot
.\run_tests.ps1 tests/comprar_passar_test.robot
```

**Rodar um teste específico:**

```powershell
.\run_tests.ps1 --test "Login Com Sucesso" tests/login_test.robot
```

**Rodar testes com uma tag específica:**

```powershell
.\run_tests.ps1 --include minhatag tests/
```

### Windows — via PowerShell manual (alternativa)

Ative o ambiente virtual e exporte as variáveis de ambiente ([veja a seção anterior](#variáveis-de-ambiente)) antes de cada comando abaixo.

```powershell
venv\Scripts\activate
python -m robot --outputdir results tests/
```

### Visualizar o relatório

Após a execução, os resultados ficam na pasta `results/`. Para abrir o relatório no navegador:

```bash
open results/report.html      # macOS
```

```powershell
start results\report.html     # Windows
```

- **`report.html`** → resumo visual dos resultados
- **`log.html`** → log detalhado de cada passo, útil para debug
- **`output.xml`** → dados brutos da execução

---

## Estrutura do projeto

```
SGP2.0_ROBOT/
├── resources/
│   ├── variables.robot
│   └── pages/
│       └── LoginPage.resource
├── tests/
│   └── login_test.robot
├── results/          # gerado após execução (ignorado pelo Git)
├── venv/             # ambiente virtual (ignorado pelo Git)
├── .env               # credenciais locais (ignorado pelo Git, ver .env.example)
├── run_tests.sh        # carrega o .env e roda os testes (macOS/Linux)
├── run_tests.ps1        # carrega o .env e roda os testes (Windows)
├── requirements.txt
└── README.md
```

---

## Problemas comuns

### `python`, `git` ou `robot` não reconhecido como comando

Reinstale a ferramenta correspondente garantindo que a opção de adicionar ao PATH esteja marcada, depois feche e abra um novo terminal.

### Erro de política de execução ao ativar o venv

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

### `robot` não reconhecido mesmo com o pacote instalado

Use a forma via módulo Python, que é mais confiável no Windows:

```powershell
python -m robot tests/
```

### Erro ao copiar `venvlauncher.exe` durante criação do venv

Geralmente causado por antivírus. Adicione a pasta do projeto como exceção no antivírus, ou tente rodar o terminal como Administrador.

### `ModuleNotFoundError: No module named 'Browser'`

Reinstale a biblioteca dentro do venv ativado:

```powershell
pip install robotframework-browser
python -m Browser.entry init
```

### `Environment variable '%{PV_EMAIL}' not found`

As variáveis de ambiente `PV_EMAIL` e `PV_PASSWORD` não foram configuradas. Veja a seção [Variáveis de ambiente](#variáveis-de-ambiente).

### `./run_tests.sh` abre o arquivo em vez de executar (Windows)

`run_tests.sh` é um script bash e não roda nativamente no Windows fora do Git Bash/WSL. Use `.\run_tests.ps1` no PowerShell — veja [Executando os testes](#executando-os-testes).

---

## Fluxo de trabalho com Git

```powershell
git pull                          # Atualiza com o que tem no GitHub
# ... faça suas alterações ...
git add .
git commit -m "descrição da alteração"
git push                          # Envia para o GitHub
```