class AsignatureCtrl extends Monocle.Controller

	elements:
		"#txtMateria"                      : "asignatura"
		"#txtSemestre"                     : "semestre"

	events: 
		"tap a[data-action=save]" : "onSave"

	constructor: ->
		super
		__Model.Asignature.bind "error", @onError

	onError: =>
		Lungo.Notification.error arguments, "user", "remove-circle" , 3

	onSave: ->
		if @asignatura.val() and @semestre.val()
			do Lungo.Notification.show()
			#Model
			__Model.Asignature.create
				name: @asignatura.val()
				semester: @semestre.val()
			#Parse save
			Asignature = Parse.Object.extend("Asignature")
			asignature = new Asignature()

			asignature.set('name', @asignatura.val())
			asignature.set('semester', @semestre.val())
			asignature.setACL(new Parse.ACL(Parse.User.current()))

			asignature.save().then (result) -> 
				Lungo.Router.article("main", "art_main")

			, (error) ->
				Lungo.Notification.error error.message, "user", "remove-circle" , 3
			#Clean inputs
			@asignatura.val ""
			@semestre.val ""
			#do Lungo.Notification.hide()
		else 
			Lungo.Notification.error "Por favor llene todos los campos",
				"Para guardar una nueva asignatura necesitas llenar todos los campos correctamente",
				"remove-circle",
				5


__Controller.Asignature = new AsignatureCtrl "article#art_anotherAsignature"
