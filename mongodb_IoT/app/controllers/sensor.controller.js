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

// Retrieve and return all records from the database.
exports.findAll = (req, res) => {
    Record.find()
    .then(records => {
        res.send(records);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Some error occurred while retrieving Record."
        });
    });
};

// Find a record with a _id
exports.findOne = (req, res) => {
    Record.findById(req.params._id)
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
    // Validate Request
    if(!req.body.sensor) {
        return res.status(400).send({
            message: "Record content can not be empty"
        });
    }

    // Find record and update it with the request body
    Record.findByIdAndUpdate(req.params._id, {
        title: req.body.sensor,
        area: req.body.area,
        date: req.body.date, 
        value: req.body.value
    }, {new: true})
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
            message: "Error updating Record with id " + req.params._id
        });
    });
};

// Delete a record with the specified _id in the request
exports.delete = (req, res) => {
    Record.findByIdAndRemove(req.params._id)
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