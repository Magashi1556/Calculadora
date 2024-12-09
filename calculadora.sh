#!/bin/bash

echo "Olá! É um prazer tê-lo aqui."
read -p "Para começarmos, por favor, digite seu nome: " nome

while true; do
	read -p "Deseja Calcular? Digite 'S' para sim e 'N' para não: " resposta
	resposta=$(echo "$resposta" | tr '[:upper:]' '[:lower:]')
	if [[ "$resposta" == "s" || "$resposta" == "sim" ]]; then
		echo "Vamos continuar."
		break
	elif [[ "$resposta" == "n" || "$reposta" == "não" ]]; then
		echo "Até outra hora."
		exit 0
	else
		echo "Caracter Inválido. Encerando o programa."
		exit 1
	fi
done

while true; do
	read -p "Digite o primeiro valor: " num1
	echo -e "Escolha:\n'+' para soma.\n'-' para subtração.\n'*' para multiplicação.\n'/' para dividir."
	read -p "Digite a operação que deseja calcular: " op
	read -p "Digite o segundo valor: " num2

	case "$op" in
    "+")
        result=$(echo "$num1 + $num2" | bc -l)
        ;;
    "-")
        result=$(echo "$num1 - $num2" | bc -l)
        ;;
    "*")
        result=$(echo "$num1 * $num2" | bc -l)
        ;;
    "/")
        if [[ "$num2" == 0 ]]; then
            echo "Erro: Divisão por zero não é permitida."
            continue
        fi
        result=$(echo "$num1 / $num2" | bc -l)
        ;;
    *)
        echo "Operação não reconhecida."
        continue
        ;;
esac

	echo "Olá, $nome, aqui esta seu cálculo: $num1 $op $num2 = $result"

	read -p "Deseja realizar outra operação? (S/N): " continuar
	continuar=$(echo "$continuar" | tr '[:upper:]' '[:lower:]')
	if [[ "$continuar" == "s" || "$continuar" == "sim" ]]; then
		continue
	elif [[ "$continuar" == "n" || "$continuar" == "não" ]]; then
		echo "Até a próxima!"
		break
	else
		echo "Caracter invalido. Reiniciando o programa."
	fi
done

