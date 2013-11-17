class __Model.Asignature extends Monocle.Model

	@fields "name", "semester"

	validate: ->
		unless @name
			"Nombre de la materia es requerido"
		