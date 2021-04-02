// Title: DTB-BMS(Digital Twin and BIM based Building Management System)
// Name: Taewook Kang
// Email: laputa99999@gmail.com
// Created date: 2021.2.2
// Tools: Autodesk Forge, node, mongodb, axios, javascript
//
function addData(chart, label, data) {
    chart.data.labels = label;
    chart.data.datasets[0].data = data;
    chart.update();
}

function removeData(chart) {
    chart.data.labels.pop();
    chart.data.datasets.forEach((dataset) => {
        dataset.data.pop();
    });
    chart.update();
}

class BarChart extends DashboardPanelChart {
    constructor(property) {
        super();

        this.propertyToUse = property;   
    }

    load(parentDivId, viewer) {
        super.load(parentDivId, this.constructor.name, viewer)
        this.drawChart();
    }

    drawChart() {
        var _this = this; // need this for the onClick event

        var canvas = document.getElementById(this.canvasId);
        var ctx = canvas.getContext("2d");
        var colors = this.generateColors(3);        

        var historyData = getSensorHistoryValue(currentArea, this.propertyToUse);

        this.chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: historyData[0], // ['3/1', '3/2', '3/3', '3/4', '3/5', '3/6', '3/7'], 
                datasets: [{
                    data: historyData[1], // [25, 30, 31, 35, 28, 32, 33],
                    backgroundColor: colors.background,
                    borderColor: colors.borders,
                    borderWidth: 1,
                    pointBackgroundColor: '#007bff'                    
                }]
            },
            // responsive: true,             
            // maintainAspectRatio: false,   
            // height: 200,         
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                legend: {
                    display: false
                },
                title: {
                    display: true,
                    text: (currentArea + "." + this.propertyToUse)
                },   
                layout: {
                    padding:{left:0,right:0,top:0,bottom:0}
                },                             
                'onClick': function (evt, item) {
                    // _this.viewer.isolate(_this.modelData.getIds(_this.propertyToUse, item[0]._model.label));
                }
            }
        });
    }

    updateData() {
        super.updateData();

        var chart = this.chart;
        chart.options.title.text = (currentArea + "." + this.propertyToUse);
        var sensor = this.propertyToUse;
        var historyData = getSensorHistoryValue(currentArea, sensor);
        addData(chart, historyData[0], historyData[1]);        
    }    
}