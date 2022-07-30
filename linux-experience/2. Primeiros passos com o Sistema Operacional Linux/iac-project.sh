#!/bin/bash

# Array of directories
directories=("/adm" "/ven" "/sec" "/publico")

# Array of groups
groups=(GRP_ADM GRP_VEN GRP_SEC)

# Array of users
users=(carlos maria joao debora sebastiana roberto josefina amanda rogerio)

echo "[*] Creating directories..."

for dir in ${directories[@]}; do
    mkdir $dir
done

echo "[*] Creating groups..."

for group in ${groups[@]}; do
    groupadd $group
done

echo "[*] Creating users..."

group_user=""
for i in ${!users[@]}; do
    if [[ $i>=0 && $i<=2 ]]; then
	group_user=${groups[0]}
    elif [[ $i>=3 && $i<=5 ]]; then
	group_user=${groups[1]}
    elif [[ $i>=6 && $i<=8 ]]; then
	group_user=${groups[2]}
    fi

    useradd ${users[$i]} -m -s /bin/bash -p $(echo Senha123 | openssl passwd --stdin) -G $group_user
done

echo "[*] Reseting users passwords after first login..."

for user in ${users[@]}; do
    passwd $user -e
done

echo "[*] Adding owner and group permissions..."

for i in ${!groups[@]}; do
    for j in ${!directories[@]}; do
	if [ $i == $j ]; then
            chown root:${groups[$i]} ${directories[$j]}
	fi
    done
done

echo "[*] Adding read, write and execution permissions..."

index=0
for i in ${!directories[@]}; do
    chmod 770 ${directories[$i]}
    if [ ${directories[$i]} == "/publico" ]; then
	index=$i
    fi
done

chmod 777 ${directories[$index]}

echo "[!] IaC script run sucessfully."
