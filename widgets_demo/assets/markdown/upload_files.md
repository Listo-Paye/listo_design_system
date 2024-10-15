## Modale d'upload

Cette modale permet aux utilisateurs de sélectionner des fichiers avec le selecteur de fichiers natif ou en glisser/déposer.

## Composants principaux

1. **UploadButton**: Un bouton qui déclenche l'ouverture de la modale d'upload.
2. **UploadDialog**: La modale principale qui gère l'interface utilisateur pour le téléversement de fichiers.
3. **ListItemDownload**: Un widget qui représente chaque fichier dans la liste des fichiers sélectionnés.
4. **UploadDialogController**: Un contrôleur qui gère l'état et les actions de la modale d'upload.

## Utilisation

### Configuration

Pour utiliser la modale d'upload, vous devez d'abord configurer les paramètres suivants :

```dart
UploadConfig config = UploadConfig(
  openModalButtonText: "Ouvrir la modale",
  modalTitle: "Téléverser des fichiers",
  uploadAreaMainText: "Sélectionner des fichiers",
  uploadAreaSecondaryText: "ou glisser-déposer ici",
  secondaryButtonText: "Annuler",
  primaryButtonText: "Téléverser",
);
// Le controller permet de gerer les évenements d'upload (progress, error et complete)
UploadDialogController controller = UploadDialogController(showProgress: true);

// La liste peut être null ou vide pour autoriser toutes les extensions
List<String> allowedExtensions = ['.pdf', '.doc', '.docx'];
```

### Affichage de la modale

Pour afficher la modale, utilisez le widget `UploadButton` :

```dart
UploadButton(
  config: config,
  controller: controller,
  allowedExtensions: allowedExtensions,
  onUpload: (List<CustomFile> files) {
    // Gérer le téléversement des fichiers
  },
  onClose: () {
    // Actions à effectuer lors de la fermeture de la modale
  },
)
```

## Fonctionnement

1. **Sélection des fichiers** : Les utilisateurs peuvent sélectionner des fichiers en cliquant sur le bouton ou en les glissant-déposant dans la zone désignée.

2. **Validation des fichiers** : Les fichiers sont validés en fonction des extensions autorisées (si spécifiées).

3. **Affichage des fichiers** : Les fichiers sélectionnés sont affichés dans une liste, montrant leur nom et leur statut.

4. **Gestion des erreurs** : Les fichiers non valides sont marqués avec un statut d'erreur et un message explicatif.

5. **Téléversement** : Lorsque l'utilisateur clique sur le bouton de téléversement, la fonction `onUpload` est appelée avec la liste des fichiers valides.

6. **Suivi de la progression** : Si `showProgress` est activé dans le contrôleur, la progression du téléversement est affichée pour chaque fichier.

## Gestion des états

La modale gère plusieurs états pour chaque fichier :

- **Loaded** : Fichier chargé et prêt à être téléversé
- **Error** : Erreur lors de la validation ou du téléversement
- **Uploading** : Téléversement en cours
- **UploadComplete** : Téléversement terminé avec succès

## Personnalisation

La modale peut être personnalisée en modifiant les paramètres de `UploadConfig`.

## Gestion des événements

Le `UploadDialogController` permet de gérer les événements de téléversement :

```dart
controller.onProgress = (String fileName, double progress) {
  // Mise à jour de la progression
};

controller.onComplete = (String fileName) {
  // Action à effectuer lorsqu'un fichier est complètement téléversé
};

controller.onError = (String fileName, String message) {
  // Gestion des erreurs de téléversement
};
```
