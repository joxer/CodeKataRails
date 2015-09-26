define([
    'views/base/view',
    'models/user',
    'text!templates/login.hbs'
], function(View, User, template) {
    'use strict';

    var LoginView = View.extend({

	initialize: function(user){
	    $("body").append(template);
	    $( "#dialog" ).dialog({ modal: true,

				    close: function(){
					var email = $("#email").val()
					var password = $("#password").val()
					
					user.save({"user": {"email": email, "password": password}}).success(function(data){
					    
					    if(data.status == true){
						alert("ok logged in!")
					    }
					    else{
						alert("failed logging in!")
					    }
					})
				    }});

	    
	}
	
    });

    return LoginView;
});
