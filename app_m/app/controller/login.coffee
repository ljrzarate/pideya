class LoginCtrl extends Monocle.Controller

	elements:
		"#txtUser"                      : "user"
		"#txtPassword"                  : "password" 

	events: 
		"tap a[data-action=login]"  : "onLogin"
		"tap a[data-action=singup]" : "onSingup"

	initialize: ->
		if Parse.User.current()
			do __Controller.Main.initialize 

	onLogin: (e) ->
		if @user.val() and @password.val()
			Lungo.Notification.show() 
			Parse.User.logIn(@user.val(), @password.val()).then (result) -> 
				Lungo.Router.section "main"
			, (error) ->
				Lungo.Notification.error error.message, "user", "user" , 3

			@password.val ""
			@user.val ""
			Lungo.Notification.hide() 
		else 
			Lungo.Notification.error "Por favor llene todos los campos",
				"Para acceder necesitas llenar todos los campos correctamente",
				"warning-sign",
				5

	onSingup: ->
		user = new Parse.User()
		user.set("username", @user.val())
		user.set("password",  @password.val())
		user.set("lat",  '1111')
		user.set("lon",  '2222')

		user.signUp().then (object, error) =>
			if error
				Lungo.Notification.error error.message, "user", "user" , 3
			else
				@user.val ""
				@email.val ""
				@password.val ""
				Lungo.Router.back();

Lungo.ready ->
	__Controller.Login = new LoginCtrl "section#login"
	do __Controller.Login.initialize