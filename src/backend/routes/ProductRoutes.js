const express = require('express');
const router = express.Router();
const UserController = require('../controllers/ProductControllers');

// Routes pour les utilisateurs
router.post('/products', UserController.createProduct);

router.get('/products/:id', UserController.getProductById);
router.put('/products/:id', UserController.updateProduct);
router.delete('/products/:id', UserController.deleteProduct);

module.exports = router;
