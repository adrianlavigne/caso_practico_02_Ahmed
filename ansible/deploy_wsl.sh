#!/bin/bash

echo "[1] crear archivos de conexión a azure kubernetes service"
az aks get-credentials --resource-group jn-casopractico02 --name aks1

echo ""
echo "[2] copiar a mi wsl home" 
sudo cp -rf /mnt/c/Users/aigahm/.kube /home/jose

echo ""
echo "[3] crear máquina virtual en azure con servidor web apache"
ansible-playbook playbook_vm.yaml -i inventory_vm

echo ""
echo "[4] crear servidor web nginx en azure kubernetes"
ansible-playbook playbook_aks.yaml




