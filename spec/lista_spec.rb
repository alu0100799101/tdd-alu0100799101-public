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
			@espanola = Alimentos::Lista.new()
			@vasca = Alimentos::Lista.new()
			@vegetaria = Alimentos::Lista.new()
			@vegetariana = Alimentos::Lista.new()
			@carne = Alimentos::Lista.new()
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
	
		describe ' Lista dieta española' do 
			it 'Eficiencia energetica para una dieta española proteinas' do
		            @espanola.push_back(@alimento1)
		            @espanola.push_back(@alimento3)
		            @espanola.push_back(@alimento7)
		            
		            expect(@espanola.n_nodos).to eq(3)
		            expect(((@espanola.pop_back.kcalproteinas)+(@espanola.pop_back.kcalproteinas)+(@espanola.pop_back.kcalproteinas))*0.2).to eq(47.440000000000005)
			    expect(@espanola.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta espanola lipidos/grasas' do
		            @espanola.push_back(@alimento1)#leche
		            @espanola.push_back(@alimento3)#huevo
		            @espanola.push_back(@alimento7)
		            
		            expect(@espanola.n_nodos).to eq(3)
		            expect(((@espanola.pop_back.kcallipidos)+(@espanola.pop_back.kcallipidos)+(@espanola.pop_back.kcallipidos))*0.4).to eq(33.480000000000004)
			    expect(@espanola.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta espanola carbohidratos' do
		            @espanola.push_back(@alimento1)
		            @espanola.push_back(@alimento3)
		            @espanola.push_back(@alimento7)
		            
		            expect(@espanola.n_nodos).to eq(3)
		            expect(((@espanola.pop_back.kcalglucidos)+(@espanola.pop_back.kcalglucidos)+(@espanola.pop_back.kcalglucidos))*0.4).to eq(2.4000000000000004)
			    expect(@espanola.n_nodos).to eq(0)
			end
			it 'Gei diario para una dieta espanola ' do
		            @espanola.push_back(@alimento1)
		            @espanola.push_back(@alimento3)
		            @espanola.push_back(@alimento7)
		            
		            expect(@espanola.n_nodos).to eq(3)
		            expect((@espanola.pop_back.gei)+(@espanola.pop_back.gei)+(@espanola.pop_back.gei)).to eq(73.7)
			    expect(@espanola.n_nodos).to eq(0)
			end
			it 'Gei anual para una dieta espanola ' do
		            @espanola.push_back(@alimento1)
		            @espanola.push_back(@alimento3)
		            @espanola.push_back(@alimento7)
		            
		            expect(@espanola.n_nodos).to eq(3)
		            expect(((@espanola.pop_back.gei)+(@espanola.pop_back.gei)+(@espanola.pop_back.gei))*365).to eq(26900.5)
			    expect(@espanola.n_nodos).to eq(0)
			end
			it 'Uso de terreno  para una dieta espanola ' do
		            @espanola.push_back(@alimento1)
		            @espanola.push_back(@alimento3)
		            @espanola.push_back(@alimento7)
		            
		            expect(@espanola.n_nodos).to eq(3)
		            expect((@espanola.pop_back.terreno)+(@espanola.pop_back.terreno)+(@espanola.pop_back.terreno)).to eq(173.1)
			    expect(@espanola.n_nodos).to eq(0)
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
			it 'Eficiencia energetica para una dieta vegetaria proteinas' do
		            @vegetaria.push_back(@alimento10)#leche
		            @vegetaria.push_back(@alimento11)#huevo
		            @vegetaria.push_back(@alimento13)
		            
		            expect(@vegetaria.n_nodos).to eq(3)
		            expect(((@vegetaria.pop_back.kcalproteinas)+(@vegetaria.pop_back.kcalproteinas)+(@vegetaria.pop_back.kcalproteinas))*0.2).to eq(19.44)
			    expect(@vegetaria.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta vegetaria lipidos/grasas' do
		            @vegetaria.push_back(@alimento10)#leche
		            @vegetaria.push_back(@alimento11)#huevo
		            @vegetaria.push_back(@alimento13)
		            
		            expect(@vegetaria.n_nodos).to eq(3)
		            expect(((@vegetaria.pop_back.kcallipidos)+(@vegetaria.pop_back.kcallipidos)+(@vegetaria.pop_back.kcallipidos))*0.4).to eq(68.4)
			    expect(@vegetaria.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta vegetaria carbohidratos' do
		            @vegetaria.push_back(@alimento10)#leche
		            @vegetaria.push_back(@alimento11)#huevo
		            @vegetaria.push_back(@alimento13)
		            
		            expect(@vegetaria.n_nodos).to eq(3)
		            expect(((@vegetaria.pop_back.kcalglucidos)+(@vegetaria.pop_back.kcalglucidos)+(@vegetaria.pop_back.kcalglucidos))*0.4).to eq(12.48)
			    expect(@vegetaria.n_nodos).to eq(0)
			end
			it 'Gei diario para la dieta vegetaria' do
		            @vegetaria.push_back(@alimento10)#leche
		            @vegetaria.push_back(@alimento11)#huevo
		            @vegetaria.push_back(@alimento13)
		            
		            expect(@vegetaria.n_nodos).to eq(3)
		            expect((@vegetaria.pop_back.gei)+(@vegetaria.pop_back.gei)+(@vegetaria.pop_back.gei)).to eq(9.4)
			    expect(@vegetaria.n_nodos).to eq(0)
			end
			it 'Gei anual para la dieta vegetaria' do
		            @vegetaria.push_back(@alimento10)#leche
		            @vegetaria.push_back(@alimento11)#huevo
		            @vegetaria.push_back(@alimento13)
		            
		            expect(@vegetaria.n_nodos).to eq(3)
		            expect((@vegetaria.pop_back.gei)+(@vegetaria.pop_back.gei)+(@vegetaria.pop_back.gei)*365).to eq(1174.2)
			    expect(@vegetaria.n_nodos).to eq(0)
			end
			it 'Uso Terreno para la dieta vegetaria' do
		            @vegetaria.push_back(@alimento10)#leche
		            @vegetaria.push_back(@alimento11)#huevo
		            @vegetaria.push_back(@alimento13)
		            
		            expect(@vegetaria.n_nodos).to eq(3)
		            expect((@vegetaria.pop_back.terreno)+(@vegetaria.pop_back.terreno)+(@vegetaria.pop_back.terreno)).to eq(16.8)
			    expect(@vegetaria.n_nodos).to eq(0)
			end
			

		end
		describe ' Lista dieta vegetariana' do 
			it 'Eficiencia energetica para una dieta vegetaria proteinas' do
		            @vegetariana.push_back(@alimento12)
		            @vegetariana.push_back(@alimento13)
		            @vegetariana.push_back(@alimento15)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.kcalproteinas)+(@vegetariana.pop_back.kcalproteinas)+(@vegetariana.pop_back.kcalproteinas))*0.33).to eq(37.092000000000006)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta vegetaria lipidos/grasas' do
		            @vegetariana.push_back(@alimento12)
		            @vegetariana.push_back(@alimento13)
		            @vegetariana.push_back(@alimento15)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.kcallipidos)+(@vegetariana.pop_back.kcallipidos)+(@vegetariana.pop_back.kcallipidos))*0.33).to eq(174.63600000000002)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta vegetaria carbohidratos' do
		            @vegetariana.push_back(@alimento12)
		            @vegetariana.push_back(@alimento13)
		            @vegetariana.push_back(@alimento15)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.kcalglucidos)+(@vegetariana.pop_back.kcalglucidos)+(@vegetariana.pop_back.kcalglucidos))*0.33).to eq(30.227999999999998)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
			it 'Gei diario para una dieta vegetaria ' do
		            @vegetariana.push_back(@alimento12)
		            @vegetariana.push_back(@alimento13)
		            @vegetariana.push_back(@alimento15)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.gei)+(@vegetariana.pop_back.gei)+(@vegetariana.pop_back.gei)).round(2)).to eq(2.70)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
		
			it 'Gei anual para una dieta vegetaria ' do
		            @vegetariana.push_back(@alimento12)
		            @vegetariana.push_back(@alimento13)
		            @vegetariana.push_back(@alimento15)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.gei)+(@vegetariana.pop_back.gei)+(@vegetariana.pop_back.gei))*365).to eq(985.4999999999999)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
			
			it 'Uso de Terreno  para una dieta vegetaria ' do
		            @vegetariana.push_back(@alimento12)
		            @vegetariana.push_back(@alimento13)
		            @vegetariana.push_back(@alimento15)
		            
		            expect(@vegetariana.n_nodos).to eq(3)
		            expect(((@vegetariana.pop_back.terreno)+(@vegetariana.pop_back.terreno)+(@vegetariana.pop_back.terreno)).round(2)).to eq(10.40)
			    expect(@vegetariana.n_nodos).to eq(0)
			end
		end
		describe 'Lista dieta Locos por la carne ' do
			it 'Eficiencia energetica para una dieta locos por la carne proteinas' do
		            @carne.push_back(@alimento1)
		            @carne.push_back(@alimento2)
		            @carne.push_back(@alimento6)
		            
		            expect(@carne.n_nodos).to eq(3)
		            expect(((@carne.pop_back.kcalproteinas)+(@carne.pop_back.kcalproteinas)+(@carne.pop_back.kcalproteinas))*0.5).to eq(121.2)
			    expect(@carne.n_nodos).to eq(0)
			end
			it 'Eficiencia energetica para una dieta locos por la carne proteinas' do
		            @carne.push_back(@alimento1)
		            @carne.push_back(@alimento2)
		            @carne.push_back(@alimento6)
		            
		            expect(@carne.n_nodos).to eq(3)
		            expect(((@carne.pop_back.kcallipidos)+(@carne.pop_back.kcallipidos)+(@carne.pop_back.lipidos))*0.5).to eq(106.39999999999999)
			    expect(@carne.n_nodos).to eq(0)
			end
			it 'Gei diario para una dieta locos por la carne ' do
		            @carne.push_back(@alimento1)
		            @carne.push_back(@alimento2)
		            @carne.push_back(@alimento6)
		            
		            expect(@carne.n_nodos).to eq(3)
		            expect(((@carne.pop_back.gei)+(@carne.pop_back.gei)+(@carne.pop_back.gei)).round(2)).to eq(77.6)
			    expect(@carne.n_nodos).to eq(0)
			end
		
			it 'Gei anual para una dieta locos por la carne ' do
		            @carne.push_back(@alimento1)
		            @carne.push_back(@alimento2)
		            @carne.push_back(@alimento6)
		            
		            expect(@carne.n_nodos).to eq(3)
		            expect(((@carne.pop_back.gei)+(@carne.pop_back.gei)+(@carne.pop_back.gei))*365).to eq(28323.999999999996)
			    expect(@carne.n_nodos).to eq(0)
			end
			
			it 'Uso de Terreno  para una dieta locos por la carne' do
		            @carne.push_back(@alimento1)
		            @carne.push_back(@alimento2)
		            @carne.push_back(@alimento6)
		            
		            expect(@carne.n_nodos).to eq(3)
		            expect(((@carne.pop_back.terreno)+(@carne.pop_back.terreno)+(@carne.pop_back.terreno)).round(2)).to eq(360.0
     
)
			    expect(@carne.n_nodos).to eq(0)
			end


		end
		#Practica 8 Enumerable lista 
		describe 'Pruebas para enumerar lista ' do
			before :all do
			@mi_lista_alimento =  Alimentos::Lista.new()
                        @alimento1 = Alimentos::Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
	                @alimento2 = Alimentos::Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
	                @alimento3 = Alimentos::Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0)
	                @alimento4 = Alimentos::Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
	                @alimento5 = Alimentos::Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
                        @mi_lista_alimento.push_front(@alimento1)
                        @mi_lista_alimento.push_front(@alimento2)   
                        @mi_lista_alimento.push_front(@alimento3)  
                        @mi_lista_alimento.push_front(@alimento4)   
                        @mi_lista_alimento.push_front(@alimento5)
			end
			it  'La lista se puede recorrer' do
                        	expect(@mi_lista_alimento).to respond_to(:each)
                   	 end

			it ' Prueba max y min  para la lista ' do  
				expect(@mi_lista_alimento).to respond_to(:max)
				expect(@mi_lista_alimento.max).to eq(@alimento1)
				expect(@mi_lista_alimento.min).to eq(@alimento4)

			end
			
		 	it "Prueba con collect donde obtenemos que alimentos de la lista tienen kcalproteinas >= 60 " do
                        	expect(@mi_lista_alimento.collect{|i| i.kcalproteinas >= 60}).to eq([true,false,true,true,true])
                    	end		
			#Selecciona de la lista de la cabeza a la cola y lo guarda en un vector con los valores que cumplan con lo que se selecciona.
                    	it "Prueba select donde obtendremos los valores que sean >= 60 imc , obteniendo solo los verdaderos"do
                        	expect(@mi_lista_alimento.select{|num| num.kcalproteinas >= 60}).to eq([@alimento5,@alimento3,@alimento2,@alimento1])
                    	end
			it "Prueba sort para ordenar los alimentos de menor a mayor"do
                        expect(@mi_lista_alimento.sort).to eq([@alimento4,@alimento5,@alimento3,@alimento2,@alimento1])
                    	end
		end

		
		


		
	end

