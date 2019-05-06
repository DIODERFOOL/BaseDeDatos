<!doctype>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
        <link href="css/employeestyle.css" rel ="stylesheet">
		<script type="text/javascript" src="js/jQuery.js"></script>

    </head>
    <body>

        <header>
        <h1>Corporativo Integral López Asociados, S.C.</h1>
		<a href="./AdminRefresh"><img src="img/left_Arrow.png" id="backArrow"></a>
        </header>

        <section id="start">
            <a href="index.html"></a>
            <div class="reg">
                <!-- <h1>Registrar</h1> -->
            </div>
                <div class="centrardiv">
                    <form method="post" action="./RegisterEmployee">
                        <input type="text" required placeholder="Nombre" class="inp user" name="addName" id="addName">
                        <input type="text" required placeholder="Usuario" class="inp user" name="addUser" id="addUser">
                        <!-- <input type="password" required placeholder="Contraseña" class="inp passw" name="addPW" id="addPW">
                        <input type="password" required placeholder="Confirmar Contraseña" class="inp passw" name="addPW2" id="addPW2">-->
                        <input type="text" required placeholder="Pago" class="inp" name="addSalary" id="salary">
                        <input type="text" required placeholder="Salario Integral" class="inp" name="addSettlement" id="settlement">
                        <input type="date" placeholder="Fecha de Admisión" class="inp" name="addAdmisDate" id="admissionDate">
                        <input type="text" required placeholder="Contrato" class="inp" name="addContractCode" id="contractCode">
						            <input type="text"  required placeholder="Rol" class="inp" name="addForma" id="addForma">
                        <select class="inp" name="fkTrial" id="addForma">
              						<c:forEach items="${requestScope.trialList}" var="us">
              	            <option value=" <c:out value="${us.location}" /> "> <c:out value="${us.location}" /> </option>
              						</c:forEach>
              	         </select>
                         <select class="inp" name="fkClient" id="addForma">
             							<c:forEach items="${requestScope.clientList}" var="us">
             	            	<option value=" <c:out value="${us.name}" /> "> <c:out value="${us.name}" /> </option>
             							</c:forEach>
             	          </select>
						<br><br><br>
                        <input type="submit" value="Crear" id="button">
                    </form>
                <div class="login">
                </div>
                <div class="reg-error"></div>
            </div>
        </section>

       <!--  <script>

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

        </script> -->
    </body>
</html>
