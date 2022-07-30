#!/bin/bash

# Array of directories
directories=("/adm" "/ven" "/sec" "/publico")

# Array of groups
groups=(GRP_ADM GRP_VEN GRP_SEC)

# Array of users
users=(carlos maria joao debora sebastiana roberto josefina amanda rogerio)

echo "[*] Removing directories..."

for dir in ${directories[@]}; do
    rm -rf $dir
done

echo "[*] Removing users..."

for user in ${users[@]}; do
    userdel -rf $user
done

echo "[*] Removing groups..."

for group in ${groups[@]}; do
    groupdel $group
done

echo "[!] Script remove all IaC configuration sucessfully."
