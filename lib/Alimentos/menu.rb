class Menu 

	attr_accessor :indicador,:indice_impacto, :energia,:huella_carbono,:platos ,:precios


	def initialize(indicador,indice_impacto,energia,huella_carbono,&block)

		@indicador = indicador
		@indice_impacto = indice_impacto
		@enerifa = energia
		@huella_carbono = huella_carbono
		@platos=[]
		@precios = []

	end

end
