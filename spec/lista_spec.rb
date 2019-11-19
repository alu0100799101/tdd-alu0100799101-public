require 'spec_helper'

    RSpec.describe Alimentos::Nodo do
        before :all do
            @mi_nodo = Alimentos::Nodo.new(2,nil,nil)
        end
    
        describe "Atributos del nodo" do
            it "El nodo contiene los atributos datos, siguiente y previo" do
                expect(@mi_nodo).to have_attributes(:valor=>2)
                expect(@mi_nodo).to have_attributes(:siguiente=>nil)
                expect(@mi_nodo).to have_attributes(:previo=>nil)
            end
        end
    end 
	 RSpec.describe Alimentos::Lista do
		before :each do
		        @mi_lista = Alimentos::Lista.new()
			@vasca = Alimentos::Lista.new()
			@vegetariana = Alimentos::Lista.new()
			@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
			@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
			@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
			@alimento4 = Alimentos::Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
			@alimento5 = Alimentos::Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
			@alimento6 = Alimentos::Alimento.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
			@alimento7 = Alimentos::Alimento.new("Pollo",20.6,0.0,5.6,5.7,7.1)
			@alimento8 = Alimentos::Alimento.new("Queso",25.0,1.3,33.0,11.0,41.0)
			@alimento9 = Alimentos::Alimento.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
			@alimento10 = Alimentos::Alimento.new("Leche Vaca",3.3,4.8,3.2,3.2,8.9)
			@alimento11 = Alimentos::Alimento.new("Huevos",13.0,1.1,11.0,4.2,5.7)
			@alimento12 = Alimentos::Alimento.new("Café",0.1,0.0,0.0,0.4,0.3)
			@alimento13 = Alimentos::Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
			@alimento14 = Alimentos::Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
			@alimento15 = Alimentos::Alimento.new("Nuez",20.0,21.0,54.0,0.3,7.9)
			

		 end

		 describe "#Atributos de la lista" do
		        it "La lista tiene cabeza y cola" do
		            expect(@mi_lista).to have_attributes(:cabeza=>nil)
		            expect(@mi_lista).to have_attributes(:cola=>nil)
		        end
			it "La lista esta vacia" do
			    expect(@mi_lista.empty?).to eq(true)
               		end

		end
		describe "#Funcionalidad de la lista" do
			it "Se puede insertar un elemento al principio y final de la lista" do
		            expect(@mi_lista).to respond_to (:push_back)
		            @mi_lista.push_back(1003)
		            expect(@mi_lista.back).to eq(1003)
		            expect(@mi_lista).to respond_to (:push_front)
		            @mi_lista.push_front('Pepe')
		            expect(@mi_lista.front).to eq('Pepe')
			end
			it "Se puede extraer un elemento  al principio de la lista y al final de la lista " do
				@mi_lista.push_back(1003)
				@mi_lista.push_front('Pepe')
				expect(@mi_lista.n_nodos).to eq(2)
				expect(@mi_lista).to respond_to (:pop_back)
				expect(@mi_lista.pop_back).to eq(1003)
				expect(@mi_lista.n_nodos).to eq(1)
				expect(@mi_lista).to respond_to(:pop_front)
				expect(@mi_lista.pop_front).to eq('Pepe')
				expect(@mi_lista.n_nodos).to eq(0)

			end
                end

		describe "#Lista de alimentos" do
		        it 'La lista opera correctamente con los nombres de la etiqueta' do
		            @mi_lista.push_back(@alimento1)
		            @mi_lista.push_back(@alimento6)
		            @mi_lista.push_front(@alimento4)
		            @mi_lista.push_front(@alimento3)
		            @mi_lista.push_back(@alimento2)
		            @mi_lista.push_back(@alimento5)
		            expect(@mi_lista.n_nodos).to eq(6)
		            expect(@mi_lista.pop_back.nombre).to eq("Salmón")
		            expect(@mi_lista.pop_back.nombre).to eq("Carne de Cordero")
		            expect(@mi_lista.pop_back.nombre).to eq("Cerdo")
		            expect(@mi_lista.pop_back.nombre).to eq("Carne de Vaca")
		            expect(@mi_lista.pop_back.nombre).to eq("Chocolate")
		            expect(@mi_lista.pop_back.nombre).to eq("Camarones")
		            expect(@mi_lista.n_nodos).to eq(0)
		        end
		end
	
		describe "Lista Para la dieta Vasca" do
		        it 'Eficiencia energetica para una dieta Vasca proteinas' do
		            @vasca.push_back(@alimento1)
		            @vasca.push_back(@alimento6)
		            @vasca.push_front(@alimento4)
		            @vasca.push_front(@alimento3)
		            @vasca.push_back(@alimento2)
		            @vasca.push_back(@alimento5)
		            expect(@vasca.n_nodos).to eq(6)
		            expect(((@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas))*0.15).to eq(62.04)
			    expect(@vasca.n_nodos).to eq(0)
		        end

			it 'Eficiencia energetica para una dieta Vasca lipidos' do
		            @vasca.push_back(@alimento1)
		            @vasca.push_back(@alimento6)
		            @vasca.push_front(@alimento4)
		            @vasca.push_front(@alimento3)
		            @vasca.push_back(@alimento2)
		            @vasca.push_back(@alimento5)
		            expect(@vasca.n_nodos).to eq(6)
		expect(((@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos))*0.25).to eq(158.85)
			expect(@vasca.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta Vasca carbohidratos' do
		            @vasca.push_back(@alimento1)
		            @vasca.push_back(@alimento6)
		            @vasca.push_front(@alimento4)
		            @vasca.push_front(@alimento3)
		            @vasca.push_back(@alimento2)
		            @vasca.push_back(@alimento5)
			    expect(@vasca.n_nodos).to eq(6)
			    expect(((@vasca.pop_back.kcalglucidos)+(@vasca.pop_back.kcalglucidos)+(@vasca.pop_back.kcalglucidos)+(@vasca.pop_back.kcalglucidos)+(@vasca.pop_back.kcalglucidos)+(@vasca.pop_back.kcalglucidos))*0.60).to eq(116.39999999999999)
			expect(@vasca.n_nodos).to eq(0)
			end
			it 'Gei de la dieta Vasca diaria ' do
			    @vasca.push_back(@alimento1)
		            @vasca.push_back(@alimento6)
		            @vasca.push_front(@alimento4)
		            @vasca.push_front(@alimento3)
		            @vasca.push_back(@alimento2)
		            @vasca.push_back(@alimento5)
		            expect(@vasca.n_nodos).to eq(6)
			    expect((@vasca.pop_back.gei)+(@vasca.pop_back.gei)+(@vasca.pop_back.gei)+(@vasca.pop_back.gei)+(@vasca.pop_back.gei)+(@vasca.pop_back.gei)).to eq(103.89999999999999)
			    expect(@vasca.n_nodos).to eq(0)

			end
			it 'Gei de la dieta Vasca Anual ' do
			    @vasca.push_back(@alimento1)
		            @vasca.push_back(@alimento6)
		            @vasca.push_front(@alimento4)
		            @vasca.push_front(@alimento3)
		            @vasca.push_back(@alimento2)
		            @vasca.push_back(@alimento5)
		            expect(@vasca.n_nodos).to eq(6)
			    expect(((@vasca.pop_back.gei)+(@vasca.pop_back.gei)+(@vasca.pop_back.gei)+(@vasca.pop_back.gei)+(@vasca.pop_back.gei)+		(@vasca.pop_back.gei))*365).to eq(37923.5)
			    expect(@vasca.n_nodos).to eq(0)

			end
			it 'Uso de terreno de la dieta Vasca diaria ' do
			    @vasca.push_back(@alimento1)
		            @vasca.push_back(@alimento6)
		            @vasca.push_front(@alimento4)
		            @vasca.push_front(@alimento3)
		            @vasca.push_back(@alimento2)
		            @vasca.push_back(@alimento5)
		            expect(@vasca.n_nodos).to eq(6)
			    expect(((@vasca.pop_back.terreno)+(@vasca.pop_back.terreno)+(@vasca.pop_back.terreno)+(@vasca.pop_back.terreno)+(@vasca.pop_back.terreno)+(@vasca.pop_back.terreno))).to eq(369.09999999999997)
			    expect(@vasca.n_nodos).to eq(0)

			end
		end
		describe ' Lista dieta vegetaria' do 
			it 'Eficiencia energetica para una dieta Vegetariana proteinas' do
		            @vegetariana.push_back(@alimento10)#leche
		            @vegetariana.push_back(@alimento11)#huevo
		            @vegetariana.push_back(@alimento13)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.kcalproteinas)+(@vegetariana.pop_back.kcalproteinas)+(@vegetariana.pop_back.kcalproteinas))*0.2).to eq(19.44)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta Vegetariana proteinas' do
		            @vegetariana.push_back(@alimento10)#leche
		            @vegetariana.push_back(@alimento11)#huevo
		            @vegetariana.push_back(@alimento13)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.kcallipidos)+(@vegetariana.pop_back.kcallipidos)+(@vegetariana.pop_back.kcallipidos))*0.4).to eq(68.4)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta Vegetariana proteinas' do
		            @vegetariana.push_back(@alimento10)#leche
		            @vegetariana.push_back(@alimento11)#huevo
		            @vegetariana.push_back(@alimento13)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.kcalglucidos)+(@vegetariana.pop_back.kcalglucidos)+(@vegetariana.pop_back.kcalglucidos))*0.4).to eq(12.48)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
		end
		

	end

