# Digital Twin for monitoring building enviroment
Digital Twin based Building Environment Monitoring using BIM, IoT, AI
<p align="center">
  <img height="200px" src="https://1.bp.blogspot.com/-HW_8OxVL-is/YGc5rrtJCVI/AAAAAAAA5s8/whBxss4XrsotQgnrWcNBjbql8yQKnqMMQCLcBGAsYHQ/s1877/a3.JPG"> <br/>
  <img height="160px" src="https://1.bp.blogspot.com/-AQWyAX1csp4/YGcvuBbsDcI/AAAAAAAA5ss/lFaR-u5pjEwr6pOce1ayvQO_Ktzx9i6TwCLcBGAsYHQ/s1919/a1.JPG"> 
  <img height="160px" src="https://1.bp.blogspot.com/-swdoS-w7MLY/YGcvuGJd0xI/AAAAAAAA5sw/BiRTxHJRaFgOpKrkv9soVYFrnBaX4HPkgCLcBGAsYHQ/s1920/a2.JPG"><br/>
  <b>demonstration</b>
</p>
<p align="center">
  <a href="https://youtu.be/vpp4oGP3DPI"><img width="400px" src="https://1.bp.blogspot.com/-OaqpSj6oYKU/YAsUJdbsIFI/AAAAAAAA5Bk/phBaKOy4F1YkVEIOJQ0UNcntFLqNXd0oACLcBGAsYHQ/w400-h300/KakaoTalk_20210122_130552110.jpg"/></a>
  <br/>  
  <b>DTB-BMS sensor data</b></br>
  <img height="200px" src="https://github.com/mac999/digital_twin/blob/master/anomaly_detection/fig2.JPG">
  <img height="200px" src="https://github.com/mac999/digital_twin/blob/master/anomaly_detection/fig4.JPG"><br/> 
  <b>anomaly detection using deep learing model</b>
</p>

# Description
This R&D project(2021) has the purpose of developing the simple prototype related to Digital Twin based Building Environment Monitoring using BIM, IoT, AI.</br>
This project includes like below. 
> Digital Twin concpet implimentation<br/>
> Open source based digital twin development method<br/>
> Connection dataset between BIM and IoT<br/>
> Anomaly detection based on environmantal data pattern using deep learing<br/>
> Visualize monitoring dataaset based on Web<br/>
> Develop RESTful API<br/>
> Develop anomaly detection model using deep learning</br>
In reference, this source code shows how to use Autodesk Forge, Node red, Arduino BLE sense, Mongo DB, node.js.<br/>

# Project Structure & Folders
Below is a description of the main directories in this repository:

* **DTB-BMS**: Contains the core application files for the **Digital Twin based Building Management System**. It integrates BIM models and real-time data for facility management.
* **anomaly_detection**: Includes deep learning models and scripts designed to identify irregular patterns or anomalies in environmental sensor data.
* **cesium-starterkit**: A template and basic configuration for using **CesiumJS** to visualize 3D geospatial data and BIM models within a web environment.
* **cesium-workshop**: Practical workshop materials and examples for implementing 3D Digital Twin features using the Cesium library.
* **mapbox-app**: A web-based application leveraging **Mapbox** for 2D/3D map visualization and building localization.
* **mongodb_IoT**: Contains database schemas and integration scripts for persisting time-series IoT sensor data into **MongoDB**.
* **resident_recognition_model_using_openpose**: An AI module utilizing **OpenPose** for human pose estimation to monitor occupancy or analyze resident behavior.
* **sensingNano**: Firmware and source code for the **Arduino Nano 33 BLE Sense**, which acts as the primary hardware node for collecting environmental data.
* **sensing_nano_nodered**: **Node-RED** flows and configurations for processing, routing, and visualizing data from the sensing nodes in real-time.

# Author
Taewook Kang (laputa99999@gmail.com)

# Reference
- [Taewook Kang, Yunjeong Mo, 2024, Comprehensive digital twin framework for building environment monitoring with emphasis on real-time data connectivity and predictability](https://www.sciencedirect.com/science/article/pii/S2666165923001916)
- [Autodesk Digital Twin platform architecture analysis](https://daddynkidsmakers.blogspot.com/2021/02/autodesk-forge-digital-twin.html)

# License
MIT License
