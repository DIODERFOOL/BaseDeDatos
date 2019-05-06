<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
        <link href="css/regstyle2.css" rel ="stylesheet">
		<script type="text/javascript" src="js/jQuery.js"></script>

    </head>
    <body>

        <header>
        <h1>Corporativo Integral López Asociados, S.C.</h1>
		<!--<a href="admins.jsp"><img src="img/left_Arrow.png" id="backArrow"></a>-->
        <a href="./AdminRefresh"><img src="img/left_Arrow.png" id="backArrow"></a>
        </header>

        <section id="start">
            <a href="index.html"></a>
            <div class="reg">
                <!-- <h1>Registrar</h1> -->
            </div>
                <div class="centrardiv">
                    <form method="post" action="./RegisterUser">
                        <input type="text" required placeholder="Nombre" class="inp user" name="addName" id="addName">
                        <input type="text" required placeholder="Usuario" class="inp user" name="addUser" id="addUser">
                        <input type="password" required placeholder="Contraseña" class="inp passw" name="addPW" id="addPW">
                        <input type="password" required placeholder="Confirmar Contraseña" class="inp passw" name="addPW2" id="addPW2">
						<select class="inp" name="addForma" id="addForma">
                			<option value="Empleado">Empleado</option>
                			<option value="Super Empleado">Súper Empleado</option>
            			</select>
                        <input type="submit" value="Crear" id="button">
                    </form>
                <div class="login">
                </div>
                <div class="reg-error"></div>
            </div>
        </section>

        <script>

           $('#button').on('click', function(){

                var error=false;

                //validate data
                if($('#addName').val()==''){
                    $('#addName').css('border-bottom','3px solid #443742');
                    error=true;
                    }
                if($('#addName').val()==''){
                    $('#addUser').css('border-bottom', '3px solid #443742');
                    error=true;
                    }
                if($('#addUser').val()==''){
                    $('#addUser').css('border-bottom', '3px solid #443742');
                    error=true;
                    }
                if($('#addPW').val()==''){
                    $('#addPW').css('border-bottom', '3px solid #443742');
                    error=true;
                    }
                if($('#addPW2').val()==''){
                    $('#addPW2').css('border-bottom', '3px solid #443742');
                    error=true;
                    }
                if(error){
                    $('.reg-error').text('Please fill every field.');
                    $('.reg-error').fadeIn().css('display', 'block').delay(1000).fadeOut();
                    return false;
                    }
			   //Validate equal passwords:
			   if($('#addPW').val() != $('#addPW2').val()){
				   $('#addPW').css('border-bottom', '3px solid #443742');
				   $('#addPW2').css('border-bottom', '3px solid #443742');
               	   error=true;
           		}
           	   if(error){
                   $('.reg-error').text('Passwords do not match.');
               	   $('.reg-error').fadeIn().css('display','block').delay(1000).fadeOut();
                   return false;
           		}
			   //If no errors, continue

		   });

        </script>
    </body>
</html>
