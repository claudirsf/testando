class Graficos
    def openbaloon
        puts"(-----------------)"
    end
    
    def drawline()
        puts"(  O   _    O   )"
    end
    
    def closeline
        openbaloon
    end
end

class Otaku
   def initialize(nome,idade,dinheiro)
       @nome = nome
       @idade = idade
       @dinheiro = dinheiro
       @videogames = []
       @animes = []
    end
    
    def dar_oi
        puts"oi eu sou o #{@nome} e tenho #{@dinheiro}"
    end
    
    def comprar(videogame)
        case videogame
            when Videogame
                if videogame.valor > @dinheiro
                    puts "nao pode comprar"
                else
                    puts "comprou #{videogame.nome} por #{videogame.valor}"

                    @videogames << videogame
                    @dinheiro -= videogame.valor
                end
            else
                puts"erro.."
            end
    end
    
    def vender(videogame)
         case videogame
            when Videogame
                @videogames -= [videogame]
                $aux = videogame.valor/2
                @dinheiro = @dinheiro + $aux
                puts "vendeu #{videogame.nome} por #{$aux}"
            else
                puts"erro.."
            end
    end
    
    def assistir(anime)
        case anime
            when Anime
                @animes << anime
            else
                puts "erro"
            end
    end
    
 
    
    def assistidos
        puts"ja assisti:"
        for anime in @animes
            anime.mostrar
        end
    end
    
    def colecao
        puts"eu tenho:"
        for videogame in @videogames
            videogame.mostrar
        end
    end
end

class Anime
    def initialize(nome,ano)
        @nome = nome
        @ano = ano
    end
    
    def mostrar
        puts "#{@nome} de #{@ano}"
    end   
    
    attr_reader:nome
    attr_reader:ano
end

class Videogame
    def initialize(nome,fabricante,valor)
        @nome = nome
        @fabricante = fabricante
        @valor = valor
    end
    
    def mostrar
       puts "#{@nome}" 
    end
    
    def jogar(jogo)
        puts "tentando jogar #{jogo.nome}"
        case jogo 
            when Jogo
                if jogo.sistema != @nome
                    puts "jogo #{jogo.nome} incompativel no #{@nome}"
                else
                    puts "jogando #{jogo.nome} no #{@nome}"
                end
            else
                puts"isso nao é um jogo"
        end
    end
    
    
    attr_reader:nome
    attr_reader:fabricante
    attr_reader:valor
end

class Jogo
    def initialize(nome,sistema)
        @nome = nome
        @sistema = sistema
    end
    
    attr_reader:nome
    attr_reader:sistema
        
end

gi = Graficos.new
otk = Otaku.new("Claudir",27,600)
a = Anime.new("DragonBall",1988)
b = Anime.new("Pokémon",1998)
ps2 = Videogame.new("Playstation 2","da Sony", 200)
gc = Videogame.new("GameCube","da Nintendo", 400)
gow = Jogo.new("God of War zica","Playstation 2")
mkdd = Jogo.new("Mario Kart Double Dash","GameCube")


gi.openbaloon
gi.drawline()
otk.dar_oi
gi.closeline
otk.assistir(a)
otk.assistir(b)
otk.assistidos
otk.comprar(ps2)
otk.comprar(gc)
otk.colecao
ps2.jogar(gow)
ps2.jogar(mkdd)
gc.jogar(mkdd)
otk.vender(gc)
otk.dar_oi
otk.colecao