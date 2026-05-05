#!/bin/sh

echo "=== Obteniendo variables desde Vault (.149) ==="

SECRETS=$(wget -q -O - \
  --header="X-Vault-Token: $VAULT_TOKEN" \
  http://172.24.99.149:8200/v1/secret/data/smarttwinlabs/qa)

export DATABASE_URL=$(echo $SECRETS | jq -r '.data.data.DATABASE_URL')
export JWT_SECRET=$(echo $SECRETS | jq -r '.data.data.JWT_SECRET')
export JWT_REFRESH_TOKEN_SECRET=$(echo $SECRETS | jq -r '.data.data.JWT_REFRESH_TOKEN_SECRET')
export JWT_EXPIRATION_TIME=$(echo $SECRETS | jq -r '.data.data.JWT_EXPIRATION_TIME')
export JWT_REFRESH_TOKEN_EXPIRATION_TIME=$(echo $SECRETS | jq -r '.data.data.JWT_REFRESH_TOKEN_EXPIRATION_TIME')
export SUPABASE_URL=$(echo $SECRETS | jq -r '.data.data.SUPABASE_URL')
export SUPABASE_ANON_KEY=$(echo $SECRETS | jq -r '.data.data.SUPABASE_ANON_KEY')
export S3_ACCESS_KEY=$(echo $SECRETS | jq -r '.data.data.S3_ACCESS_KEY')
export S3_SECRET_KEY=$(echo $SECRETS | jq -r '.data.data.S3_SECRET_KEY')
export S3_REGION=$(echo $SECRETS | jq -r '.data.data.S3_REGION')
export NODE_ENV=$(echo $SECRETS | jq -r '.data.data.NODE_ENV')

echo "=== Variables obtenidas de Vault ==="
echo "NODE_ENV:          $NODE_ENV"
echo "DATABASE_URL:      $DATABASE_URL"
echo "JWT_SECRET:        $JWT_SECRET"
echo "SUPABASE_URL:      $SUPABASE_URL"
echo "S3_REGION:         $S3_REGION"
echo "===================================="