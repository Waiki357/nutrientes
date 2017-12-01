require "spec_helper"
require 'benchmark'
require "./lib/Alimento/lista"
require "./lib/Alimento/alimento"

RSpec.describe Alimento_IG do
    before :all do

      ign_glucosa     = [[6.1,6.6,6.3,6.3,6.1,6.9,6.8,6.5,6.4,6.9,6.8,6.5,6.3,6.2,6.7,6.2,5.9,5.8,5.8,5.8,5.8,5.8,5.9,6.2,6.4],
                      [4.9,4.9,5.2,5.8,6.5,7.0,7.2,7.3,7.3,6.6,6.2,6.1,6.0,6.1,5.9,5.9,5.9,5.9,5.8,5.8,5.5,5.5,5.6,5.9,5.9]]
      ign_chocolate   = [[6.5,6.5,6.7,6.5,6.5,6.8,6.7,6.2,6.5,7.2,6.9,7.0,6.3,6.2,6.1,5.9,5.8,6.1,6.7,6.7,6.6,6.7,6.9,7.2,7.1],
                      [4.6,4.6,4.7,4.7,4.8,4.7,4.8,4.8,4.6,4.4,4.7,4.7,4.8,4.7,5.2,5.9,5.9,5.7,5.4,5.3,5.1,4.8,4.8,4.9,5.9]]

      @chocolate = Alimento_IG.new("Chocolate",5.3, 47.0, 30.0,  ign_chocolate)
      @glucosa = Alimento_IG.new("Glucosa", 3.8, 4.9, 3.8, ign_glucosa)

    end

     describe "Programacion funcional" do
        it "IG Chocolate" do

          #Individuo 1 Chocolate
          g0 = @chocolate.first.first
          gi = @chocolate.first.take(24).map { |i| ((i-g0)/2)*5 }
          gi_1 = @chocolate.first.drop(1).map { |e| ((e-g0)/2)*5  }

          aibc_1 = gi.inject(0){|sum,x| sum + x }
          aibc_1 += gi_1.inject(0){|sum,x| sum + x }

          #Individuo 2 Chocolate
          g1 = @chocolate.first(2).drop(1).first.first
          gi_2 = @chocolate.first(2).drop(1).first.take(24).map { |i| ((i-g1)/2)*5 }
          gi_1_2 = @chocolate.first(2).drop(1).first.drop(1).map { |e| ((e-g1)/2)*5 }

          aibc_2 = gi_2.inject(0){|sum,x| sum + x }
          aibc_2 += gi_1_2.inject(0){|sum,x| sum + x }

          #Glucosa
          g0 = @glucosa.first.first
          gi = @glucosa.first.take(24).map { |i| ((i-g0)/2)*5 }
          gi_1 = @glucosa.first.drop(1).map { |e| ((e-g0)/2)*5  }
          aibc_g = gi.inject(0){|sum,x| sum + x }
          aibc_g += gi_1.inject(0){|sum,x| sum + x }
          g1 = @glucosa.first(2).drop(1).first.first
          gi_2 = @glucosa.first(2).drop(1).first.take(24).map { |i| ((i-g1)/2)*5 }
          gi_1_2 = @glucosa.first(2).drop(1).first.drop(1).map { |e| ((e-g1)/2)*5  }
          aibc_g2 = gi_2.inject(0){|sum,x| sum + x }
          aibc_g2 += gi_1_2.inject(0){|sum,x| sum + x }

          ign_1 = (aibc_1/aibc_g)*100
          ign_2 = (aibc_2/aibc_g2)*100

          ig = (ign_1 + ign_2)/2
          expect(ig).to eq(33.21610855222208)

        end
    end
end

RSpec.describe Alimento do
    before :each do
        @huevo_frito = Alimentos.new("Huevo Frito",14.1, 0.0, 19.5)
        @leche_vaca = Alimentos.new("Leche Vaca", 3.3, 4.8, 3.2)
        @yogurt = Alimentos.new("Yogurt", 3.8, 4.9, 3.8)
        @cerdo = Alimentos.new("Cerdo",21.5, 0.0, 6.3)
        @ternera = Alimentos.new("Ternera",21.1, 0.0, 3.1)
        @pollo = Alimentos.new("Pollo", 20.6, 0.0, 5.6)
        @bacalao = Alimentos.new("Bacalao",17.7, 0.0, 0.4)
    end

    describe "Pruebas sobre alimentos" do
        it "Se almacena correctamente el nombre del huevo frito" do
            expect(@huevo_frito.nombre_to_s).not_to eq("Huevo frito")
        end

        it "Se almacena correctamente las proteinas de la ternera" do
            expect(@ternera.proteinas_to_i).to eq(21.1)
        end

        it "Se almacena correctamente los glucidos del bacalao" do
            expect(@bacalao.glucidos_to_i).to eq(0.0)
        end

        it "Se almacena correctamente los lipidos del yogurt" do
            expect(@yogurt.lipidos_to_i).to eq(3.8)
        end

        it "Informacion sobre el pollo" do
            expect(@pollo.informacion_to_s).to include("Pollo")
        end

        it "Valor energetico de la leche de vaca" do
            expect(@leche_vaca.valor_energetico).to eq(61.2)
        end
    end

    describe "Modulo comparable alimentos" do
        it "Cerdo <=> Ternera valor energetico" do
            expect(@cerdo < @ternera).to eq(false)
        end
    end

end

RSpec.describe Node do
    before :all do
        @node = Node.new("14",nil,nil)
    end
        describe "Pruebas sobre el nodo" do
            it "Debe existir un Nodo de la lista con sus datos, su anterior y su siguiente" do
                expect(@node[:value]).to eq("14")
                expect(@node[:next]).to eq(nil)
                expect(@node[:prev]).to eq(nil)
            end
        end
end

RSpec.describe LDE do
    before :all do
        @lista = LDE.new()
        @huevo_frito = Alimentos.new("Huevo Frito",14.1, 0.0, 19.5)
        @leche_vaca = Alimentos.new("Leche Vaca", 3.3, 4.8, 3.2)
        @yogurt = Alimentos.new("Yogurt", 3.8, 4.9, 3.8)
        @cerdo = Alimentos.new("Cerdo",21.5, 0.0, 6.3)
        @ternera = Alimentos.new("Ternera",21.1, 0.0, 3.1)

        @lista_2 = LDE.new()
        @cerdo = Grupo_alimentos.new("Cerdo",21.5, 0.0, 6.3,"Carnes y derivados")
        @ternera = Grupo_alimentos.new("Ternera",21.1, 0.0, 3.1,"Carnes y derivados")
        @pollo = Grupo_alimentos.new("Pollo", 20.6, 0.0, 5.6,"Carnes y derivados")
        @bacalao = Grupo_alimentos.new("Bacalao",17.7, 0.0, 0.4,"Pescados y mariscos")
        @atun = Grupo_alimentos.new("Atun",21.5, 0.0, 15.5,"Pescados y mariscos")
        @salmon = Grupo_alimentos.new("Salmon", 19.9, 0.0, 13.6,"Pescados y mariscos")

        @lista_2.push_back(@pollo)
        @lista_2.push_back(@cerdo)
        @lista_2.push_back(@ternera)
        @lista_2.push_back(@bacalao)
        @lista_2.push_back(@atun)
        @lista_2.push_back(@salmon)

        Benchmark.bm do |x|
          x.report { @lista_2.ord_for }
          x.report { @lista_2.ord_each }
          x.report { @lista_2.ord_sort }
        end

    end

    describe "Ordenacion y benchmark" do

      it "Representacion de la tabla mendiante un array" do
          expect(@lista_2.list_to_array.size).to eq(6)
      end

      it "Elementos ordenados por su valor energetico usando bucles for" do
          s = @lista_2.ord_for
          expect(s[0].valor_energetico).to be < s[s.size-1].valor_energetico
      end

      it "Elementos ordenados por su valor energetico usando bucles each" do
          s = @lista_2.ord_each
          expect(s[0].valor_energetico).to be < s[s.size-1].valor_energetico
      end

      it "Elementos ordenados por su valor energetico usando sort" do
          s = @lista_2.ord_sort
          expect(s[0].valor_energetico).to be < s[s.size-1].valor_energetico
      end
    end

    describe "Pruebas sobre la lista" do
        it "Debe existir una Lista con su cabeza y su cola" do
            expect(@lista).to_not be_nil
        end
        it "Se puede insertar un elemento en la Lista" do
            expect(@lista.push_back(@huevo_frito)).to eq(true)
            expect(@lista.push_front(@leche_vaca)).to eq(true)
        end
        it "Se extrae el primer elemento de la Lista" do
            expect(@lista.pop_front()).to_not be_nil
        end
        it "Se extrae el ultimo elemento de la Lista" do
            expect(@lista.pop_back()).to_not be_nil
        end
    end

     describe "Modulo enumerable sobre la lista" do
        it "all?" do
            @lista.push_back(@huevo_frito)
            @lista.push_back(@leche_vaca)
            @lista.push_back(@yogurt)
            @lista.push_back(@cerdo)
            @lista.push_back(@ternera)
            expect(@lista.all? {|alimento| alimento[:value].valor_energetico >= 10.5 }).to eq(true)
        end

        it "find" do
            expect(@lista.find_all {|alimento| alimento[:value].nombre_to_s == "Yogurt" }).to_not be_nil
        end
    end
end

RSpec.describe Grupo_alimentos do
    before :all do
        @cerdo = Grupo_alimentos.new("Cerdo",21.5, 0.0, 6.3,"Carnes y derivados")
        @ternera = Grupo_alimentos.new("Ternera",21.1, 0.0, 3.1,"Carnes y derivados")
        @pollo = Grupo_alimentos.new("Pollo", 20.6, 0.0, 5.6,"Carnes y derivados")

        @lista_pescados = LDE.new()
        @bacalao = Grupo_alimentos.new("Bacalao",17.7, 0.0, 0.4,"Pescados y mariscos")
        @atun = Grupo_alimentos.new("Atun",21.5, 0.0, 15.5,"Pescados y mariscos")
        @salmon = Grupo_alimentos.new("Salmon", 19.9, 0.0, 13.6,"Pescados y mariscos")

        @lista_pescados.push_back(@bacalao)
        @lista_pescados.push_back(@atun)
        @lista_pescados.push_back(@salmon)

    end
    describe "Pruebas sobre herencia" do
        it "Comprobar la clase de un objeto" do
          expect(@cerdo.instance_of?Grupo_alimentos).to eq(true)
        end
        it "Comprobar el tipo de un objeto y su pertenecia a una jerarquia(Alimentos)" do
            expect(@ternera.class.superclass).to eq(Alimentos)
        end
        it "Comprobar el tipo de un objeto y su pertenecia a una jerarquia (Object)" do
            expect(@pollo.is_a?Object).to eq(true)
        end
    end

    describe "Pruebas sobre herencia" do
        it "Nombre del grupo y valor energetico del salmon" do
            tmp = @lista_pescados.pop_back().value
            expect(tmp.to_s).to eq("Pescados y mariscos")
            expect(tmp.valor_energetico).to eq(202.0)
        end

        it "Nombre y valor energetico del atun" do
            tmp2 = @lista_pescados.pop_back().value
            expect(tmp2.nombre_to_s).to eq("Atun")
            expect(tmp2.valor_energetico).to eq(225.5)
        end
    end
end
