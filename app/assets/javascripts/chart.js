google.load('visualization', '1.0', {'packages':['corechart']});

google.setOnLoadCallback(drawChart);


function drawChart() {

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
                      colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
                     'width':375,
                     'height':300};


    var chart = new google.visualization.PieChart(document.getElementById('tag_chart'));
    chart.draw(data, options);
}