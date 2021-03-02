// var mongoClient = require("mongodb").MongoClient;
const mongoose = require('mongoose'); // import {mongoose} from 'mongoose';

var Schema = mongoose.Schema, ObjectId = Schema.ObjectId;

/* module.exports = {
    Sensor: sensor
}; */

function callback(err, data) {
	console.log('kitti');
	console.log(data);
}

function callback2(err, data) {
	console.log('sensor');
	console.log(data);
}

class IoTDatabase {
    async connect() {
		var url = "mongodb://localhost:27017/sensor";  // user:pwd@localhost:

		try {
			await mongoose.connect(url);
			console.log("Connected to Database");

			// this.dumpSensorData();
		} catch(err) {
			console.log(err);
		}
    }

    async dumpSensorData() {
		try {
			const kittySchema = new mongoose.Schema({
			  name: String
			});
			const Kitten = mongoose.model('Kitten', kittySchema);
			const silence = new Kitten({ name: 'Silence' });
			const fluffy = new Kitten({ name: 'fluffy' });
			silence.save(function (err, fluffy) { });
			fluffy.save(function (err, fluffy) { });

			await Kitten.find({ name: /^fluff/ }, callback);

			const SensorSchema = new Schema({
			    // _id			: ObjectId, // a product references a category _id with type ObjectId
			    sensor 	: String,
			    area 	: String,
			    date 	: String,
			    value	: Number,
			    // _msgid	: String
			});
			const sensor = mongoose.model('record', SensorSchema);
			const temp1 = new sensor({ sensor: 'temp', area: 'Skinner', date: '2021-1-26', value: '29.0' });
			const temp2 = new sensor({ sensor: 'temp', area: 'Skinner', date: '2021-1-26', value: '29.2' });
			temp1.save(function (err, temp1) { });
			temp2.save(function (err, temp2) { });

			await sensor.find({ sensor: /^temp/ }, callback2);

			console.log("dump data");
		} catch(err) {
			console.log(err);
		}
    }    
}

module.exports = {
	db: new IoTDatabase()
};
