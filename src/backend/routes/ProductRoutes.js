const express = require('express');
const router = express.Router();
const ProductController = require('../controllers/ProductController');

// Routes pour les utilisateurs
router.post('/products', ProductController.createProduct);
router.get('/products/:id', ProductController.getProductByName);
router.get('/products', ProductController.getProduct);
router.put('/products/:id', ProductController.updateProduct);
router.delete('/products/:id', ProductController.deleteProduct);

module.exports = router;
