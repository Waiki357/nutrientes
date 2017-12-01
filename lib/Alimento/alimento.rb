require "Alimento/alimento"

#Clase Alimento que contiene el nombre, proteinas, glucidos y lipidos de un alimento
class Alimentos

    include Comparable

    #Inicializa los valores
    def initialize(nom, pro, glu, lip)
        @nombre, @proteinas, @glucidos, @lipidos = nom, pro, glu, lip
    end

    #Obtienes nombre del alimento
    def nombre_to_s
        @nombre
    end

    #Obtienes proteinas del alimento
    def proteinas_to_i
        @proteinas
    end

    #Obtienes glucidos del alimento
    def glucidos_to_i
        @glucidos
    end

    #Obtienes lipidos del alimento
    def lipidos_to_i
        @lipidos
    end

    #Obtienes toda la informacion del alimento
    def informacion_to_s
        "#{@nombre}: #{@proteinas}, #{@glucidos}, #{@lipidos}"
    end

    #Obtienes valor energetico del alimento
    def valor_energetico
        ((@proteinas*4)+(@glucidos*4)+(@lipidos*9))
    end

    #Funcion para el modulo comparable
    def <=>(other)
        self.valor_energetico <=> other.valor_energetico
    end
end

#Clase Grupo_alimentos que hereda de alimentos
class Grupo_alimentos < Alimentos

    #Inicializa los valores
    def initialize(nom, pro, glu, lip, grupo)
        super(nom, pro, glu, lip)
        @nombre_grupo = grupo
    end

    #Obtienes nombre del grupo del alimento
    def to_s
        @nombre_grupo
    end
end

class Alimento_IG < Alimentos

    include Enumerable
    #Inicializa los valores
    def initialize(nom, pro, glu, lip, valores)
        super(nom, pro, glu, lip)
        @ign = valores
    end

    def each
      yield @ign[0]
      yield @ign[1]
    end
end
