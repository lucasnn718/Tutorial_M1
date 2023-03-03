extends Node2D
#comentei partes erradas do código e expliquei o erro ao lado delas (após "///")

var nome = "Joto"
#var teste = false /// não tive que usar / não entendi o propósito
#var valor = 0 /// não tive que usar / não entendi o propósito
#var número = 0 /// não se pode usar acentos, Godot não reconhece o caractere
var numero = 0
#lista = []  /// para criar uma lista, deve-se declarar como uma variável
var lista = []

func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	
	#numero = int(LineEdit.text) /// faltou o "$" para chamar o nó LineEdit corretamente
	numero = int($LineEdit.text)
	#$LineEdit.text = nome /// variável "nome" não estava declarada no código original
	$LineEdit.text = nome 
	
	
func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	for i in range(10):
		#Numero+=i
		#lista.append(Numero) /// variável não foi declarada com esse nome, a primeira letra é minúscula
		numero += i
		lista.append(numero)
	#$Label.text = numero /// é necessário transformar o valor da variável em uma string para botar no texto
	$Label.text = str(numero)


func _on_Button3_pressed():
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
	var cont = 0
	var i = 0
	#while(len(lista)): /// necessário limitar o loop "while" para que ele pare
	while(len(lista) > i):
		#cont=0 /// declarar fora do loop
		#i=0 /// declarar fora do loop
		if(lista[i]%2==1):
			cont+=1
		i += 1
	
		#if(cont!=0):
		#	nome = nome+"baldo"
		#$Label2.text = nome /// declarando essa parte dentro do loop, "baldo" será adicionado repetidamente ao nome
	if (cont != 0):
		nome += "baldo"
	$Label2.text = nome


