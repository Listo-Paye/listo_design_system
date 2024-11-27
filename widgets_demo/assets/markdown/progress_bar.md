# Utiliser la ProgressBar

La progress bar est un widget permettant de montrer à nos utilisateurs, la progression d'une certaine tâche.

## Utilisation

Pour utiliser une barre de chargement, il faut utiliser le widget `ProgressBar` :

```dart
import 'package:listo_design_system/atoms/progress_bar.dart';

var progressBar = ListoProgressBar(
    progress: 0.3,
    backgroundColor: SepteoColors.grey.shade100,
    progressColor: ListoMainColors.primary.shade400,
    errorColor: SepteoColors.red.shade300,
    error: false,
);
```

Les valeurs par défaut sont les suivantes :
* **backgroundColor**: `SepteoColors.grey.shade100`
* **progressColor**: `ListoMainColors.primary.shade400`
* **errorColor**: `SepteoColors.red.shade300`
* **error**: `false`