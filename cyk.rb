###############################
# CYK by Marlon e Christopher #
###############################

$Palava = 	"abaab"

$TerminalUnico = Hash.new
$TerminalUnico["b"] = ["S"]
$TerminalUnico["a"] = ["A"]

$TerminalDupla = Hash.new
$TerminalDupla["AS"] = ["S","A"]
$TerminalDupla["AA"] = ["S"]
$TerminalDupla["SA"] = ["A"]


$Verificador = "S"


$Tabela = []

# Inicializar tabela

for i in 0..$Palava.size-1
	$Tabela[i] = []

end

# Iniciar valores na lista

for i in 0..$Palava.size-1
	$Tabela[$Palava.size-1][i] = $TerminalUnico[$Palava[i]]
end



for i in (0..$Palava.size-2).to_a.reverse
	for a in (0..$Palava.size-2).to_a
		if (i >= a)
		
			$Tabela[i][a] = []
			c=0
			
			if (i == $Palava.size-2)
				$Tabela[i][a]=$TerminalDupla[[$Tabela[i+1][a], $Tabela[i+1][a+1]].join]
				
			
			else
			
				for b in Range.new(0,$Palava.size-i-2).to_a
					
				
					c = 0
					
					while (c < $Tabela[$Palava.size-b-1][a].size) do
						d = 0
						while (d < $Tabela[i+1+b][a+1+b].size) do
							for k in $TerminalDupla[[$Tabela[$Palava.size-b-1][a][c], $Tabela[i+1+b][a+1+b][d]].join].to_a
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

puts $Tabela[0][0].to_a.include?($Verificador)
