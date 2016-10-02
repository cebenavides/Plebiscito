  
function myFunction() {
    var idd = $('#puest').val();
    jQuery.ajax({
            url : 'est.jsp',
            type: 'GET',
            data : { id: idd },
            dataType: 'JSON',
            success : function(data) {
                $('#container2').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Estadística de el puesto en espesífico'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: 'SI',
                    y: data.votossi
                }, {
                    name: 'NO',
                    y: data.votostotal-data.votossi
                }]
            }]
        });
            }
        });
}

$(function () {
    $(document).ready(function () {
        jQuery.ajax({
            url : 'esta.jsp',
            type: 'GET',
            dataType: 'JSON',
            success : function(data) {
                $('#container1').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Estadística general'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: 'SI',
                    y: data.votossi
                }, {
                    name: 'NO',
                    y: data.votostotal-data.votossi
                }]
            }]
        });
            }
        });

        

        // Build the chart

    });
});