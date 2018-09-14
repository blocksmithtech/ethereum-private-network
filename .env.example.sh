export ENV=example

export TF_VAR_env=$ENV
export TF_VAR_aws_access_key=...
export TF_VAR_aws_secret_key=...

export TF_VAR_key_pair_file=./ethereum-pnw-$ENV.pem

echo "Exported TF_VAR_* ENV vars for $TF_VAR_env"
