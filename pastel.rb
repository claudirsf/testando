class Pastel 
    def initialize(cliente)
        @cliente = cliente
        @vlpastel = 0
        @recheios = []
    end
    
    def colocarecheio(recheio)
        case recheio 
            when Recheio
                @recheios << recheio
            else
                puts "nao da"
        end
    end
    
    def calcpastel
        for recheio in @recheios
           @vlpastel = @vlpastel + recheio.valor
        end
    end
    
    def listar
       puts "Pastel de: #{@cliente}"
       for recheio in @recheios
           recheio.mostrarsabor
           a = recheio.valor
           @vlpastel += a
       end
       puts "valor do pastel: #{@vlpastel}0 R$"
    end
    
    
end

class Recheio
    
    def initialize(sabor,valor)
        @sabor = sabor
        @valor = valor
    end

    def mostrarsabor
        puts "Recheio: #{@sabor}"
        puts "Valor: #{@valor}0 R$"
    end
    
    def valor
        @valor
    end
    
end

p1 = Pastel.new("Claudir")
p2 = Pastel.new("Tayanne")
cp = Recheio.new("Catupiry",2.5)
ch = Recheio.new("Cheddar",2.5)
ca = Recheio.new("Carne",1.5)
fr = Recheio.new("Frango",1.5)
li = Recheio.new("Linguiça",1.5)
p1.colocarecheio(cp)
p1.colocarecheio(ch)
p1.colocarecheio(li)
p1.colocarecheio(ca)
p1.listar

p2.colocarecheio(ca)
p2.colocarecheio(fr)
p2.colocarecheio(li)
p2.listar
