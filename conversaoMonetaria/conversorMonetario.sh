#!/bin/bash


#Site da API:
#https://exchangeratesapi.io/

echo $1
echo $2
echo $3

valor=`curl https://api.exchangeratesapi.io/latest?symbols=$1,$2 | jq ".rates.$2"`
echo $valor
echo $valor
echo $valor
echo `python -c "print $3 * $valor"`


