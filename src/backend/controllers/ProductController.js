const {PrismaClient} = require('@prisma/client')

const prisma = new PrismaClient();

// Contrôleurs pour les produits
exports.createProduct = async (req, res) => {
    try {
        // Récupérer les données du produit à partir de la requête
        const {nom, prix, modele, constructeur, description, stock} = req.body;

        // Vérifier si les données requises sont présentes
        if (!nom || !prix || !modele || !constructeur || !stock) {
            return res.status(400).json({error: 'Tous les champs sont requis pour créer un produit.'});
        }

        // Créer le produit dans la base de données avec Prisma
        const newProduct = await prisma.motos.create({
            data: {
                NomMoto: nom,
                Prix: prix,
                Modele: modele,
                Constructeur: constructeur,
                DescriptionDuProduit: description,
                Stock: stock
            }
        });

        // Répondre avec le nouveau produit créé
        res.status(201).json(newProduct);
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la création d'un produit :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la création du produit.'});
    }
};

exports.getProductByName = async (req, res) => {
    try {
        // Récupérer le nom du produit depuis les paramètres de la requête
        const {nom, prix, modele, constructeur, description, stock} = req.params;

        // Rechercher le produit dans la base de données par son nom
        const product = await prisma.motos.findFirst({
            where: {}
        });

        // Vérifier si un produit correspondant a été trouvé
        if (!product) {
            // Aucun produit correspondant trouvé, renvoyer une réponse 404
            return res.status(404).json({error: 'Produit non trouvé.'});
        }

        // Renvoyer le produit trouvé en réponse
        res.status(200).json(product);
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la récupération du produit par nom :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la récupération du produit.'});
    }
};

exports.updateProduct = async (req, res) => {

    try {

        console.log(req.body)
        console.log(typeof (req.params.id), "debuttgt")
        // Récupérer l'ID du produit et les nouvelles données depuis le corps de la requête
        const {id} = req.params;
        const {nom, description, prix, modele, constructeur, stock} = req.body;
        // Mettre à jour le produit dans la base de données en utilisant Prisma
        const updatedProduct = await prisma.motos.update({
            where: {
                IdMoto: parseInt(id)
            },
            data: {
                NomMoto: nom,
                Prix: prix,
                Modele: modele,
                Constructeur: constructeur,
                DescriptionDuProduit: description,
                Stock: stock
            }
        });

        // Renvoyer le produit mis à jour en réponse
        res.status(200).json(updatedProduct);
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la mise à jour du produit :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la mise à jour du produit.'});
    }
};

exports.deleteProduct = async (req, res) => {
    try {
        // Récupérer l'ID du produit depuis les paramètres de la requête
        const {id} = req.params;

        // Supprimer le produit de la base de données en utilisant Prisma
        await prisma.motos.delete({
            where: {
                IdMoto: parseInt(id)
            }
        });

        // Renvoyer une réponse de succès
        res.status(200).send({message: "Suppression réussie"});
    } catch (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la suppression du produit :", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la suppression du produit.'});
    }
};

exports.getProduct = async (req, res) => {
    try {
        const {name} = req.query;
        let product
        if (name) {
            console.log("1")
          product= await prisma.motos.findMany({
                    where: {
                        NomMoto: name
                    }
                }
            )
        }else {
             product = await prisma.motos.findMany()
            console.log("2")

        }
        // Vérifier si un produit correspondant a été trouvé
        if (!product) {
            // Aucun produit correspondant trouvé, renvoyer une réponse 404
            return res.status(404).json({error: 'Produit non trouvé.'});
        }

        // Renvoyer le produit trouvé en réponse
        res.status(200).json(product);
    } catch
        (error) {
        // Gérer les erreurs
        console.error("Erreur lors de la récupération des produits:", error);
        res.status(500).json({error: 'Erreur interne du serveur lors de la récupération du produit.'});
    }

}