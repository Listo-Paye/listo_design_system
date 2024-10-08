## Upload de fichiers

## Utilisation

```dart
UploadButton(
    onUpload: (files) {
      print("upload");
    },
    allowedExtensions: const [".xml", ".gif"],
    config: const UploadConfig(
      modalTitle: "Import fiche(s) Organisme Complémentaire",
      openModalButtonText: "Importer",
      primaryButtonText: "Importer",
      secondaryButtonText: "Annuler",
      uploadMainText: "Ajouter une/plusieurs fiche(s)",
      uploadSecondaryText:
          "ou glisser/déposer ici (format .xml uniquement)",
    ),
  );
```

Pour utiliser la modale d'upload, il faut définir un callback `onUpload` qui prend en paramètre un `List<CustomFile>`.

```dart
class CustomFile {
  final String name;
  final Uint8List bytes;
  final int size;

  CustomFile({
    required this.name,
    required this.bytes,
    required this.size,
  });
}
```

Il faut aussi définir une liste d'extensions autorisées pour les fichiers à importer. Si cette liste est vide ou null, tous les fichiers sont autorisés.
Et enfin, il faut définir les textes affichés dans le modale.

```dart
final UploadConfig config = const UploadConfig(
  modalTitle: "Import fiche(s) Organisme Complémentaire",
  openModalButtonText: "Importer",
  primaryButtonText: "Importer",
  secondaryButtonText: "Annuler",
  uploadMainText: "Ajouter une/plusieurs fiche(s)",
  uploadSecondaryText: "ou glisser/déposer ici (format .xml uniquement)",
);
```

## Fonctionnement

La modale d'upload permet la sélection de fichiers à importer via le file picker de l'appareil ou par glisser/déposer.
La liste des fichiers sélectionnées s'affiche alors dans la modale et l'utilisateur peut choisir de les supprimer. Si un fichier n'a pas le bon format, un indicateur d'erreur apparaît.
On peut alors soit annuler et fermer la modale, soit valider et les fichiers sélectionnés sont alors envoyés via la callback `onUpload`.