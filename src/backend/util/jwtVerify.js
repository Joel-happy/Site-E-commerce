const jwt = require('jsonwebtoken');

// Fonction pour vérifier les tokens JWT
exports.verify = (req, res, next) => {
    try {
        // Récupérer le token JWT depuis les en-têtes de la requête
        const token = req.headers.authorization.split(' ')[1];

        // Vérifier si le token existe
        if (!token) {
            return res.status(401).json({error: "Token non fourni. Accès non autorisé."});
        }

        // Vérifier et décoder le token JWT
        const decodedToken = jwt.verify(token, process.env.JWT_SECRET);

        // Ajouter l'ID de l'utilisateur décodé à la requête pour une utilisation ultérieure
        req.user = {id: decodedToken.userId};

        // Passer au middleware suivant
        next();
    } catch (error) {
        // Gérer les erreurs liées à la vérification du token
        console.error("Erreur lors de la vérification du token:", error);
        return res.status(401).json({error: "Token invalide. Accès non autorisé."});
    }
};
