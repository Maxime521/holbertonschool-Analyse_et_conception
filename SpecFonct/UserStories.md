# Spécifications Fonctionnelles - User Stories

## Contexte
Ce document regroupe les User Stories (US) et leurs critères d'acceptation décrivant les règles métiers de la gestion des transactions et de l'évaluation des risques.

---

## US 01 : Évaluation du risque de transaction

**En tant que** responsable de la conformité financière  
**Je veux** que chaque transaction soit automatiquement évaluée selon son montant et son pays de destination  
**Afin de** prévenir le blanchiment d'argent et de respecter les réglementations internationales.

### Critères d'Acceptation
- **Montant élevé :** Toute transaction dont le montant dépasse **10 000 €** doit faire l'objet d'un contrôle renforcé de risque.
- **Vérification du pays :** Le pays de livraison ou de destination est systématiquement évalué selon le registre officiel des embargos.
- **Refus de transaction :** Si le niveau de risque est jugé inacceptable (ex. pays sous embargo), le client est notifié du refus de transaction.
- **Historisation :** L'évaluation du risque de la transaction est conservée pour des besoins d'audit.

---

## US 02 : Traitement prioritaire des clients VIP

**En tant que** gestionnaire de compte client  
**Je veux** que les clients bénéficiant du statut VIP disposent de règles de validation assouplies  
**Afin d'**offrir un parcours d'achat fluide et privilégié aux clients stratégiques.

### Critères d'Acceptation
- **Passe-droit VIP :** Les transactions des clients à statut VIP ne sont pas bloquées par les règles standard de limitation de montant.
- **Maintien des obligations légales :** Les vérifications liées au registre des embargos restent applicables, même pour les clients VIP.
- **Notification personnalisée :** En cas de blocage d'une transaction VIP pour motif réglementaire, une notification spécifique est adressée au gestionnaire de compte.
