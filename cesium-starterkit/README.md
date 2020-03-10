# CesiumJS Starter Kit

This is a "starter kit" in the sense of showing how to link the CesiumJS map to Bing maps, 
GeoServer local maps, as well as interact with the CesiumJS large API to do things on the 
map to make it more interactive.  This is very bare bones basic and a start to get people to 
see the power of CesiumJS and what you can use on top of it to build GIS applications. 

There is a blog post [here](https://medium.com/@dale.bingham_30375/setup-geoserver-for-a-local-gis-application-like-cesiumjs-14322f1178d5) that goes over 
setting up GeoServer locally (or somewhere you choose) and how to load maps 
in it. This repo is the 2nd step: using those maps to build an application using a simple 
menu structure as a starting point. That 2nd blog post is [here](https://medium.com/@dale.bingham_30375/a-cesiumjs-starter-kit-with-geoserver-a96bfe767ba2).

FYI this is NOT production ready. It does not use JS classes or try/catch and good error trapping. 
It also needs to have input validation on the form for the drawing options to only allow alphanumeric. 
It is to help you get ideas out there, prototype, and get used to the CesiumJS API. And it is to 
help me have a starting point next time I am asked to do a GIS-based application. Which seems 
to be more and more!

## What this CesiumJS Starter Kit has

This is an example GH repo to show how you can use CesiumJS as a base for a GIS web application. 
I have this written up in a blog where you can see how it works. This gives you the base map, 
links to a local GeoServer with a few layers to add in, and an overall menu with examples of 
buttons, event listeners, and drawing on the map. 

* Menu
* Event Listeners for drawing circles and polygons
* Snapshot / Download the map screen
* Turn layers on/off
* Show the location of the mouse toggle
* Modal window to edit the shape name, description, and color

The CesiumJS JS and CSS are linked off their main site. The HTML/CSS/JS here is to supplement or add addition
look-and-feel as well as functionality on top of CesiumJS.

## Additional Information

* CesiumJS OSS library for 3D globes - https://cesiumjs.org/
* CesiumJS OSS Awesome Documentation - https://cesiumjs.org/refdoc/
* CesiumJS Demos - https://cesiumjs.org/demos/
* CesiumJS Sandbox - https://cesiumjs.org/Cesium/Build/Apps/Sandcastle/ 
* GeoServer GIS - http://geoserver.org/
* JSColor plugin - http://jscolor.com/
* Enable GeoServer CORS - https://docs.geoserver.org/latest/en/user/production/container.html