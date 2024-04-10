const express = require('express');
const router = express.Router();
const UserController = require('../controllers/UserController');

//Parser le corps des requêtes
router.use(express.json());
// Routes pour les utilisateurs
router.post('/users', UserController.createUser);
router.post('/login',UserController.logUser);
router.get('/users/:username', UserController.getUserByName);
router.get('/users', UserController.getUserByName);
 router.put('/users/:id', UserController.updateUser);
router.delete('/users/:id', UserController.deleteUser);



module.exports = router;
