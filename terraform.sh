#!/bin/bash

# Para executar o script:
# ./terraform.sh <acao-terraform>  <datacenter>
# acao-terraform = {plan | apply | destroy}
# datacenter: dca ou dcb

apply_dc() {
    cd terraform/prod/redis-$2
    terraform $1 \
    -var-file="../../dc/$2-prod.tfvars" \
    -var-file="../../service/redis/variables.tfvars" \
    -state="../systems/$2/terraform.tfstate"
}

plan_dc() {
    cd terraform/prod/redis-$2
    terraform $1 \
    -var-file="../../dc/$2-prod.tfvars" \
    -var-file="../../service/redis/variables.tfvars" \
    -state="../systems/$2/terraform.tfstate"
}

destroy_dc() {
    cd terraform/prod/redis-$2
    terraform $1 \
    -var-file="../../dc/$2-prod.tfvars" \
    -var-file="../../service/redis/variables.tfvars" \
    -state="../systems/$2/terraform.tfstate"
}

if [[ "$1" == "apply" ]]; then
    apply_dc
elif [[ "$1" == "destroy" ]]; then
    destroy_dc
elif [[ "$1" == "plan" ]]; then
    plan_dc
else
    echo "Opção Inválida"
fi