# Révision du diagramme d'architecture

<div style="display: flex; flex-wrap: wrap; gap: 24px; align-items: flex-start;">

  <div style="flex: 1;">

  ![Architecture Diagram](architecture_diagram.pdf "Architecture Diagram")

  </div>

  <div style="flex: 1;">

  * Front-end ⟷ Back-end : volume partagé, pas de "communication" directe nécessaire

  - Back-end :
	- Contient les programmes d'importation et d'extraction des données d'API
	- Tourne un serveur FastAPI qui peut servir les requêtes HTTP de l'Administrateur et du Scheduler

  * Scheduler :
	- Tourne crontab en continu
	- Crontab peut rafraîchir les données via une requête HTTP vers le Back-end

  </div>

  <div style="flex-basis: 100%; margin-top: 16px;">

  - Administrateur → Back-end :
    - Administrateur peut rafraîchir les données manuellement via une requête HTTP
    - Administrateur peut consulter les données d'API via une requête HTTP
    - Administrateur peut supprimer des données d'API via une requête HTTP

  * Administrateur → Scheduler :
    - Administrateur peut consulter l'horaire du scheduler via une requête HTTP
    - Administrateur peut changer l'horaire du scheduler via une requête HTTP

  </div>

</div>