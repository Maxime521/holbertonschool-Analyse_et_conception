DROP TABLE IF EXISTS ligne_commande CASCADE;
DROP TABLE IF EXISTS commande CASCADE;
DROP TABLE IF EXISTS produit CASCADE;
DROP TABLE IF EXISTS client CASCADE;

CREATE TABLE client (
    id_client UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    date_creation TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produit (
    id_produit UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code_prod VARCHAR(50) UNIQUE,
    designation VARCHAR(255) NOT NULL,
    prix_unitaire_ht DECIMAL(10,2) NOT NULL CHECK (prix_unitaire_ht >= 0)
);

CREATE TABLE commande (
    id_commande UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date_commande TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    statut VARCHAR(50) NOT NULL DEFAULT 'EN_ATTENTE',
    id_client UUID NOT NULL,
    CONSTRAINT fk_commande_client 
        FOREIGN KEY (id_client) 
        REFERENCES client(id_client) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE TABLE ligne_commande (
    id_commande UUID NOT NULL,
    id_produit UUID NOT NULL,
    quantite INT NOT NULL CONSTRAINT chk_quantite_positive CHECK (quantite > 0),
    prix_unitaire_facture DECIMAL(10,2) NOT NULL CHECK (prix_unitaire_facture >= 0),
    
    PRIMARY KEY (id_commande, id_produit),
    
    CONSTRAINT fk_ligne_commande
        FOREIGN KEY (id_commande) 
        REFERENCES commande(id_commande) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_ligne_produit 
        FOREIGN KEY (id_produit) 
        REFERENCES produit(id_produit) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);