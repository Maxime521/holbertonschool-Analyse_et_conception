# Régles de gestion et Cardinalités

## Entités identifiées
- **Client** : Représenté par son nom ('client_nom'), son contact ('client_contact') et son adresse de livraison ('adr_livraison').
- **Commande** : Représentée par son identifiant ('id_cmd'), sa date d'achat ('date_achat') et son statut ('statut_cmd').
- **Produit** : Représenté par son code ('code_prod'), sa désignation ('designation') et son prix unitaire HT ('prix_unitaire_ht').

## Règles de gestion
1. **Un client et ses commandes :**
- Un client peut passez une ou plusieurs commandes (0,n ou 1,n).
- Une commande est passée par un et un seul client (1,1).

2. **Une commande et ses produits :**
- Une commande contient un ou plusieurs produits (1,n).
- Un produit peut figurer sur zéro, une ou plusieurs commandes (0,n).

3. **Ligne de commande :**
- L'association entre une commande et un produit contient la quantité commandée ('qte').
- Le montant 'total_ligne' est une donnée calculée ('prix_unitaire_ht * qte') et n'est pas stocké sous forme d'attribut direct dans le modèle conceptuel.

## Summary des Cardinalités
- 'Client' (1,N) <--- Passe ---> (1,1) 'Commande'
- 'Commande' (1,N) <--- Contient ---> (0,N)'Produit' (avec propriété 'quantite')
