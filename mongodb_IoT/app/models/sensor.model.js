const mongoose = require('mongoose');

var Schema = mongoose.Schema, ObjectId = Schema.ObjectId;

const RecordSchema = new Schema({
    _id		: ObjectId, 
    sensor 	: String,
    area 	: String,
    date 	: String,
    value	: Number
    // _msgid	: String
});

const record = mongoose.model('record', RecordSchema);
module.exports = record;

// Test code
// const temp1 = new record({ sensor: 'temp', area: 'Home', date: '2021-1-26', value: '31.0' });
// const temp2 = new record({ sensor: 'temp', area: 'Home', date: '2021-1-26', value: '31.2' });
// temp1.save(function (err, temp1) { });
// temp2.save(function (err, temp2) { });