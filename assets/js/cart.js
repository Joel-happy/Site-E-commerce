// Exemple de données de produit
const products = [
    { name: "Produit 1", price: 10, quantity: 1 },
    { name: "Produit 2", price: 20, quantity: 2 },
    // Ajoutez d'autres produits ici...
];

// Fonction pour afficher les produits dans le panier
function displayProducts() {
    const itemsContainer = document.querySelector('.items');
    let totalPrice = 0;

    itemsContainer.innerHTML = ''; // Efface le contenu précédent

    products.forEach(product => {
        const item = document.createElement('div');
        item.classList.add('item');
        item.innerHTML = `
            <span>${product.name}</span>
            <span>${product.quantity} x ${product.price} €</span>
        `;
        itemsContainer.appendChild(item);

        totalPrice += product.price * product.quantity;
    });

    // Met à jour le total du panier
    document.getElementById('subtotal').textContent = totalPrice.toFixed(2);
    document.getElementById('total').textContent = (totalPrice + 5).toFixed(2); // Ajoute les frais de livraison
}

// Appel initial pour afficher les produits
displayProducts();

// Écouteur d'événement pour le bouton de paiement
document.getElementById('checkout-btn').addEventListener('click', () => {
    // Redirige vers la page de paiement
    window.location.href = 'checkout.html';
});
