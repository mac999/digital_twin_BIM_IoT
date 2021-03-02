function CreateTable() {
    // CREATE DYNAMIC TABLE.
    var table = document.createElement('table');

    // SET THE TABLE ID. 
    // WE WOULD NEED THE ID TO TRAVERSE AND EXTRACT DATA FROM THE TABLE.
    table.setAttribute('id', 'empTable');

    var arrHead = new Array();
    arrHead = ['Emp. ID', 'Emp.Name', 'Designation'];

    var arrValue = new Array();
    arrValue.push(['1', 'Green Field', 'Accountant']);
    arrValue.push(['2', 'Arun Banik', 'Project Manager']);
    arrValue.push(['3', 'Dewane Paul', 'Programmer']);

    var tr = table.insertRow(-1);

    for (var h = 0; h < arrHead.length; h++) {
        var th = document.createElement('th');              // TABLE HEADER.
        th.innerHTML = arrHead[h];
        tr.appendChild(th);
    }

    for (var c = 0; c <= arrValue.length - 1; c++) {
        tr = table.insertRow(-1);

        for (var j = 0; j < arrHead.length; j++) {
            var td = document.createElement('td');          // TABLE DEFINITION.
            td = tr.insertCell(-1);
            td.innerHTML = arrValue[c][j];                  // ADD VALUES TO EACH CELL.
        }
    }

    // NOW CREATE AN INPUT BOX TYPE BUTTON USING createElement() METHOD.
    var button = document.createElement('input');

    // SET INPUT ATTRIBUTE 'type' AND 'value'.
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Read Table Data');

    // ADD THE BUTTON's 'onclick' EVENT.
    button.setAttribute('onclick', 'GetTableValues()');

    // FINALLY ADD THE NEWLY CREATED TABLE AND BUTTON TO THE BODY.
    document.body.appendChild(table);
    document.body.appendChild(button);
}

function renderTest() {
    var table = "<table class='table table-striped table-sm'>";
    var head = "<thead><tr><th>###</th><th>Area</th><th>Type</th><th>Name</th><th>Time</th><th>Data</th></tr></thead>";
    var body = "<tbody>";
    var row = "<tr><td>9</td><td>Bldg-9</td><td>Temperature</td><td>T1</td><td>2/12/2021 06:10</td><td>73</td></tr>";
    var foot = "</tbody></table>"

    var htmlElement = document.getElementById('sensorTestTable');
    if(htmlElement)
    {
        htmlElement.append(table + head + body + row + foot);
        CreateTable();
    }
}