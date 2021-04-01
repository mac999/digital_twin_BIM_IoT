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

        new Chart(ctx, {
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
                'onClick': function (evt, item) {
                    alert("click");
                    resize();
                    // _this.viewer.isolate(_this.modelData.getIds(_this.propertyToUse, item[0]._model.label));
                }
            }
        });
    }
}