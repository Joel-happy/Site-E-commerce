const express = require('express');
const router = express.Router();
const CommandController = require('../controllers/CommandController');

//Parser le corps des requêtes
router.use(express.json());
// Routes pour les utilisateurs
router.post('/commands', CommandController.createCommand);
router.get('/commands/:command', CommandController.listCommands);
router.put('/commands/:id', CommandController.updateCommand);
router.delete('/commands/:id', CommandController.deleteCommand);


module.exports = router;
