# DTB-BMS(Digital Twin and BIM based Building Management System)

[![Node.js](https://img.shields.io/badge/Node.js-8.11.1-blue.svg)](https://nodejs.org/)
[![npm](https://img.shields.io/badge/npm-6.1.0-blue.svg)](https://www.npmjs.com/)
![Platforms](https://img.shields.io/badge/platform-windows%20%7C%20osx%20%7C%20linux-lightgray.svg)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://opensource.org/licenses/MIT)

[![oAuth2](https://img.shields.io/badge/oAuth2-v1-green.svg)](https://forge.autodesk.com/)
[![Data-Management](https://img.shields.io/badge/Data%20Management-v2-green.svg)](https://forge.autodesk.com/)
[![Model-Derivative](https://img.shields.io/badge/Model%20Derivative-v2-green.svg)](https://forge.autodesk.com/)
[![Viewer](https://img.shields.io/badge/Viewer-v7-green.svg)](https://forge.autodesk.com/)

# Description
In this DTB-BMS(Digital Twin and BIM based Building Management System), we will be creating a simple web page that allows end users to upload some files to Forge storage service, then translate them and display them in a web browser.

- IoT dataset visualization
- IoT-BIM connnection
- Sensing and collecting IoT data 
- Querying IoT dataset with range, type
- Download EXCEL csv file from IoT dataset
- Support MongoDB and node-red
- Save dataset from Arduino Nano Sense 33 BLE
- Authenticate your developer identity
- Create a bucket
- Get bucket detail
- Save a supported file to a bucket
- Read the uploaded file from a bucket
- Translate the file to the SVF format
- Display the file in a web browser

<p align="center">
  <img width="400px" src="https://1.bp.blogspot.com/-HW_8OxVL-is/YGc5rrtJCVI/AAAAAAAA5s8/whBxss4XrsotQgnrWcNBjbql8yQKnqMMQCLcBGAsYHQ/s1877/a3.JPG"><br/>
  <img width="400px" src="https://1.bp.blogspot.com/-AQWyAX1csp4/YGcvuBbsDcI/AAAAAAAA5ss/lFaR-u5pjEwr6pOce1ayvQO_Ktzx9i6TwCLcBGAsYHQ/s1919/a1.JPG"><br/>
  <img width="400px" src="https://1.bp.blogspot.com/-swdoS-w7MLY/YGcvuGJd0xI/AAAAAAAA5sw/BiRTxHJRaFgOpKrkv9soVYFrnBaX4HPkgCLcBGAsYHQ/s1920/a2.JPG"><br/>
  <br/>
  <b>DTB-BMS screen</b>
</p>
<p align="center">
  <a href="https://youtu.be/vpp4oGP3DPI"><img width="400px" src="https://1.bp.blogspot.com/-OaqpSj6oYKU/YAsUJdbsIFI/AAAAAAAA5Bk/phBaKOy4F1YkVEIOJQ0UNcntFLqNXd0oACLcBGAsYHQ/w400-h300/KakaoTalk_20210122_130552110.jpg"/></a>
  <br/>  
  <b>DTB-BMS sensor data</b>
</p>

# Setup

## Prerequisites
For Arduino nano 
1. Install [Arduino IDE](https://www.arduino.cc/en/software)
2. Connect Arduino nano and notebook
3. Upload [IoT sensing code](https://github.com/mac999/Projects/tree/master/sensing_nano_nodered)

For node-red 
1. Install [node.js](https://nodejs.org/ko/download/)
2. Install [node-red](https://nodered.org/docs/getting-started/local)
3. Import [IoT-DB connection code](https://github.com/mac999/Projects/blob/master/DTB-BMS/flows.json)
4. Install node-red palette such as Dashboard, Serial, MongoDB.

For MongoDB database
1. Install [MongoDB](https://docs.mongodb.com/manual/installation/)

For MongoDB REST API server
1. Download [REST API server](https://github.com/mac999/Projects/tree/master/mongodb_IoT)
2. Run node server

For Autodesk Forge App account creation
1. A Forge account: [Getting Started with Forge](https://forge.autodesk.com/developer/getting-started)
2. A text editor of your choice. (For example Brackets or Visual Studio Code are good choices.)
3. A basic knowledge of :
    - HTML and CSS
    - JavaScript ES6
    - Command-line programs
      - Node.js Command Line (for Windows users)
      - Terminal (for Mac/Linux/Unix users)
4. Download [DTB-BMS server code](https://github.com/mac999/Projects/tree/master/DTB-BMS) and Run npm start

## Running locally

Install [NodeJS](https://nodejs.org/) (version 8 or newer).

Clone this project or download it. It's recommended to install [GitHub desktop](https://desktop.github.com/).

To run it, install the required packages, set the enviroment variables with your client ID & secret and finally start it. Via command line, navigate to the folder where this repository was cloned and use the following:

Mac OSX/Linux (Terminal)

```bash
npm install
export FORGE_CLIENT_ID=<<YOUR CLIENT ID FROM DEVELOPER PORTAL>>
export FORGE_CLIENT_SECRET=<<YOUR CLIENT SECRET>>
npm start
```

Windows (use Node.js command line from Start menu)

```bash
npm install
set FORGE_CLIENT_ID=<<YOUR CLIENT ID FROM DEVELOPER PORTAL>>
set FORGE_CLIENT_SECRET=<<YOUR CLIENT SECRET>>
npm start
```

Open a browser and navigate to http://localhost:3000.

Click on the `Authorize me` link and then click through the links on the browser to:
  - Create a bucket
  - Save a supported file to a bucket
  - Display the file in a web browser

*NOTE:* _It may take several minutes to complete translate the file._

# License
This sample is licensed under the terms of the [MIT License](http://opensource.org/licenses/MIT). Please see the [LICENSE](LICENSE) file for full details.

# devleoper
<a href = "https://sites.google.com/site/bimprinciple/our-company/interests">Taewook Kang (laputa99999@gmail.com)</a>

# Support
laputa99999@gmail.com
forge.help@autodesk.com
