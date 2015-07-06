# Server

Este script criará uma maquina virtual com os pacotes necessarios para funcionar o desenvolvimento.

Para iniciar a instalação, faça os seguintes passos

1 - Execute o comando init.sh. 

2 - Ao terminar a instalação, possivelmente sua tela estará cheia de letras coloridas e confusas, então, rode o comando clear 

3 - Para se conectar na VM, digite o comando vagrant ssh 

4 - A senha padrão é: vagrant

Para o melhor funcionamento, altere o arquivo Vagrantfile para que os arquivos do sistema, estejam visiveis no servidor web. Exemplo: config.vm.synced_folder "/path/do/seus/arquivos/locais", "/var/www/"

O Apache está apontando para o /var/www/public

O banco de dados do Postgresql não está com a estrutura de tabela do sistema, isso deve ser feito manualmente. O usuario e senha é o mesmo de desenvolvimento.
