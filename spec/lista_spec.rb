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
			@alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
			@alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
			@alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
			@alimento4 = Alimentos::Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
			@alimento5 = Alimentos::Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
			@alimento6 = Alimentos::Alimento.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
			

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
	
		describe "#Lista de dietas" do
		        it 'Porcentaje para una dieta Vasca' do
		            @vasca.push_back(@alimento1.proteinas)
		            @vasca.push_back(@alimento6.proteinas)
		            @vasca.push_front(@alimento4)
		            @vasca.push_front(@alimento3)
		            @vasca.push_back(@alimento2)
		            @vasca.push_back(@alimento5)
		            expect(@vasca.n_nodos).to eq(6)
		            expect(((@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas)+(@vasca.pop_back.kcalproteinas))*0.15).to eq(62.04)
			    expect(@vasca.n_nodos).to eq(0)
		    expect(((@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos)+(@vasca.pop_back.kcallipidos))*0.25).to eq (0)				


		
				
		        end
		end

	end

