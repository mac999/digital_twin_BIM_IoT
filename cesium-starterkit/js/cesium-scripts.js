//////////////////////////////////////////////////////////////////////////
// Setting the slide down menu options and functionality
//////////////////////////////////////////////////////////////////////////
function openNav() {
    document.getElementById("menu").style.height = "90%";
    document.getElementById('menuOptions').setAttribute( "onClick", "closeNav()" );    
}
  
  /* Set the width of the side navigation to 0 */
  function closeNav() {
    document.getElementById("menu").style.height = "40px";
    document.getElementById('menuOptions').setAttribute( "onClick", "openNav()" );    
}

//////////////////////////////////////////////////////////////////////////
// Creating the CesiumJS world viewer
//////////////////////////////////////////////////////////////////////////
Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI5MDA1OGJhMi04NTY0LTQ0NDgtOWZkNi02ZWM1YzE1Y2VkODUiLCJpZCI6MjI3NzksInNjb3BlcyI6WyJhc3IiLCJnYyJdLCJpYXQiOjE1ODIwMzI3MTJ9.le7e8JdjCMK94zUohux5Wu-CWF0ydrrh7vSvxU3ZR4U';

var viewer = new Cesium.Viewer('cesiumContainer', {
    //selectionIndicator: false,
    sceneModePicker: false,
    baseLayerPicker: false
});
var canvas = viewer.canvas;
canvas.setAttribute('tabindex', '0'); // needed to put focus on the canvas for keyboard events later

var handlerMouse; // used to turn on/off mouse handler movements
// track the mouse to drop entities/POIs/etc. by keyboard
var currentLatitude = 0.0;
var currentLongitude = 0.0;

(function () {
    "use strict";

    //////////////////////////////////////////////////////////////////////////
    // Loading Imagery
    //////////////////////////////////////////////////////////////////////////

    // Remove default base layer
    //viewer.imageryLayers.remove(viewer.imageryLayers.get(0));

    // Add Sentinel-2 imagery
    //viewer.imageryLayers.addImageryProvider(new Cesium.IonImageryProvider({ assetId: 3954 }));
    var worldMap = new Cesium.WebMapServiceImageryProvider({
        url : 'http://localhost:8080/geoserver/wms',
        parameters: { 
            format:'image/png', 
            transparent:'true',
            tiled: true,
            enablePickFeatures: true
        }, 
        layers : 'florida:NE1_50M_SR_W',  // comma separated listing
        maximumLevel : 12
    });    
    viewer.imageryLayers.addImageryProvider(worldMap);
    viewer.imageryLayers._layers[1].show = false;

    var detailedMaps = new Cesium.WebMapServiceImageryProvider({
        url : 'http://localhost:8080/geoserver/wms',
        parameters: { 
            format:'image/png', 
            transparent:'true',
            tiled: true,
            enablePickFeatures: true
        }, 
        layers : 'florida:FL_planet_osm_roads',  // comma separated listing
        maximumLevel : 20
    });    
    viewer.imageryLayers.addImageryProvider(detailedMaps);
    viewer.imageryLayers._layers[2].show = false;

    //////////////////////////////////////////////////////////////////////////
    // Loading Terrain
    //////////////////////////////////////////////////////////////////////////

    // Load Cesium World Terrain
    // viewer.terrainProvider = Cesium.createWorldTerrain({
    //     requestWaterMask : true, // required for water effects
    //     requestVertexNormals : true // required for terrain lighting
    // });

    //////////////////////////////////////////////////////////////////////////
    // Configuring the Scene
    //////////////////////////////////////////////////////////////////////////

    // Enable lighting based on sun/moon positions
    //viewer.scene.globe.enableLighting = true;

    // Create an initial camera view
    var initialPosition = new Cesium.Cartesian3.fromDegrees(-82.3597, 27.8795, 18000.0);
    var initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(0.0, -75.0, 0.0);
    var homeCameraView = {
        destination : initialPosition,
        orientation : {
            heading : initialOrientation.heading,
            pitch : initialOrientation.pitch,
            roll : initialOrientation.roll
        }
    };
    // Set the initial view
    viewer.scene.camera.setView(homeCameraView);

    //Add some camera flight animation options
    homeCameraView.duration = 2.0;
    homeCameraView.maximumHeight = 2000;
    homeCameraView.pitchAdjustHeight = 2000;
    homeCameraView.endTransform = Cesium.Matrix4.IDENTITY;
    // Override the default home button
    viewer.homeButton.viewModel.command.beforeExecute.addEventListener(function (e) {
        e.cancel = true;
        viewer.scene.camera.flyTo(homeCameraView);
    });

    // Set up clock and timeline.
    viewer.clock.shouldAnimate = true; // default

    // //////////////////////////////////////////////////////////////////////////
    // // Custom mouse interaction for highlighting and selecting
    // //////////////////////////////////////////////////////////////////////////

    // If the mouse is over a point of interest, change the entity billboard scale and color
    var previousPickedEntity;
    var handler = viewer.screenSpaceEventHandler;
    handler.setInputAction(function (movement) {
        var pickedPrimitive = viewer.scene.pick(movement.endPosition);
        var pickedEntity = Cesium.defined(pickedPrimitive) ? pickedPrimitive.id : undefined;
        // Unhighlight the previously picked entity
        if (Cesium.defined(previousPickedEntity)) {
            previousPickedEntity.billboard.scale = 1.0;
        }
        // Highlight the currently picked entity
        if (Cesium.defined(pickedEntity) && Cesium.defined(pickedEntity.billboard)) {
            pickedEntity.billboard.scale = 1.5;
            previousPickedEntity = pickedEntity;
        }
    }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);

    // make the menu-accordions for sections
    // the panels they operate MUST be the next HTML element for this to work
    var acc = document.getElementsByClassName("menu-accordion");
    var i;
    for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        /* Toggle between adding and removing the "active" class,
        to highlight the button that controls the menu-panel */
        this.classList.toggle("active");

        /* Toggle between hiding and showing the active menu-panel */
        var menuPanel = this.nextElementSibling;
        if (menuPanel.style.display === "block") {
            menuPanel.style.display = "none";
        } else if (menuPanel.style.display == "") { // initially this starts open 
            menuPanel.style.display = "none"; 
        } else {
            menuPanel.style.display = "block";
        }
    });
    }
    // turn on keyboard listener
    enableKeyboardFunctions();
}());

//////////////////////////////////////////////////////////////////////////
// Menu Item Panel Item Functions
//////////////////////////////////////////////////////////////////////////

function addShapeToMenu(id, title, lat, lon) {
    // create the DIV string
    var strTrackItem = '<div class="menu-panel-item menu-panel-item-normal" id="shapemenu' + id + '">';
    strTrackItem += '<div class="menuItemName" onclick="highlightItem(\'' + id + '\')"><span id="shapemenuname' + id + '">' + title + '</span> (' + lat + ', ' + lon + ')</div><div class="subMenu">';
    strTrackItem += '<button class="menuitemButton" onclick="gotoItem(\'' + id + '\',' + lat + ',' + lon+ '); return false;">go to</button>';
    strTrackItem += '<button class="menuitemButton" onclick="editShapeItem(\'' + id + '\'); return false;">edit</button>';
    strTrackItem += '<button class="menuitemButton" onclick="removeShapeItem(\'' + id + '\'); return false;">delete</button>';
    strTrackItem += '</div></div>';

    // append to what is already in the panel DIV id=panelShapes
    var shapes = document.getElementById("panelShapes");
    shapes.innerHTML = shapes.innerHTML + strTrackItem;
}
// when you edit a shape, update the menu with the new name/title you added
function updateShapeMenuName(id, newTitle) {
    try {
        document.getElementById("shapemenuname" + id).textContent=newTitle;
    }
    catch(err) {
        alert('There is a problem updating the menu for that shape');
    }
}

//////////////////////////////////////////////////////////////////////////
// Menu Shape/Track Functions
//////////////////////////////////////////////////////////////////////////
function increaseMenuCount (menuCountItem) {
    var obj = document.getElementById(menuCountItem);
    obj.textContent = parseInt(obj.textContent) + 1;
    var obj = null;
}

function decreaseMenuCount (menuCountItem) {
    var obj = document.getElementById(menuCountItem);
    obj.textContent = parseInt(obj.textContent) - 1;
    var obj = null;
}

function removeShapeItem(id) {
    if (confirm("Are you sure you want to remove this shape?") == true) {
        var shape = document.getElementById("shapemenu" + id);
        if (shape) {
            shape.remove();
        }
        // remove from the map
        removeItem(id);
        decreaseMenuCount('menuShapeCount');
    }
}

function highlightItem(id) {
    viewer.selectedEntity = viewer.entities.getById(id);
}

// zoom to the location on the map using lat and lon and entity Id
function gotoItem(id, lat, lon) {
    viewer.camera.flyTo({
        destination : Cesium.Cartesian3.fromDegrees(lon, lat, 5000.0)
    });
}

// removes any shape or track or POI or waypoint on the screen by passing the ID
function removeItem(id) {
    if (id) viewer.entities.removeById(id);
}

//////////////////////////////////////////////////////////////////////////
// Entity Location on the map
//////////////////////////////////////////////////////////////////////////

var entityLocation = viewer.entities.add({
    name: "position",
    label : {
        show : false,
        showBackground : true,
        font : '14px monospace',
        horizontalOrigin : Cesium.HorizontalOrigin.LEFT,
        verticalOrigin : Cesium.VerticalOrigin.TOP,
        pixelOffset : new Cesium.Cartesian2(15, 0)
    }
});
// Mouse over the globe to see the Lat/Lon position
var handlerLocation = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
handlerLocation.setInputAction(function(movement) {
    var cartesian = viewer.camera.pickEllipsoid(movement.endPosition, viewer.scene.globe.ellipsoid);
    if (cartesian) {
        var cartographic = Cesium.Cartographic.fromCartesian(cartesian);
        var longitudeString = Cesium.Math.toDegrees(cartographic.longitude).toFixed(4);
        var latitudeString = Cesium.Math.toDegrees(cartographic.latitude).toFixed(4);

        entityLocation.position = cartesian;
        currentLatitude = latitudeString;
        currentLongitude = longitudeString;
        entityLocation.label.text =
            'Lat: ' + latitudeString + '\u00B0' +
            '\nLon: ' + longitudeString + '\u00B0';
    } else {
        entityLocation.label.show = false;
    }
}, Cesium.ScreenSpaceEventType.MOUSE_MOVE);

// show and hide the location but keep tracking it
function showMouseLocationOnMap() {
    entityLocation.label.show = true;
}
function hideMouseLocationOnMap() {
    entityLocation.label.show = false;
}
var showLocationElement =  document.getElementById('showCursorLocation');
showLocationElement.addEventListener('change', function (e) {
    if (e.target.checked)
        showMouseLocationOnMap();
    else
        hideMouseLocationOnMap();
});

//////////////////////////////////////////////////////////////////////////
// Drawing Objects on the Map from the Menu
//////////////////////////////////////////////////////////////////////////
function formatShapeDescriptionBox(name, description, id) {
    var date = new Date();
    var infoBox = '<table class="cesium-infoBox-defaultTable cesium-infoBox-defaultTable-lighter"><tbody>' +
    '<tr><th>Name</th><td>' + name + '</td></tr>' + 
    '<tr><th>Description</th><td>' + description + '</td></tr>' + 
    '<tr><th>Updated</th><td>' + date.toDateString() + '</td></tr>' + 
    '<tr><th>id</th><td>' + id + '</td></tr>' + 
    '</tbody></table>';

    return infoBox;
}

function drawEllipse (name, lat, lon, altitude, height, length, color, alpha, description){
    var newColor = Cesium.Color.fromCssColorString(color);
    var myEllipse = viewer.entities.add({
        position: Cesium.Cartesian3.fromDegrees(lon, lat),
        name : name,
        ellipse : {
            semiMinorAxis : height, // y axis
            semiMajorAxis : length, // x axis
            height: altitude,
            material : newColor.withAlpha(alpha), // generate the color from RGB and Alpha
            outline : true // height must be set for outline to display
        }
    });
    myEllipse.description = formatShapeDescriptionBox(name, description, myEllipse.id);
    myEllipse.addProperty("myDescription");
    myEllipse.myDescription = description;
    return myEllipse;
}

function drawLine (name, latStart, lonStart, latEnd, lonEnd, width, color, alpha, description ) {
    var newColor = Cesium.Color.fromCssColorString(color);
    var myLine = viewer.entities.add({
        name : name,
        polyline : {
            positions : Cesium.Cartesian3.fromDegreesArray([lonStart, latStart, lonEnd, latEnd]),
            width : width,
            material : newColor.withAlpha(alpha),
            clampToGround : true
        }
    });
    myLine.description = formatShapeDescriptionBox(name, description, myLine.id);
    myLine.addProperty("myDescription");
    myLine.myDescription = description;
    return myLine;
}

function drawPolygon (name, pointsArray, color, alpha, description) {
    var newColor = Cesium.Color.fromCssColorString(color);
    var myPolygon = viewer.entities.add({
        name : name,
        polygon : {
            hierarchy : Cesium.Cartesian3.fromDegreesArray(pointsArray),
            material : newColor.withAlpha(alpha),
        }
    });
    myPolygon.description = formatShapeDescriptionBox(name, description, myPolygon.id);
    myPolygon.addProperty("myDescription");
    myPolygon.myDescription = description;
    return myPolygon;
}

function drawPoint(name, lat, lon, size, color, alpha) {
    var newColor = Cesium.Color.fromCssColorString(color);
    var myPoint = viewer.entities.add({
        name: name,
        position : Cesium.Cartesian3.fromDegrees(lon, lat),
        point : {
            pixelSize : size,
            color : newColor.withAlpha(alpha),
        }
    });
    return myPoint;
}

function drawText(name, text, lat, lon, color, alpha, font, size, description) {
    var newColor = Cesium.Color.fromCssColorString(color);
    var newText = viewer.entities.add({
        name: name,
        position : Cesium.Cartesian3.fromDegrees(lon, lat),
        label: {
            text : text,
            font : size + ' ' + font, //'24px Helvetica',
            fillColor : newColor.withAlpha(alpha),
            outlineColor : Cesium.Color.BLACK,
            outlineWidth : 2,
            style : Cesium.LabelStyle.FILL_AND_OUTLINE,
            horizontalOrigin: Cesium.HorizontalOrigin.LEFT,
            verticalOrigin: Cesium.VerticalOrigin.TOP
            // showBackground : false,
            // backgroundColor : new Cesium.Color(0.165, 0.165, 0.165, 0.8),
            // backgroundPadding : new Cesium.Cartesian2(7, 5),
        }
      });
    newText.description = formatShapeDescriptionBox(name, description, newText.id);
    newText.addProperty("myDescription");
    newText.myDescription = description;
    return newText;
}

//////////////////////////////////////////////////////////////////////////
// Options Menu Functions
//////////////////////////////////////////////////////////////////////////

function changeLayers(value) {
    if (value == "satellite"){
        viewer.imageryLayers._layers[0].show = true;
        viewer.imageryLayers._layers[1].show = false;
        viewer.imageryLayers._layers[2].show = false;
    }
    else if (value == "roads"){
        viewer.imageryLayers._layers[0].show = true;
        viewer.imageryLayers._layers[1].show = false;
        viewer.imageryLayers._layers[2].show = true;
    }
    else if (value == "hybrid"){
        viewer.imageryLayers._layers[0].show = false;
        viewer.imageryLayers._layers[1].show = true;
        viewer.imageryLayers._layers[2].show = true;
    }
}

var btnSnapshotElement = document.getElementById('btnSnapshot');
btnSnapshotElement.addEventListener('click', function (e) {
    // configure settings
    var targetResolutionScale = 2.0; // for screenshots with higher resolution set to 2.0 or even 3.0
    var timeout = 500; // in ms
    
    var scene = viewer.scene;
    if (!scene) {
        console.error("No scene");
    }

    // define callback functions
    var prepareScreenshot = function(){
        var canvas = scene.canvas;    
        viewer.resolutionScale = targetResolutionScale;
        scene.preRender.removeEventListener(prepareScreenshot);
        // take snapshot after defined timeout to allow scene update (ie. loading data)
        setTimeout(function(){
            scene.postRender.addEventListener(takeScreenshot);
        }, timeout);
    }

    var takeScreenshot = function(){    
        scene.postRender.removeEventListener(takeScreenshot);
        var canvas = scene.canvas;
        canvas.toBlob(function(blob){
            var url = URL.createObjectURL(blob);
            downloadURI(url, "cesiumjs-snapshot-" + targetResolutionScale.toString() + "x.png");
            // reset resolutionScale
            viewer.resolutionScale = 1.0;
        });
    }

    scene.preRender.addEventListener(prepareScreenshot);

    function downloadURI(uri, name) {
        var link = document.createElement("a");
        link.download = name;
        link.href = uri;
        // mimic click on "download button"
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        delete link;
    }
});

var handlerDrawingObjects; // placeHolder for the line drawing start and stop
var handlerActiveLineDrawing; // updates as you move the mouse to actively draw a line
var handlerCircleObject; // placeholder for the circle drawing tool
var handlerDrawingPolygon; // for the initial points for drawying polygons
var handlerDrawingPolygonDblClick; // the final polygon point then you connect them all and draw

var btnDrawCircleElement = document.getElementById('btnDrawCircle');
var lineStartLat; // starting lat on lines for the line drawing and circle drawing
var lineStartLon; // starting lon on lines for the line drawing and circle drawing
var currentLineDrawing;
btnDrawCircleElement.addEventListener('click', function (e) {
    // click to get the center of the circle
    // do a 2nd click to get the distance / radius
    // calculate the distance between the points and use that in meters for the X and Y axis in the Ellipse call
    turnOffAllButtonElements();
    showDrawingOptionsModal();
    handlerCircleObject = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
    showMouseLocationOnMap();
    handlerCircleObject.setInputAction(function(movement) {
        if (!lineStartLat && !lineStartLon) { // start the beginning of the line
            lineStartLat = currentLatitude;
            lineStartLon = currentLongitude;
            // draw the initial line
            currentLineDrawing = drawLine("myCircleLine", lineStartLat, lineStartLon, lineStartLat, lineStartLon, 3, "#ff0000", 0.5, "Temporary line for drawing a circle");
            // add a listener to update the currentLineDrawing dynamicall as you draw it
            handlerActiveLineDrawing = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
            handlerActiveLineDrawing.setInputAction(function(movement) {
                currentLineDrawing.polyline.positions = Cesium.Cartesian3.fromDegreesArray([lineStartLon, lineStartLat, currentLongitude, currentLatitude]);
            }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);
        }
        else { // this is the ending of the line
            hideMouseLocationOnMap();
            // use the distance between points for the height and width
            var distance = calculateDistance(lineStartLat, lineStartLon, currentLatitude, currentLongitude);
            var ellipse = drawEllipse(getInputFieldValue("modalDrawingOptionsName"),lineStartLat, lineStartLon, 
                0, distance, distance, '#'+getInputFieldValue("modalDrawingOptionsColor"), 0.6, getInputFieldValue("modalDrawingOptionsDescription"));
            viewer.entities.removeById(currentLineDrawing.id); // remove the line we used to make the circle
            handlerCircleObject = handlerCircleObject && handlerCircleObject.destroy();
            handlerActiveLineDrawing = handlerActiveLineDrawing && handlerActiveLineDrawing.destroy();
            addShapeToMenu(ellipse.id, "Circle - " + getInputFieldValue("modalDrawingOptionsName"), lineStartLat, lineStartLon);
            resetDrawingOptionFields();
            lineStartLat = null;
            lineStartLon = null;
            currentLineDrawing = null;
            increaseMenuCount('menuShapeCount');
        }
    }, Cesium.ScreenSpaceEventType.LEFT_CLICK);
});

// Draw a polygon by clicking on all the points
var btnDrawPolygonElement = document.getElementById('btnDrawPolygon');
var currentPolygonPoints = []; // collect LON / LAT pairs
var currentPolygonLatLon = [];
var polygonPoint;
// 1. Click the button to enable mouse tracking
// 2. Every left click is a point, and put the lon and lat into an array
// 3. Listen also for LEFT_DOUBLE_CLICK to finalize the last point, add to the array, and call drawPolygon
btnDrawPolygonElement.addEventListener('click', function (e) {
    turnOffAllButtonElements();
    showDrawingOptionsModal();
    handlerDrawingPolygon = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
    handlerDrawingPolygonDblClick = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
    showMouseLocationOnMap();
    // double click sets the last point
    handlerDrawingPolygonDblClick.setInputAction(function(movement) {
        currentPolygonLatLon.push(currentLongitude);
        currentPolygonLatLon.push(currentLatitude);
        var polygon = drawPolygon(getInputFieldValue("modalDrawingOptionsName"), currentPolygonLatLon, 
        '#'+getInputFieldValue("modalDrawingOptionsColor"), 0.6, getInputFieldValue("modalDrawingOptionsDescription"));
        addShapeToMenu(polygon.id, "Polygon - " + getInputFieldValue("modalDrawingOptionsName"), currentLatitude, currentLongitude);
        handlerDrawingPolygon = handlerDrawingPolygon && handlerDrawingPolygon.destroy();
        handlerDrawingPolygonDblClick = handlerDrawingPolygonDblClick && handlerDrawingPolygonDblClick.destroy();
        hideMouseLocationOnMap();
        resetDrawingOptionFields();
        // for all the collected points, remove by ID
        currentPolygonPoints.forEach(function(point) {
            viewer.entities.removeById(point);
          });
        currentPolygonLatLon = []; // empty the lon/lat listings
        currentPolygonPoints = []; // empty the points listings
        increaseMenuCount('menuShapeCount');
      }, Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
    // click sets all the points
    handlerDrawingPolygon.setInputAction(function(movement) {
        currentPolygonLatLon.push(currentLongitude);
        currentPolygonLatLon.push(currentLatitude);
        polygonPoint = drawPoint("boxFirstPoint", currentLatitude, currentLongitude, 10, "#ffffcc", 0.6);
        if (polygonPoint) currentPolygonPoints.push(polygonPoint.id); // remember the points
    }, Cesium.ScreenSpaceEventType.LEFT_CLICK);
});

// Turn off all the button listeners that are interactively drawing on the screen
// Do this to disable all editing, before you enable a specific editor
// You don't want multiple ones going on at the same time.
function turnOffAllButtonElements() {
    handlerDrawingObjects = handlerDrawingObjects && handlerDrawingObjects.destroy();
    handlerActiveLineDrawing = handlerActiveLineDrawing && handlerActiveLineDrawing.destroy();
    handlerCircleObject = handlerCircleObject && handlerCircleObject.destroy();
    handlerDrawingPolygon = handlerDrawingPolygon && handlerDrawingPolygon.destroy();
    handlerDrawingPolygonDblClick = handlerDrawingPolygonDblClick && handlerDrawingPolygonDblClick.destroy();
}

//////////////////////////////////////////////////////////////////////////
// General Modal Window Functions
//////////////////////////////////////////////////////////////////////////

// set the DDL dropdown for any modal
function setSelectedFieldText(fieldName, text) {
    var dd = document.getElementById(fieldName);
    for (var i = 0; i < dd.options.length; i++) {
        if (dd.options[i].text === text) {
            dd.selectedIndex = i;
            break;
        }
    }
}

// get the value of the drawing object textbox
function getInputFieldValue(fieldName) {
    var field = document.getElementById(fieldName);
    if (field) 
        return field.value;
    else
        return '';
}

// get the value of the drawing object select dropdown
function getSelectFieldValue(fieldName) {
    var field = document.getElementById(fieldName);
    if (field) 
        return field.options[field.selectedIndex].text;
    else
        return '';
}

//////////////////////////////////////////////////////////////////////////
// Drawing Modal Window Functions
//////////////////////////////////////////////////////////////////////////

// reset all fields and open the modal window
function showDrawingOptionsModal() {
    disableKeyboardFunctions();
    resetDrawingOptionFields();
    (document.getElementById('divModalDrawingOptions')).style.display = "block";
}

// set all the options on the drawing objects for colors and such
// save the data and then keep going
function setDrawingOptions() {
    closeDrawingOptionsModal(); // just close and leave the fields alone
}

// cancel button clicked, so reset fields and close the modal window
function cancelDrawingOptions() {
    hideMouseLocationOnMap();
    turnOffAllButtonElements();
    resetDrawingOptionFields();
    closeDrawingOptionsModal();
    enableKeyboardFunctions();
}

// reset all the fields for the Drawing Options modal dialog
function resetDrawingOptionFields() {
    document.getElementById('modalDrawingOptionsId').value = '';
    document.getElementById('modalDrawingOptionsName').value = '';
    document.getElementById('modalDrawingOptionsDescription').value = '';
    document.getElementById('modalDrawingOptionsColor').value = '00008b';
    document.getElementById('modalDrawingOptionsColor').jscolor.fromString('00008b');
    // reset the buttons
    document.getElementById('btnDrawingOptionsSave').style.display = "none";
    document.getElementById('btnDrawingOptionsDraw').style.display = "";
}

// show the Edit window by opening the form and filling in data from the entity
function editShapeItem(id) {
    // set this as the highlighted item
    highlightItem(id);
    showDrawingOptionsModal();
    document.getElementById('btnDrawingOptionsSave').style.display = "";
    document.getElementById('btnDrawingOptionsDraw').style.display = "none";
    var obj = viewer.entities.getById(id);
    if (obj) {
        var name = document.getElementById('modalDrawingOptionsName');
        var desc = document.getElementById('modalDrawingOptionsDescription');
        var currentId = document.getElementById('modalDrawingOptionsId');
        if (name) name.value = obj.name;
        if (desc) desc.value = obj.myDescription;
        if (currentId) currentId.value = id; // save the Id for the update

        // fill in the values on the form from the entity piece
        // ellipse, polyline, polygon, label are the types we would use to find the color
        var color = '';
        if (obj.polygon) 
            color = obj.polygon.material.color._value.toCssColorString();
        else if (obj.ellipse)
            color = obj.ellipse.material.color._value.toCssColorString();
        if (color) // if we found it, use it
        {
            // change the format and then get 'er dun i.e. .jscolor.fromRGB(77, 230, 51)
            color = color.replace("rgba(", "");
            color = color.replace("rgb(", ""); // in case this is called w/o alpha get that also
            color = color.replace(")","");
            // split on the comma and take the first three values for R, G, and B
            var rgb = color.split(",");
            if (rgb && rgb.length >= 3) {
                document.getElementById('modalDrawingOptionsColor').jscolor.fromRGB(rgb[0], rgb[1], rgb[2]);
            }
        }
    }
}

// called from the Edit Shape dialog box
function saveDrawingOptions() {
    var newColor = Cesium.Color.fromCssColorString('#'+getInputFieldValue("modalDrawingOptionsColor"));
    var entity = viewer.selectedEntity;
    if (!entity) {
        // if the selected was unselected somehow, get the Id based on what was used to edit
        viewer.entities.getById(getInputFieldValue('modalDrawingOptionsId'));
    }
    if (entity) {
        entity.myDescription = getInputFieldValue("modalDrawingOptionsDescription");
        entity.name = getInputFieldValue("modalDrawingOptionsName");
        // based on the shape make sure you get the color setting right
        if (entity.ellipse) {
            entity.ellipse.material = newColor.withAlpha(0.7)
        }
        else if (entity.polygon) {
            entity.polygon.material = newColor.withAlpha(0.7)
        }
        // reset the description box with the updated information
        entity.description = formatShapeDescriptionBox(entity.name, entity.myDescription, entity.id);
        // reset the menu name in the Shapes listing
        updateShapeMenuName(entity.id, entity.name) ;
    }
    // close it and we will reset if we need it again on open
    closeDrawingOptionsModal();
}

// just close the drawing options modal
function closeDrawingOptionsModal() {
    document.getElementById('divModalDrawingOptions').style.display = 'none';
    enableKeyboardFunctions();
}

//////////////////////////////////////////////////////////////////////////
// CesiumJS Utility Functions
//////////////////////////////////////////////////////////////////////////
function calculateDistance(startLat, startLon, endLat, endLon) {
    var startCartesian3Point = Cesium.Cartesian3.fromDegrees(startLon, startLat);
    var endCartesian3Point = Cesium.Cartesian3.fromDegrees(endLon, endLat);

    var startCartographicPoint = Cesium.Cartographic.fromCartesian(startCartesian3Point);
    var endCartographicPoint = Cesium.Cartographic.fromCartesian(endCartesian3Point);

    var ellipsoidGeodesic = new Cesium.EllipsoidGeodesic(startCartographicPoint, endCartographicPoint );
    // distance is in meters, show we can transform this
    var distance = ellipsoidGeodesic.surfaceDistance;

    return distance;
}
function calculateMilesFromMeters(length) {
    return length * 0.000621371192;
}
function calculateMetersFromMiles(length) {
    return length * 1609.344;
}
//////////////////////////////////////////////////////////////////////////
// Keyboard Functions
// w = drop waypoint wherever the mouse is
// p = add point of interest (POI) wherever the mouse is
// - = zoom out 2x
// + = zoom in 2x
//////////////////////////////////////////////////////////////////////////

function enableKeyboardFunctions() {
    document.addEventListener("keypress", keyPressMapElements, false);
}
function disableKeyboardFunctions() {
    document.removeEventListener("keypress", keyPressMapElements);
}

function keyPressMapElements(e) {
    if (e.key == '+') {
        var cartographic = new Cesium.Cartographic();
        var cartesian = new Cesium.Cartesian3();
        var ellipsoid = viewer.scene.mapProjection.ellipsoid;
        ellipsoid.cartesianToCartographic(viewer.scene.camera.position, cartographic);
        if (cartographic.height > 10) {
            cartographic.height = (cartographic.height / 2);
            ellipsoid.cartographicToCartesian(cartographic, cartesian);
            viewer.scene.camera.position = cartesian;
        }
        else {
            alert("Already at maximum zoom");
        }
    }
    else if (e.key == "-") {
        var cartographic = new Cesium.Cartographic();
        var cartesian = new Cesium.Cartesian3();
        var ellipsoid = viewer.scene.mapProjection.ellipsoid;
        ellipsoid.cartesianToCartographic(viewer.scene.camera.position, cartographic);
        if (cartographic.height > 10) {
            cartographic.height = (cartographic.height * 2);
            ellipsoid.cartographicToCartesian(cartographic, cartesian);
            viewer.scene.camera.position = cartesian;
        }
        else {
            alert("Already at maximum zoom");
        }
    }
}