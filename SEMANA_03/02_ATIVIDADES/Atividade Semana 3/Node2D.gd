extends Node2D # herda as características da classe Node2D

var listaAtributos = [10, 5, 6]
var listaNovosAtributos = []
# variáveis de lista que serão mostradas na tela (requisito da atividade)
var varForca = 0
var varInteligencia = 0
var varDestreza = 0
# variáveis de verificação (são usadas mais tarde no código)

func _process(delta):

	$Background.position.x -= 1
	if $Background.position.x == -1024:
		$Background.position.x = 0
# movimenta o background a cada frame do jogo

func _ready():

	$MostrarAtributos.hide()
	$MostrarAtributos.disabled = true
	
	$LineEdit.hide()
	$LineEdit.editable = false
	
	$LineEditFinal.hide()
	$LineEditFinal.editable = false
	
	$MostrarNovosAtributos.hide()
	$MostrarNovosAtributos.disabled = true
	
	$BotaoForca.hide()
	$BotaoDestreza.hide()
	$BotaoInteligencia.hide()
	
	$BotaoForca.disabled = true
	$BotaoDestreza.disabled = true
	$BotaoInteligencia.disabled = true
	# acima, desabilitei e tornei invisíveis todos os objetos que eu não queria que aparecessem logo no início
	
	$BotaoForca/TextoForca.text = "Força: " + str(listaAtributos[0])
	$BotaoInteligencia/TextoInteligencia.text = "Inteligência: " + str(listaAtributos[1])
	$BotaoDestreza/TextoDestreza.text = "Destreza: " + str(listaAtributos[2])
	# atribuindo os valores contidos na listaAtributos aos textos dos botões para que apareçam na tela (requisito 1)
	
	$TextoInicial.text = "Então você quer se aventurar na floresta perdida? \nTudo bem, se acha que está preparado..."
	$AnimationPlayer.play("TextoFinalRetorno")
	yield(get_tree().create_timer(0.1), "timeout")
	$AnimationPlayer.play("TextoInicialFadeIn")
	yield(get_tree().create_timer(6.0), "timeout")
	$AnimationPlayer.play("TextoInicialFadeOut")
	yield(get_tree().create_timer(3.0), "timeout")
	# código que define e anima o primeiro texto que aparece na tela
	
	$TextoInicial.text = "Recebi essa lista classificando seus atributos. Nem olhei ainda..."
	$AnimationPlayer.play("TextoInicialFadeIn")
	yield(get_tree().create_timer(3.5), "timeout")
	# define e anima o segundo texto
	
	$MostrarAtributos.disabled = false
	$MostrarAtributos.show()
	# aqui o botão pressionado para revelar os atributos é disponibilizado 

func _on_MostrarAtributos_pressed():
# define o que acontece quando o botão que revela os atributos é precionado

	$MostrarAtributos.disabled = true
	$MostrarAtributos.hide()
	# logo depois de ser pressionado, o botão se torna inacessível e invisível de novo
	
	$AnimationPlayer.play("TextoInicialFadeOut")
	yield(get_tree().create_timer(2.0), "timeout")
	# o texto que estava na tela some
	
	$BotaoForca.show()
	$BotaoInteligencia.show()
	$BotaoDestreza.show()
	# os botões que estão com os elementos da listaAtributos aparecem, ainda inacessíveis
	
	$TextoInicial.text = "10 DE FORÇA?! Até parece! Quem foi que\n escreveu isso aqui?"
	$AnimationPlayer.play("AtributosFadeIn")
	yield(get_tree().create_timer(3.0), "timeout")
	$AnimationPlayer.play("AtributosFadeOut")
	yield(get_tree().create_timer(1.0), "timeout")
	# mais animação de novas linhas de texto
	
	$TextoInicial.text = "Sinceramente, não sei nem se acredito nos outros atributos.\n Quer saber? Escreve você seus atributos, com honestidade!"
	$AnimationPlayer.play("AtributosFadeIn")
	yield(get_tree().create_timer(5.0), "timeout")
	$AnimationPlayer.play("AtributosFadeOut")
	# mais animação de novas linhas de texto
	
	$BotaoForca.disabled = false
	$BotaoInteligencia.disabled = false
	$BotaoDestreza.disabled = false
	$BotaoForca/TextoForca.text = $BotaoForca/TextoForca.text + "\n Clique para alterar"
	$BotaoInteligencia/TextoInteligencia.text = $BotaoInteligencia/TextoInteligencia.text + "\n Clique para alterar"
	$BotaoDestreza/TextoDestreza.text = $BotaoDestreza/TextoDestreza.text + "\n Clique para alterar"
	# botões que contêm os elementos da listaAtributos se tornam acessíveis e indicam a ação a ser tomada (clicar)


func _on_BotaoForca_pressed():
# define o que acontece quando o botão que contém o primeiro elemento da listaAtributos é pressionado

	$LineEdit/TextoEdit.text = "Insira o novo valor\n (confirme com Enter)"
	$LineEdit.editable = true
	$LineEdit.show()
	# aparece o campo para input de digitação do jogador, indicando o que deve ser digitado e como dar input
	
	$BotaoForca.disabled = true
	varForca = 1
	# o botão se torna inacessível e a variável de verificação correspondente a ele é alterada


func _on_BotaoInteligencia_pressed():
# define o que acontece quando o botão que contém o segundo elemento da listaAtributos é pressionado

	$LineEdit/TextoEdit.text = "Insira o novo valor\n (confirme com Enter)"
	$LineEdit.editable = true
	$LineEdit.show()
	# aparece o campo para input de digitação do jogador, indicando o que deve ser digitado e como dar input
	
	$BotaoInteligencia.disabled = true
	varInteligencia = 1
	# o botão se torna inacessível e a variável de verificação correspondente a ele é alterada


func _on_BotaoDestreza_pressed():
# define o que acontece quando o botão que contém o tericeiro elemento da listaAtributos é pressionado

	$LineEdit/TextoEdit.text = "Insira o novo valor\n (confirme com Enter)"
	$LineEdit.editable = true
	$LineEdit.show()
	# aparece o campo para input de digitação do jogador, indicando o que deve ser digitado e como dar input
	
	$BotaoDestreza.disabled = true
	varDestreza = 1
	# o botão se torna inacessível e a variável de verificação correspondente a ele é alterada


func _on_LineEdit_focus_entered():
# define o que acontece quando o campo de digitação ganha o foco do teclado (ou seja, quando é clicado)

	$LineEdit/TextoEdit.text = ""
	# texto existente é apagado


func _on_LineEdit_text_entered(new_text):
# define o que acontece quando o texto digitado é enviado (quando tecla Enter é pressionada)

	if listaNovosAtributos.size() == 0:
		listaNovosAtributos.insert(0, new_text)
		if varForca == 1:
			varForca = 0
			$BotaoForca/TextoForca.text = "Força: " + str(listaNovosAtributos[0])
		elif varInteligencia == 1:
			varInteligencia = 0
			$BotaoInteligencia/TextoInteligencia.text = "Inteligência: " + str(listaNovosAtributos[0])
		elif varDestreza == 1:
			varDestreza = 0
			$BotaoDestreza/TextoDestreza.text = "Destreza: " + str(listaNovosAtributos[0])
	# condicionais que inserem o primeiro texto digitado na listaNovosAtributos e modificam o texto do botão
	# correspondente (requisito 2), retornando a respectiva variável de verificação ao estado original para 
	# futuras verificações
	
	elif listaNovosAtributos.size() == 1:
		if varForca == 1:
			listaNovosAtributos.insert(0, new_text)
			varForca = 0
			$BotaoForca/TextoForca.text = "Força: " + str(listaNovosAtributos[0])
		elif varInteligencia == 1:
			listaNovosAtributos.insert(1, new_text)
			varInteligencia = 0
			$BotaoInteligencia/TextoInteligencia.text = "Inteligência: " + str(listaNovosAtributos[1])
		elif varDestreza == 1:
			listaNovosAtributos.insert(1, new_text)
			varDestreza = 0
			$BotaoDestreza/TextoDestreza.text = "Destreza: " + str(listaNovosAtributos[1])
	# condicionais que inserem o segundo texto digitado na listaNovosAtributos e modificam o texto do botão
	# correspondente (requisito 2), retornando a respectiva variável de verificação ao estado original para 
	# futuras verificações
			
	elif listaNovosAtributos.size() == 2:
		if varForca == 1:
			listaNovosAtributos.insert(0, new_text)
			varForca = 0
			$BotaoForca/TextoForca.text = "Força: " + str(listaNovosAtributos[0])
		elif varInteligencia == 1:
			listaNovosAtributos.insert(1, new_text)
			varInteligencia = 0
			$BotaoInteligencia/TextoInteligencia.text = "Inteligência: " + str(listaNovosAtributos[1])
		elif varDestreza == 1:
			listaNovosAtributos.insert(2, new_text)
			varDestreza = 0
			$BotaoDestreza/TextoDestreza.text = "Destreza: " + str(listaNovosAtributos[2])
	# condicionais que inserem o terceiro texto digitado na listaNovosAtributos e modificam o texto do botão
	# correspondente (requisito 2), retornando a respectiva variável de verificação ao estado original para 
	# futuras verificações
			
	$LineEdit.editable = false
	$LineEdit.text = ""
	$LineEdit/TextoEdit.text = "Valor alterado!"
	yield(get_tree().create_timer(1.0), "timeout")
	$LineEdit.hide()
	# animação que ocorre toda vez depois que algum dos três textos é digitado, fazendo o campo de digitação
	# ficar invisível e inacessível
	
	novos_atributos(listaNovosAtributos)
	# chama a função novos_atributos, oferecendo a listaNovosAtributo como argumento

func novos_atributos(arg: Array):
# define a função novos_atributos (criada para retornar um texto na tela, como proposto no requisito 3)

	if arg.size() == 3:
		$MostrarNovosAtributos/TextoNovosAtributos.text = "Exibir novos atributos"
		$MostrarNovosAtributos.disabled = false
		$MostrarNovosAtributos.show()
	# condicional que define o que acontecerá quando a listaNovosAtributos estiver completa (com 3 elementos)
	

func _on_MostrarNovosAtributos_pressed():
# define o que acontecerá quando o botão MostrarNovosAtributos, que está disponível agora por causa da função
# novos_atributos, for pressionado

	$BotaoForca.hide()
	$BotaoInteligencia.hide()
	$BotaoDestreza.hide()
	$MostrarNovosAtributos.hide()
	$MostrarNovosAtributos.disabled = true
	# esconde os botões que estavam na tela
	
	$TextoInicial.text = "Ok, avalie-se como quiser. Os verdadeiros valores\n nós vamos ver dentro da selva. Vamos lá!"
	$AnimationPlayer.play("AtributosFadeIn")
	yield(get_tree().create_timer(5.0), "timeout")
	$AnimationPlayer.play("TextoInicialFadeOut")
	yield(get_tree().create_timer(3.0), "timeout")
	$TextoInicial.text = "- Depois de um tempo desbravando a floresta perdida,\n vocês são emboscados por um grupo de nativos."
	$AnimationPlayer.play("TextoInicialFadeIn")
	yield(get_tree().create_timer(5.0), "timeout")
	$AnimationPlayer.play("AtributosFadeOut")
	yield(get_tree().create_timer(1.0),"timeout")
	$TextoInicial.text = "O que você fará agora?"
	$AnimationPlayer.play("AtributosFadeIn")
	yield(get_tree().create_timer(2.0), "timeout")
	# animações de linhas de texto que aparecem na tela
	
	$LineEditFinal/TextoEditFinal.text = 'Digite sua reação\n (sugestão: "Fugir")'
	$LineEditFinal.show()
	$LineEditFinal.editable = true
	# mais um campo de digitação é disponibilizado na tela, especificando o que deve ser feito pelo jogador

func _on_LineEditFinal_focus_entered():
# define o que acontecerá quando o foco do teclado entrar no campo de digitação

	$LineEditFinal/TextoEditFinal.text = ""
	# texto existente é apagado
	
func _on_LineEditFinal_text_changed(new_text):
# função que retorna o texto digitado no campo de digitação na tela a cada mudança no mesmo (cumprindo com o
# requisito 4)

	$TextoInicial.text = str(new_text)
	# altera o texto de acordo com as mudanças no texto no campo de digitação


func _on_LineEditFinal_text_entered(new_text):
# define o que acontece quando o texto digitado no campo de digitação é enviado (jogador apertou Enter)

	$LineEditFinal.hide()
	$LineEditFinal.editable = false
	# campo de digitação é escondido e se torna inacessível
	
	$AnimationPlayer.play("TextoFinal")
	yield(get_tree().create_timer(3.0), "timeout")
	$AnimationPlayer.play("TextoInicialFadeOut")
	yield(get_tree().create_timer(3.0), "timeout")
	$TextoInicial.text = "Sua ação foi inteligente, mas não adiantou.\n Você morreu."
	$AnimationPlayer.play("TextoFinalRetorno")
	yield(get_tree().create_timer(0.1), "timeout")
	$AnimationPlayer.play("TextoInicialFadeIn")
	yield(get_tree().create_timer(5.0), "timeout")
	$AnimationPlayer.play("AtributosFadeOut")
	yield(get_tree().create_timer(1.0), "timeout")
	$TextoInicial.text = "GAME OVER"
	$AnimationPlayer.play("TextoFinal")
	yield(get_tree().create_timer(3.0), "timeout")
	$AnimationPlayer.play("AtributosFadeIn")
	# animação final das últimas linhas de texto



