#============================================#
#    Automato Finito não Deterministico 2.0  #
#           FLA UDESC BCC 2015.2             #
#--------------------------------------------#
#   Made with ♥ by:                          #
#               Marlon Henry Schweigert      #
#============================================#
#   ◆ Configuração                           #
#--------------------------------------------#
# UPDATE
#	Compatível com RUBY 2015.5 (3.64)
#		LENGHT -> SIZE
def main ()
	# Variavel global de estados
	$estados = ["q0", "q1", "q2"]
	# Variavel global do alfabeto
	$alfabeto = ["a", "b"]
	# Variavel global para o inicio
	$inicio = $estados[0]
	# Variavel global para o fim
	$final = [$estados[2]]
	# Variavel global para a função programa
	$funcao_programa = [ 
				 [ $estados[0], $alfabeto[0], $estados[1] ],
			     [ $estados[1], $alfabeto[1], $estados[1] ],
			     [ $estados[1], $alfabeto[0], $estados[1] ],
			     [ $estados[1], $alfabeto[0], $estados[2] ]
			   ]
	# Ler texto
	a = scanf("%s")
	# Imprimir resposta
	puts simular(a[0], [$inicio], 0).to_s
end


require 'scanf'

# Esta função verifica todos os deltas em busca de um compatível com o caminho exigido.
# Ex: Estado 1 leva a 2 com 'a', logo, estará dentro do retorno uma lista que conterá 'a'

def movimentos_possiveis(estado, token)
	ret = []
	cont = 0
	for i in $funcao_programa
		if i[0] == estado && i[1] == token
			ret[cont] = i
			cont = cont + 1
		end
	end
	ret
end

###############################################################################################################
# Simula o automato. Ele recebe a palavra, qual o passo e qual os estados que está sendo utilizado no momento.#
# Obs: Estados é uma lista, e não um unico objeto, logo, não se trata de Backtrack.			      #
###############################################################################################################

def simular(palavra, estados, movimento = 0)
	
	#   Verifica se o estado está na ultima letra e 
	# está em um estado final e retorna que o automato deu positivo!
	if palavra.size == movimento and not ($final & estados).empty?
		true
	#   Se não, verifica se o movimento já é o tamanho da palavra. Como ele recusou a anterior,
	# ele não possúi estado final.
	elsif palavra.size == movimento
		false
	else
	
	#   Variaveis auxiliares	
	caractere = palavra[movimento]
	contador = 0
	pestados = ["ERROR_TOTALERROR"] # Inicializar uma lista, o estado "ERROR_TOTALERROR" servirá 
	# para verificar se foi adicionado algum em algum momento do loop. Se ele continuar sendo a primeira posição,
	# significará que nenhum movimento é possível de todos os estados que foram encontrados
	
	for i in estados
		for a in movimentos_possiveis(i,palavra[movimento])
			pestados[contador] = a[2]
			contador = contador + 1
		end
	end
	
	# Faz a verificação e incremento no movimento da fita.
	movimento = movimento + 1
	if pestados[0] == "ERROR_TOTALERROR"
		false
	end
	
	
	# Chama novamente com o próximo elemento da fita (movimento++)
	simular(palavra,pestados, movimento)

	end
end





main() # Chamar método main para iniciar algoritmo
