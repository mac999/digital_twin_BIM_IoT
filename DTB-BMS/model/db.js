const mongoose = require('mongoose'); 

var Schema = mongoose.Schema, ObjectId = Schema.ObjectId;

function callbackRecrod(err, data) {
	console.log(data);
}

class IoTDatabase {	
    async connect() {
		var url = "mongodb://localhost:27017/sensor";  // user:pwd@localhost:

		try {
			await mongoose.connect(url);
			console.log("Connected to Database");
		} catch(err) {
			console.log(err);
		}
    }

    async dumpSensorData() {
		try {
			const RecordSchema = new Schema({
			    _id		: ObjectId, 
			    sensor 	: String,
			    area 	: String,
			    date 	: String,
			    value	: Number
			    // _msgid	: String
			});
			const record = mongoose.model('record', RecordSchema);
			/* const r = new record({ sensor: 'temp', area: 'Skinner', date: '2021-1-26', value: '29.0' });
			r.save(function (err, r) { }); */

			console.log("Dump IoT dataset");
			await record.find({sensor: /^temp/}, callbackRecrod).limit(3);
		} catch(err) {
			console.log(err);
		}
    }    
}

module.exports = {
	db: new IoTDatabase()
};
