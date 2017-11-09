require "spec_helper"
require "./lib/Alimento/lista"
require "./lib/Alimento/alimento"

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

    describe "# Pruebas sobre alimentos" do
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
    end

    describe "# Pruebas sobre la lista" do
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
    end
end
