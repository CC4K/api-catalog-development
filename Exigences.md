# API Catalog repository de développement

## Liste des tickets

### Exigences Fonctionnelles

#### Must have :

- [x] La page de catalogue doit pouvoir afficher toutes les APIs actuellement mises à disposition des utilisateurs dans l’ordre alphabétique.
- [x] Le tri par défaut doit se faire par ordre alphabétique sur le nom des APIs.
- [x] Pour chaque API, la page de catalogue doit afficher son nom, sa version, sa révision, sa date de sa dernière mise à jour ainsi que son icône (ou un texte de remplacement si indisponible).
- [x] L’utilisateur doit pouvoir accéder à la page de documentation d’une API en cliquant sur son nom dans le catalogue.
- [x] La page de documentation doit afficher toutes les informations disponibles sur l’API telles qu’elles sont définies dans l’API Manager.
- [ ] La page de documentation doit offrir la possibilité à l’utilisateur de voir les documents et URLs supplémentaires à la documentation de l’API.
- [x] Les "server URLs" présents dans la documentation de l’API doivent apparaître dans leur version correcte.
- [x] L’utilisateur doit pouvoir télécharger le fichier de description d’une API depuis la page de documentation de l’API, au format standard d’OpenAPI 1 et avec les "server URLs" corrigés.
- [x] Les administrateurs doivent pouvoir consulter et supprimer les données des APIs stockées dans le répertoire de stockage des données ainsi que pouvoir exclure des APIs.
- [ ] Les administrateurs doivent pouvoir configurer les paramètres de l’application.
- [ ] Le données concernant les APIs doivent se mettrent à jour automatiquement à intervalle régulier.
- [ ] Les administrateurs doivent pouvoir forcer la mise à jour des données de toutes les APIs à tout moment.
- [ ] Les administrateurs doivent pouvoir consulter les logs montrant les erreurs du programme, les connections des administrateurs ainsi que les modifications qu’ils ont effectués.
- [ ] Les logs doivent être descriptifs et pouvoir montrer aux administrateurs l’origine de chaque message présent dans les logs (back-end, front-end, scheduler).

#### Should have :
- [ ] Le catalogue doit être muni d’une barre de recherche permettant d’explorer les APIs par nom.
- [ ] Le catalogue doit être muni d’une liste de tags permettant de filtrer les APIs.
- [x] Le catalogue doit offrir la possibilité à l’utilisateur de trier les APIs par leur nom et leur date de dernière mise à jour.

#### Could have :
- [ ] L’utilisateur doit pouvoir faire une demande d’accès à une API depuis la page de catalogue et/ou depuis la page de documentation de l’API.
- [ ] Les administrateurs doivent pouvoir faire remonter les statistiques d’utilisation de l’application via Matomo.


### Exigences Techniques
- [ ] Les différentes parties de l’application doivent être isolées dans des conteneurs docker :
    - le back-end de l’application qui contient l’extracteur, l’importeur et le répertoire de stockage des données.
    - le front-end de l’application qui contient l’interface utilisateur.
    - le scheduler de l’application qui s’occupe de régénérer automatiquement le catalogue des APIs à intervalle régulier.

- [ ] L’application doit être capable de se mettre à jour automatiquement à intervalle régulier sans aucune intervention.
- [x] L’application doit stocker les fichiers de description et de documentation des APIs sous format YAML.
- [x] L’application doit stocker les variables d’environnement sous format texte.
- [ ] L’application doit suivre la licence open source MIT.
- [ ] L’application doit utiliser des technologies connues au SGSI.
    - L’application doit utiliser le framework ~~Django~~ Flask pour l’interface web.
    - L’application doit utiliser le langage Python pour la logique en back-end.
    - L’application doit utiliser le scheduler cron pour la planification automatique.
- [ ] L’application ne doit pas dépendre d’un service externe au SGSI.
- [x] La page de catalogue de l’application doit suivre la même interface qu’API Manager


### Exigences Non-Fonctionnelles
- [ ] L’application doit être très bien documentée tant au niveau de son architecture et organisation qu’au niveau du code et de son utilisation.
- [ ] L’application doit respecter la charte graphique de l’UCLouvain.
