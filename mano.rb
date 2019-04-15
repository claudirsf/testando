class Mano
    def initialize(nome,idade,dinheiro)
        @nome = nome
        @idade = idade
        @dinheiro = dinheiro
        @coisas = []
    end

    def falar
        puts "(:D) -> olá. eu sou o mano #{@nome} e tenho #{@idade} anos E #{@dinheiro} NO BOLSO!"
        listamochila
    end
    
    def comprar(algo)
        if algo.valor > @dinheiro
            puts "tu eh pobre nao pode comprar"
        else
        @coisas << algo
        @dinheiro -= algo.valor
        puts "comprou #{algo.marca}"
        puts "sobrou #{@dinheiro} reis"
        end
    end
    
    def usar(algo)
        case algo
        when Coisa
            puts"usando #{algo.marca}"
            @coisas -= [algo]
        else
            puts "nao da pra usar isso"
        end
    end
    
    def fumar(algo)
        if algo.is_a? Maconha
            usar(algo)
            puts "fumando um baseado, to doidão"
        end
        if algo.is_a? Cigarro
            usar(algo)
            puts "fumando um garro..."
        else
            puts "nao da pra fumar isso"
        end
    end 
    
    def vender(algo)
        if @coisas == [] 
            puts "não tem nada"
        else
            @dinheiro += algo.valor / 2
            @coisas -= [algo]
            puts " #{algo.marca} vendido"
        end
    end
    
    
    def listamochila
        puts "Coisas na mochila do : #{@nome}"
        puts "|-------------------------------|"
        if @coisas == []
            puts "vazio"    
        else    
            for coisa in @coisas
                puts"tem #{coisa.marca}"
            end
        end    
        puts"|-------------------------------|"
    end
end

class Coisa
    def initialize(marca,valor)
        @marca = marca
        @valor = valor
    end    
        attr_reader:marca
        attr_reader:valor
end

class Cigarro < Coisa
    def initialize(marca,valor)
        super(marca,valor)
    end
    

end

class Carro < Coisa
    def initialize(marca,valor)
        super(marca,valor)
    end
    
    def dirigir
        puts"vrum vrum"
    end
end


class Cerveja < Coisa
    def initialize(marca,valor)
        super(marca,valor)
    end
end

class Maconha < Coisa
    def initialize(qualidade,valor)
        super(qualidade,valor)
    end 
    
end

a = Mano.new("Nelson",22,50000)
cerva = Cerveja.new("Skol",4)
cigar = Cigarro.new("Eight",3)
carro = Carro.new("fusca",10000)
erva = Maconha.new("da massa",10)
a.vender(a)
a.falar
a.comprar(cerva)
a.comprar(cigar)
a.comprar(carro)
a.comprar(erva)
a.listamochila
carro.dirigir
a.listamochila
a.falar
a.fumar(cigar)
a.fumar(cerva)
a.falar
