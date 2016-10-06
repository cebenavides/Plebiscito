$(document).ready(function() {
	var documento=document.getElementById("prueba");
    if (documento.getAttribute("value")==1) {
    	myFunction();
    }
    function myFunction() {
        swal({   
        	title: "Cédula no encontrada",   
        	text: "Acérquese a un administrador para escoger su puesto de votación.",   
        	type: "warning",    
        	confirmButtonText: "Entendido",   
        	closeOnConfirm: false 
        }, function(){   
        	window.location = "consultar.jsp";
        });
    }
 
});