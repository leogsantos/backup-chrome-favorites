# Backup de Favoritos do Navegador (PowerShell)

Script simples em PowerShell para realizar backup automático dos favoritos do navegador.

## Contexto de uso

Este projeto é especialmente útil em **ambientes corporativos**, onde:

- O login com contas pessoais (Google, etc.) não é permitido
- Os favoritos ficam armazenados apenas localmente
- Existe risco de perda de dados (formatação, troca de máquina, etc.)

---

## Como funciona

O script copia o arquivo de favoritos do navegador para um diretório definido pelo usuário.

O ideal é configurar o destino para uma pasta sincronizada com nuvem, como:

- OneDrive  
- Google Drive  
- SharePoint  

Assim, o backup será automaticamente enviado para a nuvem.

---

## Exemplo de script

```powershell
$source = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Bookmarks"
$destination = "C:\Backup\Chrome\Bookmarks_backup.json"

$destFolder = Split-Path $destination
if (!(Test-Path $destFolder)) {
    New-Item -ItemType Directory -Path $destFolder -Force
}

Copy-Item -Path $source -Destination $destination -Force
```

---

## Outros navegadores

Você pode adaptar facilmente o script para outros navegadores alterando o caminho de origem:

### Google Chrome

```
%LOCALAPPDATA%\Google\Chrome\User Data\Default\Bookmarks
```

### Microsoft Edge

```
%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Bookmarks
```

### Perfis adicionais

```
Profile 1
Profile 2
```

---

## Agendamento automático (Task Scheduler)

Recomendado configurar execução automática semanal:

1. Abrir o **Agendador de Tarefas**
2. Criar nova tarefa
3. Definir gatilho (ex: semanal)
4. Configurar ação:

```
Programa/script: powershell.exe
Argumentos: -ExecutionPolicy Bypass -File "C:\caminho\script.ps1"
```

---

## Observações

- O navegador pode bloquear o arquivo se estiver aberto
- O script sobrescreve o backup anterior
- Se necessário, considere versionamento por data

---

