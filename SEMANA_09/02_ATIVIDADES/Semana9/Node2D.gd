extends Node2D


func receber_numeros(listaDesordenada):

	var listaUsuario = listaDesordenada.split_floats(" ") #recebendo a lista pelo usuário
	
	$Label.text = "Sua lista desordenada: "
	for elem in listaUsuario:
		if elem != listaUsuario[-1]:
			$Label.text += str(elem) + ", "
		else:
			$Label.text += str(elem) + "."
		#mostrando a lista desordenada completando com cada elemento
		
	return listaUsuario #retornando a lista desordenada


func sortear(lista):
	for i in range(1, len(lista)): #iterando os elementos da lista

		var elem = lista[i] #elemento atual
		var a = i #criando uma variável secundária para poder trabalhar com o valor de i sem problemas

		while a>0 and elem < lista[a-1]: #verificando se o elemento atual é menor que seu antecessor

			lista[a] = lista[a-1] #se for, igualo o elemento a seu antecessor
			a -=1 #diminuo o valor de a para verficar o elemento anterior e prosseguir com o loop

		lista[a] = elem #trocando a posição do elemento iterado no loop "for" 

	$Label.text += "\nSua lista ordenada: "
	for item in lista:
		if item != lista[-1]:
			$Label.text += str(item) + ", "
		else:
			$Label.text += str(item) + ". "
		#mostrando a lista ordenada completando com cada elemento
		
	return lista #retornando a lista ordenada




func _on_LineEdit_text_entered(new_text):
	sortear(receber_numeros(new_text)) #printando a lista ordenada ao pressionar "Enter"
