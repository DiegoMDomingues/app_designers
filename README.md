# App Designers

App Flutter para o time de design experimentar direto no app usando o Claude Code.
Já sabe conectar nos sensores Oxistar e Bodystar e mostrar os dados ao vivo; o resto é para ser criado.
Não é o app oficial. Veja `CLAUDE.md` para estrutura e regras.

## Primeiros passos
1. Ter acesso ao repositório privado `biologixsistemas/biologix-base-lib` no GitHub (chave SSH configurada).
2. Ter a pasta de chaves da Biologix com `maven-repo/maven.properties` (acesso aos pacotes Android), pedir à Tecnologia. O F5 procura essa pasta em `C:\Users\<seu usuário>\Keys` (ver `.vscode/launch.json`).
3. No Windows, ligar o Modo de Desenvolvedor (Configurações > Sistema > Para desenvolvedores). Sem ele o `fvm use` falha com "Cannot create link".
4. Instalar o FVM (e colocar `%LOCALAPPDATA%\Pub\Cache\bin` no PATH), rodar `fvm use` e depois `fvm flutter pub get`.
5. Ligar um celular Android no USB (com depuração USB ativada) e apertar F5 no VS Code.
