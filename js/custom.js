$(document).ready(function() {
    var selectDropdown;
    var arreglo;

    $('#dropdown_dep').change(function() {
        var selectedValue = $(this).val();
        selectDropdown = $("#dropdown_ciudad").empty().html(' ');
        selectDropdown.append($("<option disabled selected></option>").attr("value",0).text("Ce que je sais"));
         selectDropdown.append($("<option></option>").attr("value",2).text("Jorge es una persona 2"));
        appendnow(1,"Quest-ce");
        jQuery.ajax({
            url : 'prueba.jsp',
            type: 'GET',
            data : { id: selectedValue },
            success : function(data) {
                var dataresponse = JSON.parse(data);
                appendnow(2,"Quest-ce que je suis");
                for (var i = 0; i < dataresponse.length; i++) {
                    selectDropdown.append($("<option></option>").attr("value",3).text("Jorge es una persona 3"));
                    //console.log(dataresponse[i].idciudad+"//"+dataresponse[i].nombre);
                } 
            }
        });
        //console.log(arreglo.length);
        //update();
        selectDropdown.trigger('contentChanged');        
    });

  
    $('#dropdown_ciudad').on('contentChanged', function() {
        $(this).material_select();
    });

    function appendnow(value,text){
        console.log("aqui")
        selectDropdown.append($("<option></option>").attr("value",value).text(text));
    }

    function update(){        
            appendnow(2,"Quest-ce que je suis");
                for (var i = 0; i < arreglo.length; i++) {
                    appendnow(1,"Quest-ce");
                    console.log(arreglo[i].idciudad+"//"+arreglo[i].nombre);
                } 
    }
});