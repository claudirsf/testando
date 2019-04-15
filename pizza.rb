class Pizza 
    
    def initialize(cliente)
        @cliente = cliente
        @valor = 10.00
        @sabores = []
    end
    
    def add_sabor(sabor)
        case sabor
            when Sabor
                @sabores << sabor
                @valor = @valor + sabor.valor
                puts "sabor #{sabor.sabor} adicionado na pizza de #{@cliente}"
                valorpizza
        else
            puts "não é um sabor valido"
        end
    end
    
    def listar
       puts "Pizza de: #{@cliente}"
       for sabor in @sabores
           sabor.mostrar
       end
       puts "valor da pizza : #{@valor}0 R$"
    end

    def valorpizza
        puts "pizza valendo #{@valor}0 R$"
    end

end

class Sabor

    def initialize(sabor,valor)
        @sabor = sabor
        @valor = valor
    end
    
    def mostrar
       puts "#{@sabor}" 
    end
   
    attr_reader:sabor
    attr_reader:valor  

end

mussarela = Sabor.new("mussarela",5.00)
cheddar = Sabor.new("cheddar",5.00)
pizza = Pizza.new("Claudir")
pizza.add_sabor(mussarela)
pizza.add_sabor(cheddar)
pizza.listar