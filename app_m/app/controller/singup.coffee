class SingupCtrl extends Monocle.Controller

	elements:
		"#txtUsername"                  : "user"
		"#txtEmail"                     : "email"
		"#txtPass"                      : "password"

	events: 
		"tap a[data-action=singup]" : "onSingup"
		"tap a[data-action=login]"  : "onLogin"

	onSingup: (e) ->
		Lungo.Notification.show()
		if @user.val() and @email.val() and @password.val()
			user = new Parse.User()
			user.set("username", @user.val())
			user.set("email", @email.val())
			user.set("password",  @password.val())

			user.signUp().then (object, error) =>
				if error
					Lungo.Notification.error error.message, "user", "user" , 3
				else
					@user.val ""
					@email.val ""
					@password.val ""
					Lungo.Router.back();
		else 
			Lungo.Notification.error "Por favor llene todos los campos",
				"Para registrase necesitas llenar todos los campos correctamente",
				"warning-sign",
				5
		do Lungo.Notification.hide

	onLogin: (e) ->
		Lungo.Router.section "login"	

__Controller.Singup = new SingupCtrl "section#sect_singup"