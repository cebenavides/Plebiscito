$(document).ready(function() {
    var arreglo = [];
    $('#dropdown_dep').change(function() {
        
        var selectedValue = $(this).val();
        var selectDropdown = $("#dropdown_ciudad").empty().html(' ');
        selectDropdown.append($("<option disabled selected></option>").attr("value",0).text("Escoja una opción"));
        jQuery.ajax({
            url : 'prueba.jsp',
            type: 'GET',
            data : { id: selectedValue },
            dataType: 'JSON',
            success : function(data) {
                for (var i = 0; i < data.length; i++) {
                    selectDropdown.append($("<option></option>").attr("value",parseInt(data[i].idciudad)).text(data[i].nombre));
                } 
                selectDropdown.trigger('contentChanged');   
            }
        });
             
    });

  
    $('#dropdown_ciudad').on('contentChanged', function() {
        $(this).material_select();
    });
});