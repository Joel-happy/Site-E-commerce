const express = require('express');
const app = express();
const userRoutes = require('./routes/UserRoutes');

// Middleware pour utiliser les routes des utilisateurs
app.use('/api', userRoutes);

// Autres configurations du serveur

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Serveur en cours d'exécution sur le port ${PORT}`);
});
