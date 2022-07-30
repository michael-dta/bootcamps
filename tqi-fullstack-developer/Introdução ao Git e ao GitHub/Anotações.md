# Principais comandos do Git

| Comando | Função |
|---|---|
| git init | Cria um repositório local vazio |
| git status | Verifica se há alterações feitas no repositório |
| git add * | Adiciona todas as alterações/arquivos no modo staging |
| git branch | Identifica o branch (ramo) ativado |
| git commit -m "COMENTÁRIO" | Salva as alterações/arquivos do staging para uma versão pronto para ser empurrada ao repositório remoto |
| git remote -v | Lista o caminho do repositório remoto |
| git checkout HASH | Move o HEAD para um nó específico dos commits |
| git checkout -b BRANCH | Cria um novo branch (ramo) |
| git reset --hard HEAD | Elimina o commit localizado no HEAD |
| git remote add <NAME> <HTTPS/SSH-PATH> | Adiciona novo repositório remoto ao repositório Git. Exemplo: git remote add origin <HTTPS/SSH-PATH>|
| git push origin main/master | Empurra o repositório local para o repositório remoto |
| git pull | Puxa o repositório remoto para o repositório local |
| git clone CAMINHO | Cria uma cópia de um repositório remoto para no host local |

