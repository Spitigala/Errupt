function drawChart() {


    if (document.getElementById("tag_chart") !== null) {
        var tagCount = document.getElementById("tag_chart").dataset.tags;
        var parsedTagCount = JSON.parse(tagCount);

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');

        for(var index in parsedTagCount) {
            data.addRows([
                [index, parsedTagCount[index]]
            ]);
        }

        var options = {'title':'Errorlog Breakdown',
                          colors: ['#CF000F', '#9A12B3', '#19B5FE', '#f3b49f', '#f6c7b6'],
                         'width':375,
                         'height':300};


        var chart = new google.visualization.PieChart(document.getElementById('tag_chart'));
        chart.draw(data, options);
    }
}

function init () {
    $(document).on('page:change', drawChart);
    drawChart();
}

google.load('visualization', '1.0', {'packages':['corechart'], callback: init});