const Sensor = require('../models/sensor.model.js');

// Create and Save a new Sensor
exports.create = (req, res) => {
    // Validate request
    if(!req.body.content) {
        return res.status(400).send({
            message: "Sensor content can not be empty"
        });
    }

    // Create a Sensor
    const note = new Sensor({
        sensor: req.body.sensor || "Untitled Sensor", 
        area: req.body.area,
        date: req.body.date, 
        value: req.body.value
    });

    // Save Sensor in the database
    note.save()
    .then(data => {
        res.send(data);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Some error occurred while creating the Sensor."
        });
    });
};

// Retrieve and return all notes from the database.
exports.findAll = (req, res) => {
    Sensor.find()
    .then(notes => {
        res.send(notes);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Some error occurred while retrieving notes."
        });
    });
};

// Find a single note with a noteId
exports.findOne = (req, res) => {
    Sensor.findById(req.params.noteId)
    .then(note => {
        if(!note) {
            return res.status(404).send({
                message: "Sensor not found with id " + req.params.noteId
            });            
        }
        res.send(note);
    }).catch(err => {
        if(err.kind === 'ObjectId') {
            return res.status(404).send({
                message: "Sensor not found with id " + req.params.noteId
            });                
        }
        return res.status(500).send({
            message: "Error retrieving note with id " + req.params.noteId
        });
    });
};

// Update a note identified by the noteId in the request
exports.update = (req, res) => {
    // Validate Request
    if(!req.body.sensor) {
        return res.status(400).send({
            message: "Sensor content can not be empty"
        });
    }

    // Find note and update it with the request body
    Sensor.findByIdAndUpdate(req.params.noteId, {
        title: req.body.sensor || "Untitled Sensor",
        area: req.body.area,
        date: req.body.date, 
        value: req.body.value
    }, {new: true})
    .then(note => {
        if(!note) {
            return res.status(404).send({
                message: "Sensor not found with id " + req.params.noteId
            });
        }
        res.send(note);
    }).catch(err => {
        if(err.kind === 'ObjectId') {
            return res.status(404).send({
                message: "Sensor not found with id " + req.params.sensorId
            });                
        }
        return res.status(500).send({
            message: "Error updating note with id " + req.params.sensorId
        });
    });
};

// Delete a note with the specified sensorId in the request
exports.delete = (req, res) => {
    Sensor.findByIdAndRemove(req.params.sensorId)
    .then(record => {
        if(!record) {
            return res.status(404).send({
                message: "Sensor not found with id " + req.params.sensorId
            });
        }
        res.send({message: "Sensor deleted successfully!"});
    }).catch(err => {
        if(err.kind === 'ObjectId' || err.name === 'NotFound') {
            return res.status(404).send({
                message: "Sensor not found with id " + req.params.sensorId
            });                
        }
        return res.status(500).send({
            message: "Could not delete note with id " + req.params.sensorId
        });
    });
};