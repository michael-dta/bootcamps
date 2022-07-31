#!/bin/bash

echo "[*] Atualizando o sistema operacional..."

apt update
apt upgrade -y

echo -e "\n[*] Instalando o servidor web apache..."

apt install apache2 -y

echo -e "\n[*] Instalando o Unzip..."

apt install unzip -y

echo -e "\n[*] Download do site de exemplo..."

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo -e "\n[*] Descompactando os arquivos e excluindo o zip..."

unzip main.zip
rm main.zip

echo -e "\n[*] Excluindo página web padrão do apache..."

rm /var/www/html/index.html

echo -e "\n[*] Copiando os arquivos do site de exemplo para o diretório padrão do apache..."

cp -rv ./linux-site-dio-main/* /var/www/html/

echo -e "\n[!] Script IaC servidor Web Apache foi finalizado com sucesso."
