const mongoose = require('mongoose');

var Schema = mongoose.Schema, ObjectId = Schema.ObjectId;

const SensorSchema = new Schema({
    // _id			: ObjectId, // a product references a category _id with type ObjectId
    sensor 	: String,
    area 	: String,
    date 	: String,
    value	: Number,
    // _msgid	: String
});
const sensor = mongoose.model('record', SensorSchema);
const temp1 = new sensor({ sensor: 'temp', area: 'Home', date: '2021-1-26', value: '31.0' });
const temp2 = new sensor({ sensor: 'temp', area: 'Home', date: '2021-1-26', value: '31.2' });
temp1.save(function (err, temp1) { });
temp2.save(function (err, temp2) { });

module.exports = sensor;
