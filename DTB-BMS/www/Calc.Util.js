// Title: DTB-BMS(Digital Twin and BIM based Building Management System)
// Name: Taewook Kang
// Email: laputa99999@gmail.com
// Created date: 2021.2.2
// Tools: Autodesk Forge, node, mongodb, axios, javascript
//
function getSensorTableValue(eleName, sensor, op) {
    var total, min, max;
    total = max = 0;
    var areaTotal, areaMin, areaMax, areaCount;
    areaTotal = areaMax = areaCount = 0;
    min = areaMin = 999999;

    var table = document.getElementById("sensorDataTable");
    var rows = table.rows;
    if(typeof(rows) == 'undefined')
        return;

    for(var i = 1; i < rows.length; i++) {
        var cells = rows[i].cells;

        var sensorType = String(cells[2].innerHTML);
        if(sensorType.indexOf(String(sensor)) < 0)
            continue;

        var area = String(cells[1].innerHTML);
        var value = parseFloat(cells[4].innerHTML);
        total += value;
        if(value < min)
            min = value;
        if(value > max)
            max = value;

        if(area.indexOf(String(eleName)) < 0)
            continue;                
        areaTotal += value;
        if(value < areaMin)
            areaMin = value;
        if(value > areaMax)
            areaMax = value;
        areaCount++;
    }
    if(areaCount == 0)
        return [0, 0.0];

    var diff = max - min;
    if(diff == 0) {
        min = 0;
        diff = 100.0;
    }

    var areaAvr = areaTotal / areaCount;
    var areaDiff = areaMax - areaMin;

    if(op == 'average')
        return [areaAvr, (areaAvr - min) / diff]        
    if(op == 'max')
        return [areaMax, (areaMax - min) / diff];        
    if(op == 'min')
        return [areaMin, (areaMin - min) / diff];        
    return [areaDiff, (areaDiff - min) / diff];        
}

function getSensorHistoryValue(currentArea, sensor) {
    var dataset = [];

    var table = document.getElementById("sensorDataTable");
    if(table == null)
        return dataset;        
    var rows = table.rows;
    if(typeof(rows) == 'undefined')
        return dataset;

    // var map = new Map();
    var index = 0;
    var x = [];
    var y = [];

    if(currentArea == "all") {
        dataset[0] = x;
        dataset[1] = y;
        return dataset;
    }

    for(var i = rows.length - 1; i > 0; i--) {
        var cells = rows[i].cells;

        var sensorType = String(cells[2].innerHTML);
        if(sensorType.indexOf(String(sensor)) < 0)
            continue;

        var area = String(cells[1].innerHTML);
        var date = String(cells[3].innerHTML);        
        var value = parseFloat(cells[4].innerHTML);

        if(area.indexOf(String(currentArea)) < 0)
            continue;     

        x.push(date);
        y.push(value);
    }

    dataset[0] = x;
    dataset[1] = y;

    return dataset;
}

window.getSensorTableValue = getSensorTableValue;
window.getSensorHistoryValue = getSensorHistoryValue;