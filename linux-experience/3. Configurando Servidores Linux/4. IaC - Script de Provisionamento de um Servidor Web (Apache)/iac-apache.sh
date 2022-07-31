#!/bin/bash

# Atribuindo variáveis
DIR_SITE=linux-site-dio-main
DIR_APACHE=/var/www/html

echo "[*] Atualizando o sistema operacional..."

apt update
apt upgrade -y

echo "[*] Instalando o servidor web apache..."

apt install apache2 -y

echo "[*] Instalando o Unzip..."

apt install unzip -y

echo "[*] Download do site de exemplo..."

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -O /tmp/main.zip

echo "[*] Descompactando os arquivos e excluindo o zip..."

unzip /tmp/main.zip
rm /tmp/main.zip

echo "[*] Excluindo página web padrão do apache..."

rm $DIR_APACHE/index.html

echo "[*] Copiando os arquivos do site de exemplo para o diretório padrão do apache..."

cp /tmp/$DIR_SITE/* $DIR_APACHE

echo "[!] Script IaC servidor Web Apache foi finalizado com sucesso."
