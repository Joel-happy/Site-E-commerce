const {PrismaClient} = require('@prisma/client');
const {data} = require("autoprefixer");

const prisma = new PrismaClient();

exports.createCommand = async (req, res) => {
    try {
        console.log("Je reçois les données de la commande :", req.body);

        // Récupérer les données de la commande à partir de la requête
        const {IdClient, motos} = req.body;

        // Vérifier si les données requises sont présentes
        if (!IdClient || !motos || motos.length === 0 || motos.some(moto => !moto.IdMoto)) {
            return res.status(400).json({error: 'Les données de la commande sont incomplètes.'});
        }

        // Déterminer le statut de la commande en fonction de la taille de la liste de motos

        // Récupérer la date de la commande

        // Créer la commande dans la base de données avec Prisma
        const newCommand = await prisma.commande.create({
            data: {
                DatedeCommande:  new Date(),
                StatusDeLaCommande: "livré",
                //IdAdresse: /* Ajouter l'IdAdresse correspondant */,
                IdClient,
                motos: {
                    connect: motos.map(moto => ({IdMoto: moto.IdMoto}))
                }
            }
        });
console.log(data)
        // Répondre avec la nouvelle commande créée
        res.status(201).json(newCommand);
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la création de la commande :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la création de la commande.'});
    }
};

exports.updateCommand = async (req, res) => {
    try {
        // Récupérer l'ID de la commande et les nouvelles données depuis le corps de la requête
        const {id} = req.params;
        const {userId, products} = req.body;

        // Mettre à jour la commande dans la base de données avec Prisma
        const updatedCommand = await prisma.commande.update({
            where: {
                IdCommande: parseInt(id)
            },
            data: {
                UserId: userId,
                produits: {create: products}
            }
        });

        // Répondre avec la commande mise à jour
        res.status(200).json(updatedCommand);
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la mise à jour de la commande :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la mise à jour de la commande.'});
    }
};

exports.deleteCommand = async (req, res) => {
    try {
        // Récupérer l'ID de la commande depuis les paramètres de la requête
        const {id} = req.params;

        // Supprimer la commande de la base de données avec Prisma
        await prisma.commande.delete({
            where: {
                IdCommande: parseInt(id)
            }
        });

        // Répondre avec succès
        res.status(204).send();
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la suppression de la commande :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la suppression de la commande.'});
    }
};

exports.listCommands = async (req, res) => {
    try {
        // Récupérer toutes les commandes depuis la base de données avec Prisma
        const commands = await prisma.commande.findMany();

        // Répondre avec les commandes trouvées
        res.status(200).json(commands);
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la récupération des commandes :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la récupération des commandes.'});
    }
}
