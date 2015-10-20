###############################
# CYK by Marlon e Christopher #
###############################

$Palava = "abaab"

$TerminalUnico = Hash.new
$TerminalUnico["b"] = ["S"]
$TerminalUnico["a"] = ["A"]

$TerminalDupla = Hash.new
$TerminalDupla["AS"] = ["S","A"]
$TerminalDupla["AA"] = ["S"]
$TerminalDupla["SA"] = ["A"]


$Verificador = $TerminalUnico["A"]


$Tabela = []

# Inicializar tabela

for i in 0..$Palava.size-1

	$Tabela[i] = []

end

# Iniciar valores na lista

for i in 0..$Palava.size-1
	linha = $Tabela[$Palava.size-1]
	linha[i] = $TerminalUnico[$Palava[i]]
end

for i in (0..$Palava.size-2).to_a.reverse
	for a in (0..$Palava.size-2).to_a.reverse
		if (i >= a)
			$Tabela[i][a] = []
		end
	end
end

print $Tabela[0].to_s


