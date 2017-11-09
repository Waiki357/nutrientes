require "Alimento/alimento"

class Alimentos
    def initialize(nom, pro, glu, lip)
        @nombre, @proteinas, @glucidos, @lipidos = nom, pro, glu, lip
    end

    def nombre_to_s
        @nombre
    end

    def proteinas_to_i
        @proteinas
    end

    def glucidos_to_i
        @glucidos
    end

    def lipidos_to_i
        @lipidos
    end

    def informacion_to_s
        "#{@nombre}: #{@proteinas}, #{@glucidos}, #{@lipidos}"
    end

    def valor_energetico
        ((@proteinas*4)+(@glucidos*4)+(@lipidos*9))
    end
end
