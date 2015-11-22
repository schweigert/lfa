###############################
# CYK by Marlon e Christopher #
###############################

$Palavra = 	"baaba"

$TerminalUnico = Hash.new
#$TerminalUnico["b"] = ["S"]
#$TerminalUnico["a"] = ["A"]

#$TerminalUnico["a"] = ["A", "C"]
#$TerminalUnico["b"] = ["B"]

puts "Digite os terminais ligados diretamente a caracteres."
puts "Exemplo:"
puts '["a"] = ["A","C"]'
puts '["b"] = ["B"]'
puts ""

loop{
	
	texto = gets
	if texto.size <= 1
		break
	end
	eval("$TerminalUnico"+texto.chomp)
	
}


$TerminalDupla = Hash.new
#$TerminalDupla["AS"] = ["S","A"]
#$TerminalDupla["AA"] = ["S"]
#$TerminalDupla["SA"] = ["A"]

#$TerminalDupla["AB"] = ["S","C"]
#$TerminalDupla["BC"] = ["S"]
#$TerminalDupla["BA"] = ["A"]
#$TerminalDupla["CC"] = ["B"]



puts "Digite os terminais ligados diretamente a dois terminais."
puts "Exemplo:"
puts '["AB"] = ["S","C"]'
puts '["BC"] = ["S"]'
puts '["BA"] = ["A"]'
puts '["CC"] = ["B"]'
puts ""
loop{
	
	texto = gets
	if texto.size <= 1
		break
	end
	eval("$TerminalDupla"+texto.chomp)
	
}

$Verificador = "S"

puts "Digite o terminal Verificador:"
puts "Exemplo:"
puts "S"
puts ""
$Verificador = gets.chomp

loop{

	puts "Digite a palavra para verificar"

	$Palavra = gets.chomp.to_s
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
				
				#if (i == $Palavra.size-2)
				#	$Tabela[i][a]=$TerminalDupla[[$Tabela[i+1][a], $Tabela[i+1][a+1]].join]
					
				
				#else
				
					for b in Range.new(0,$Palavra.size-i-2).to_a
						
					
						c = 0
						
						#esse if corrige o erro de campo nulo na tabela
						if($Tabela[$Palavra.size-b-1][a]!=nil&&$Tabela[i+1+b][a+1+b]!=nil)
						
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
				#end
			end
		end
	end

	for i in Range.new(0,$Tabela.size)
		puts $Tabela[i].to_s
	end

	puts $Tabela[0][0].to_a.include?($Verificador)
}