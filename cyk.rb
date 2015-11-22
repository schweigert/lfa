###############################
# CYK by Marlon e Christopher #
###############################




$Palavra = "abaab"

$TerminalUnico = Hash.new
#$TerminalUnico["b"] = ["S"]
#$TerminalUnico["a"] = ["A"]

puts("Escreva os simbolos terminais. Para finalizar a entrada se símbolos terminais da gramática, entre uma linha em branco.")
puts('Um exemplo é ["a"] = ["A"]')
loop{

	entrada = gets
	if (entrada.size == 1)
		break
	end
	
	eval("$TerminalUnico"+entrada) 
}
puts $TerminalUnico.to_s
$TerminalDupla = Hash.new
#$TerminalDupla["AS"] = ["S","A"]
#$TerminalDupla["AA"] = ["S"]
#$TerminalDupla["SA"] = ["A"]


puts("Digite a forma normal de Chomsky. Para terminar, entre uma linha em branco.")
puts('Um exemplo é ["AS"] = ["A","S"]')
loop{

	entrada = gets
	if (entrada.size == 1)
		break
	end
	
	eval("$TerminalDupla"+entrada) 
}
puts $TerminalDupla.to_s
$Verificador = "S"

puts("Digite o terminal Verificador:")
$Verificador = eval('"'+gets()+'"')

loop{

	puts("Digite a palavra para verificar:")
	$Palavra = gets.to_s


	
	$Tabela = []
	
	# Inicializar tabela

	for i in 0..$Palavra.size-1
		$Tabela[i] = []

	end

	# Iniciar valores na lista

	for i in 0..$Palavra.size-1
		$Tabela[$Palavra.size-1][i] = $TerminalUnico[$Palavra[i]]
	end



	for i in (0..$Palavra.size-2).to_a.reverse
		for a in (0..$Palavra.size-2).to_a
			if (i >= a)
			
				$Tabela[i][a] = []
				c=0
				
				if (i == $Palavra.size-2)
					$Tabela[i][a]=$TerminalDupla[[$Tabela[i+1][a], $Tabela[i+1][a+1]].join]
					
				
				else
				
					for b in Range.new(0,$Palavra.size-i-2).to_a
						
					
						c = 0
						
						while (c < $Tabela[$Palavra.size-b-1][a].size) do
							d = 0
							while (d < $Tabela[i+1+b][a+1+b].size) do
								for k in $TerminalDupla[[$Tabela[$Palavra.size-b-1][a][c], $Tabela[i+1+b][a+1+b][d]].join].to_a
									$Tabela[i][a] << k
								end


								d += 1
							end
							c += 1
						end
						
						$Tabela[i][a].uniq!
						
						
						
						
					
					
					end
				end
			end
		end
	end

	for i in Range.new(0,$Tabela.size)
		puts $Tabela[i].to_s
	end
	
	
	verdade = false
	for i in $Tabela[0][0]
		
		if i.to_s()[0]==$Verificador.to_s()[0]
		
			verdade = true
			break
		end
	end

	puts verdade.to_s
	$Tabela = Array.new
}