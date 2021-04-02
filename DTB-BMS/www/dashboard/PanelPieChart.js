class PieChart extends DashboardPanelChart {
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

        this.chart = new Chart(ctx, {
            type: 'doughnut',      
            data: {
                labels: ['Temp', 'Light', 'Humidity'],
                datasets: [{
                    data: [5, 6, 8],
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
                legend: {
                    display: true
                },
                'onClick': function (evt, item) {
                    // _this.viewer.isolate(_this.modelData.getIds(_this.propertyToUse, item[0]._model.label));
                }
            }
        });
    }
}