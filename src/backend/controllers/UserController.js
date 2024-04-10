// const User = require('../models/classes');
const {PrismaClient} = require('@prisma/client')
const bcrypt = require('bcrypt');
const saltRounds = 10;
const jwt = require('jsonwebtoken');
// Création d'une instance PrismaClient
const prisma = new PrismaClient();


// Contrôleurs pour les utilisateurs
exports.createUser = async (req, res) => {
    try {

        // Logique pour créer un nouvel utilisateur
        const {nom, prenom, email, motDePasse, dateDeNaissance, numeroDeTelephone} = req.body;
        if (!nom || !prenom || !email || !motDePasse || !dateDeNaissance || !numeroDeTelephone) {
            let champsManquants = [];
            if (!nom) champsManquants.push('Nom');
            if (!prenom) champsManquants.push('Prenom');
            if (!email) champsManquants.push('AddresseMail');
            if (!motDePasse) champsManquants.push('MotDePasse');
            if (!dateDeNaissance) champsManquants.push('DateDeNaissance');
            if (!numeroDeTelephone) champsManquants.push('NumeroDeTelephone');

            return res.status(400).json({ error: `Les champs suivants sont obligatoires : ${champsManquants.join(', ')}` });
        }
        // Vérifier si l'email existe déjà

         const existingUser = await prisma.client.findUnique({
            where: {
                AddresseMail: email
            }
        });

        // Si un utilisateur avec cet email existe déjà, renvoyer une erreur
        if (existingUser) {
            return res.status(400).json({ error: "Cet email est déjà utilisé. Veuillez en choisir un autre." });
        }
        // Hachage du mot de passe
        const hashedPassword = await bcrypt.hash(motDePasse, saltRounds);

        //recup de la date à jour pour l'ancienneté
        const date = new Date();
        const anciennete=`${date.getDate().toString().padStart(2, '0')}/${(date.getMonth() + 1).toString().padStart(2, '0')}/${date.getFullYear()}`;

// Création de l'utilisateur dans la base de données avec Prisma
        const newUser = await prisma.client.create({
            data: {
                Nom: nom,
                Prenom: prenom,
                AddresseMail: email,
                MotDePasse: hashedPassword,
                DateDeNaissance: dateDeNaissance,
                NumeroDeTelephone: numeroDeTelephone,
                Anciennete: anciennete
            }

        });
        // Réponse de succès avec le nouvel utilisateur créé

        res.status(201).json("Nouvel utilisateur créé");

    } catch
        (error) {
        // Gestion des erreurs
        console.error("Erreur lors de la creation d'un nouvel utilisateur:", error);
        res.status(500).json({error: 'Internal Server Error'});
    }
}
;

exports.getUserByName = async (req, res) => {
    try {
        // Logique pour récupérer un utilisateur par son nom
        const { userName } = req.params;

        const users = await prisma.client.findMany({
            where: {
                Nom: userName
            }
        });

        if (!users || users.length === 0) {
            return res.status(404).json({ error: 'Utilisateur non trouvé' });
        }

        res.status(200).json(users);
    } catch (error) {
        // Gestion des erreurs
        console.error("Erreur lors de la recherche de l'utilisateur:", error);
        res.status(500).json({ error: 'Erreur interne du serveur' });
    }
};

exports.getUser = async (req, res) => {
    try {
        // Logique pour récupérer un utilisateur par son ID
    } catch (error) {
        // Gestion des erreurs
    }
};

exports.updateUser = async (req, res) => {
    try {
        // Logique pour mettre à jour un utilisateur
        const { userId } = req.params;
        const { nom, prenom, email, motDePasse, dateDeNaissance, numeroDeTelephone } = req.body;

        // Mise à jour des informations de l'utilisateur dans la base de données avec Prisma
        const updatedUser = await prisma.client.update({
            where: {
                IdClient: parseInt(userId)
            },
            data: {
                Nom: nom,
                Prenom: prenom,
                AddresseMail: email,
                MotDePasse: motDePasse,
                DateDeNaissance: dateDeNaissance,
                NumeroDeTelephone: numeroDeTelephone
            }
        });

        res.status(200).json(updatedUser);
    } catch (error) {
        // Gestion des erreurs
         res.status(500).json({ error: 'Erreur interne du serveur' });
    }
};

exports.deleteUser = async (req, res) => {
    try {
        // Logique pour supprimer un utilisateur
                const userId = req.user.id; // Supposons que l'ID de l'utilisateur authentifié est stocké dans req.user

        await prisma.client.delete({
            where: {
                IdClient: parseInt(userId)
            }
        });

        res.status(204).send();
    } catch (error) {
        // Gestion des erreurs
        console.error("Erreur lors de la suppression du compte utilisateur:", error);
        res.status(500).json({ error: 'Erreur interne du serveur' });
    }
};

exports.logUser = async (req, res) => {
   try {
        // Extraire les informations d'identification de la requête
        const { email, motDePasse } = req.body;

        // Vérifier si l'utilisateur existe dans la base de données
        const user = await prisma.client.findUnique({
            where: {
                AddresseMail: email
            }
        });

        // Si l'utilisateur n'existe pas, renvoyer une erreur
        if (!user) {
            return res.status(404).json({ error: "L'utilisateur avec cet email n'existe pas." });
        }

        // Vérifier si le mot de passe est correct en le comparant avec le hash stocké
        const passwordMatch = await bcrypt.compare(motDePasse, user.MotDePasse
);console.log(passwordMatch)
console.log(motDePasse,user.MotDePasse);
        // Si le mot de passe ne correspond pas, renvoyer une erreur
        if (!passwordMatch) {
            return res.status(401).json({ error: "Mot de passe incorrect." });
        }
        // Générer un token JWT avec l'ID de l'utilisateur
        const token = jwt.sign({ userId: user.IdClient,email:user.AddresseMail }, process.env.JWT_SECRET, { expiresIn: '1h' });

        // Répondre avec le token JWT
        res.status(200).json({ token });
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de l'authentification de l'utilisateur:", error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

