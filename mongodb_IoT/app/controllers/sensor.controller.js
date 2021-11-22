// Title: MongoDB for IoT connection
// Developer: Taewook Kang
// Email: laputa99999@gmail.com
// Created date: 2021/2/26
// 
const Record = require('../models/sensor.model.js');

// Create and Save a new record
exports.create = (req, res) => {
    // Validate request
    if(!req.body.content) {
        return res.status(400).send({
            message: "Sensor content can not be empty"
        });
    }

    // Create a Record
    const record = new Record({
        _id: ObjectId, 
        sensor: req.body.sensor, 
        area: req.body.area,
        date: req.body.date, 
        value: req.body.value
    });

    // Save record in the database
    record.save()
    .then(data => {
        res.send(data);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Some error occurred while creating the Record."
        });
    });
};

function parsingQuery(req) {
    // ex) http://localhost:4000/sensors?limit=5&beginDate=2021 
    //     req.query.date; 
    console.log(req.query);   
    var query = {};
    if(Object.keys(req.query).length > 0)
        if(Object.keys(req.query).length == 1 && typeof req.query.limit != 'undefined')
            ;
        else 
            query['$and']=[];

    if(typeof req.query.beginDate != 'undefined') {
        query['$and'].push({date: {$gte: Date(req.query.beginDate)}});  // {date: {$gt: '2021-2-3-17:32'}}
        console.log('req: ' + req.query.beginDate);
    }
    /* if(typeof req.query.endDate != 'undefined') {
        query['$and'].push({date: {$lte: Date(req.query.endDate)}});  // {date: {$gt: '2021-2-3-17:32'}}
        console.log('req: ' + req.query.endDate);
    } */
    if(typeof req.query.sensor != 'undefined') {
        query['$and'].push({sensor: {$eq: req.query.sensor}});  // {date: {$gt: '2021-2-3-17:32'}}
        console.log('req: ' + req.query.sensor);
    }
    if(typeof req.query.area != 'undefined') {
        query['$and'].push({area: {$eq: req.query.area}});  // {date: {$gt: '2021-2-3-17:32'}}
        console.log('req: ' + req.query.area);
    }
    console.log(query);
    return query;
}

function dumpRecords(records)
{
    console.log(records);
    for(var i = 0; i < records.length; i++) {
        console.log(records[i].area);                    
        console.log(records[i].sensor);
        console.log(records[i].date);
        console.log(records[i].value);
    } 
}

function summaryRecords(records)
{
    var results = [];
    if(records.length < 1)
        return results;

    var summary = {
        _id: 0,
        area: "",
        sensor: "",
        date: "",
        value: 0, // average
        total: 0,
        max: 0, 
        min: 0
    };
    results[0] = summary;
    for(var i = 0; i < records.length; i++) {
        results[0].area = results[0].area + ", " + records[i].area;         
        results[0].sensor = results[0].sensor + ", " + records[i].sensor;
        results[0].total = results[0].total + records[i].value;
        if(results[0].min > records[i].value)
            results[0].min = records[i].value;
        if(results[0].max < records[i].value)
            results[0].max = records[i].value;
    } 
    results[0].value = results[0].total / records.length;

    return results;
}

// Retrieve and return all records from the database.
exports.findAll = (req, res) => {
    var query = parsingQuery(req);

    try {
        if(typeof req.query.limit != 'undefined') {
            Record.find(query).sort({_id:-1}).limit(parseInt(req.query.limit)).then(records => {
                res.send(records);              
            });
        }
        else {
            Record.find(query).sort({_id:-1}).then(records => {
                res.send(records);
            });
        }
    }
    catch(err) {
        res.status(500).send({
            message: err.message || "Some error occurred while retrieving Record."
        });
    }
};

// Retrieve and return all records from the database.
exports.summary = (req, res) => {
    // http://localhost:4000/summary?limit=10&area=OFFICE%201204
    console.log('summary');
    var query = parsingQuery(req);

    try {
        if(typeof req.query.limit != 'undefined') {
            Record.find(query).sort({_id:-1}).limit(parseInt(req.query.limit)).then(records => {
                // res.send(records);
                summary = summaryRecords(records);
                res.send(summary);

                dumpRecords(records);                 
            });
        }
        else {
            Record.find(query).sort({_id:-1}).then(records => {
                res.send(records);
            });
        }
    }
    catch(err) {
        res.status(500).send({
            message: err.message || "Some error occurred while retrieving Record."
        });
    }
};

// Find a record with a _id
exports.findOne = (req, res) => {
    Record.findById(req.params.sensorId)
    .then(record => {
        if(!record) {
            return res.status(404).send({
                message: "Record not found with id " + req.params._id
            });            
        }
        res.send(record);
    }).catch(err => {
        if(err.kind === 'ObjectId') {
            return res.status(404).send({
                message: "Record not found with id " + req.params._id
            });                
        }
        return res.status(500).send({
            message: "Error retrieving Record with id " + req.params._id
        });
    });
};

// Update a record identified by the _id in the request
exports.update = (req, res) => {
    console.log('update ' + req.params.sensorId);

    // Validate Request
    if(!req.body.sensor) {
        return res.status(400).send({
            message: "Record content can not be empty"
        });
    }

    // Find record and update it with the request body
    Record.findByIdAndUpdate(req.params.sensorId, {
        _id: req.body._id,
        sensor: req.body.sensor,
        area: req.body.area,
        date: req.body.date, 
        value: req.body.value,
        _msgid: req.body._msgid
    }, {new: true})
    .then(record => {
        if(!record) {
            return res.status(404).send({
                message: "Record not found with id " + req.params.sensorId
            });
        }
        res.send(record);
    }).catch(err => {
        if(err.kind === 'ObjectId') {
            return res.status(404).send({
                message: "Record not found with id " + req.params.sensorId
            });                
        }
        return res.status(500).send({
            message: "Error updating Record with id " + req.params.sensorId
        });
    });
};

// Delete a record with the specified _id in the request
exports.delete = (req, res) => {
    console.log('delete ' + req.params.sensorId);        
    Record.findByIdAndRemove(req.params.sensorId)
    .then(record => {
        if(!record) {
            return res.status(404).send({
                message: "Record not found with id " + req.params._id
            });
        }
        res.send({message: "Record deleted successfully!"});
    }).catch(err => {
        if(err.kind === 'ObjectId' || err.name === 'NotFound') {
            return res.status(404).send({
                message: "Record not found with id " + req.params._id
            });                
        }
        return res.status(500).send({
            message: "Could not delete Record with id " + req.params._id
        });
    });
};