#============================================#
#    Automato com Pilha não Deterministico   #
#                    FLA                     #
#--------------------------------------------#
#   Made with ♥ by:                          #
#               Marlon Henry Schweigert      #
#               Christopher Renkavieski      #
#============================================#
#   ◆ Configuração                           #
#--------------------------------------------#
$Delta = Struct.new(:Saida, :CaractereEscrita, :Desempilha, :Empilha, :Chegada)


$Alfabeto = ['a','b']
$Estados = ['q0', 'q1']
$Inicio = $Estados[0]
$Estados_Finais = [$Estados[1]]
$Alfabeto_Pilha = ['B']

$Funcao_Programa = [
                    $Delta.new($Estados[0], $Alfabeto[0], nil, $Alfabeto_Pilha[0], $Estados[0]),
					$Delta.new($Estados[0], $Alfabeto[1], $Alfabeto_Pilha[0], nil, $Estados[1]),
					$Delta.new($Estados[1], $Alfabeto[1], $Alfabeto_Pilha[0], nil, $Estados[1]),
                   ]

$Pilha_Inicial = []
$FitaInicial = "aabb"
				   
def CaminhosPossiveis(pilha, fita, estado, posicao_fita)

	topoDaPilha = pilha.pop
	pilha.push(topoDaPilha)
	topoDaFita = fita[posicao_fita]
	
	for i in $Funcao_Programa
		if i.Saida == estado and (i.CaractereEscrita == topoDaFita or i.CaractereEscrita == nil) and (topoDaPilha == i.Desempilha or i.Desempilha == nil)
			puts i.to_s
		end
	end
	

end

