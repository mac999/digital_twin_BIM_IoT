// Title: DTB-BMS(Digital Twin and BIM based Building Management System)
// Name: Taewook Kang
// Email: laputa99999@gmail.com
// Created date: 2021.2.2
// Tools: Autodesk Forge, node, mongodb, axios, javascript
//
// Handles the Dashboard panels
var dashboardObjects = [];

function alertObject(obj){      
    msg = "";
    for(var key in obj) {
        msg = msg + 'key: ' + key + '\n' + 'value: ' + obj[key];
    }
    alert(msg);
}

$(document).ready(function () {
    $(document).on('DOMNodeInserted', function (e) {
        if ($(e.target).hasClass('orbit-gizmo')) {
            var dash1 = new Dashboard(NOP_VIEWER, [new BarChart('temp'), new BarChart('humi')]);        
            var dash2 = new Dashboard(NOP_VIEWER, [new BarChart('light'), new PieChart('all')]);
            dashboardObjects = [];   
            dashboardObjects.push(dash1);
            dashboardObjects.push(dash2);                               
        }
    });
})

class Dashboard {
    constructor(viewer, panels) {
        // alertObject(viewer);
        var _this = this;
        this._viewer = viewer;
        this._panels = panels;
        this.adjustLayout();
        this._viewer.addEventListener(Autodesk.Viewing.GEOMETRY_LOADED_EVENT, (viewer) => {
            _this.loadPanels();
        });
    }

    adjustLayout() {
        // this function may vary for layout to layout...
        // for learn forge tutorials, let's get the ROW and adjust the size of the 
        // columns so it can fit the new dashboard column, also we added a smooth transition css class for a better user experience
        var row = $(".row").children();
        if(row.length > 0)
        {
            var dashboard = document.getElementById("dashboard");
            if(dashboard == null)
                $(row[0]).removeClass('col-sm-7').addClass('col-sm-8 transition-width').after('<div class="col-sm-4 transition-width" id="dashboard"></div>');
        }
    }

    loadPanels () {
        var _this = this;
        _this._panels.forEach(function (panel) {
            // let's create a DIV with the Panel Function name and load it
            panel.load('dashboard', viewer);
        });        
    }

    updateData() {
        var _this = this;
        _this._panels.forEach(function (panel) {
            // let's create a DIV with the Panel Function name and load it
            panel.updateData();
        });  
    }
}

window.Dashboard = Dashboard;
window.dashboardObjects = dashboardObjects;