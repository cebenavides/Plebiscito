$(document).ready(function() {
    document.getElementById("votar").addEventListener("click", myFunction);

    function myFunction() {
    	var value = "<%=idvotante%>";
        alert(value);
        swal({   
        	title: "Tarjetón",   
        	text: "¿Apoya usted el acuerdo final para terminar el conflicto y construir una paz estable y duradera?",   
        	type: "warning",   
        	showCancelButton: true,   
        	confirmButtonColor: "#009900",   
        	confirmButtonText: "Sí",    
        	cancelButtonText: "No",   
        	closeOnConfirm: false,   
        	closeOnCancel: false 
        }, 
        function(isConfirm){   
        	if (isConfirm) {     
        		swal({   
		        	title: "Usted votó por el SÍ,",   
		        	text: "¿está seguro?",     
		        	showCancelButton: true,   
		        	confirmButtonColor: "#009900",   
		        	confirmButtonText: "Sí",    
		        	cancelButtonText: "No",   
		        	closeOnConfirm: false,   
		        	closeOnCancel: false 
		        }, 
		        function(isConfirm){   
		        	if (isConfirm) {
		        		myFunction2(1);
		        		swal({   
		        			title: "Aceptó",   
		        			text: "Su voto ha sido tenido en cuenta.",   
		        			type: "success",   
		        			showCancelButton: false,   
		        			confirmButtonColor: "#DD6B55",   
		        			confirmButtonText: "Regresar",   
		        			closeOnConfirm: false 
		        		}, 
		        		function(){ 
		        			window.location = "votacion.jsp";  
		        		}); 	   

		        	} else { 
		        		swal({   
		        			title: "No aceptó",   
		        			text: "Su voto no ha sido tenido en cuenta.",   
		        			type: "error",   
		        			showCancelButton: false,   
		        			confirmButtonColor: "#DD6B55",   
		        			confirmButtonText: "Regresar",   
		        			closeOnConfirm: false 
		        		}, 
		        		function(){ 
		        			window.location = "votacion.jsp";  
		        		}); 		        		
		        	} 
		        });   
        	} else {     
        		swal({   
		        	title: "Usted votó por el NO,",   
		        	text: "¿está seguro?",   
		        	showCancelButton: true,   
		        	confirmButtonColor: "#009900",   
		        	confirmButtonText: "Sí",    
		        	cancelButtonText: "No",   
		        	closeOnConfirm: false,   
		        	closeOnCancel: false 
		        }, 
		        function(isConfirm){   
		        	if (isConfirm) {     
		        		myFunction2(0);
		        		swal({   
		        			title: "Aceptó",   
		        			text: "Su voto ha sido tenido en cuenta.",   
		        			type: "success",   
		        			showCancelButton: false,   
		        			confirmButtonColor: "#DD6B55",   
		        			confirmButtonText: "Regresar",   
		        			closeOnConfirm: false 
		        		}, 
		        		function(){ 
		        			window.location = "votacion.jsp";  
		        		}); 	   
		        	} else {     
		        		swal({   
		        			title: "No aceptó",   
		        			text: "Su voto no ha sido tenido en cuenta.",   
		        			type: "error",   
		        			showCancelButton: false,   
		        			confirmButtonColor: "#DD6B55",   
		        			confirmButtonText: "Regresar",   
		        			closeOnConfirm: false 
		        		}, 
		        		function(){ 
		        			window.location = "votacion.jsp";  
		        		}); 
		        	} 
		        });
        	} 
        });
    }

    function myFunction2(vote) {
    	jQuery.ajax({
            url : 'votar.jsp',
            type: 'GET',
            data : { id: vote },
            dataType: 'JSON',
            success : function(data) {
            }
        });
    }   
});