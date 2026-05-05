#!/bin/sh

echo "=== Obteniendo variables desde Vault (.149) ==="

SECRETS=$(wget -q -O - \
  --header="X-Vault-Token: $VAULT_TOKEN" \
  http://172.24.100.149:8200/v1/secret/data/smarttwinlabs/qa)

echo "Respuesta de Vault: $SECRETS"

export VARIABLE_1=$(echo $SECRETS | jq -r '.data.data.VARIABLE_1')
export VARIABLE_2=$(echo $SECRETS | jq -r '.data.data.VARIABLE_2')

echo "=== Variables obtenidas de Vault ==="
echo "VARIABLE_1: $VARIABLE_1"
echo "VARIABLE_2: $VARIABLE_2"
echo "===================================="