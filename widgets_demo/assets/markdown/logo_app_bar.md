### LogoAppBar

Le LogoAppBar est un widget qui permet d'afficher un app bar avec un logo, un titre et uin ensemble d'actions.

Voici un exmeple d'utilisation du LogoAppBar :

```dart
class PresenterScaffold extends StatelessWidget {
  const PresenterScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(
        actions: [
          SelectionButton(
            title: "Ma cabane en bois",
            subtitle: "Rennes - 00063 Koala kids",
            onPressed: {} (),
          ),
        ],
        title: Text('Listo Paye'),
        logo: AssetImage('assets/images/logo.png'),
      ),
      body: Container(
        color: SepteoColors.blue.shade50,
      ),
    );
  }
}
```
Les paramètres de LogoAppBar sont les suivants :
- **title** : le titre de l'app bar
- **height** : la hauteur de l'app bar
- **elevation** : l'élévation de l'app bar
- **logo** : le logo de l'app bar
- **actions** : les actions à afficher à gauche de l'app bar
- **endActions** : les actions à afficher à droite de l'app bar

La hauteur par défaut est de 56 et les title, subtitle et actions sont constitués de Widget.

### SelectionButton

Le SelectionButton est un widget qui permet d'afficher un bouton lié à un état d'objet.
Dans l'exemple plus haut, le SelectionButton est utilisé pour afficher le nom et le lieu de l'établissement en cours.

Les paramètres de SelectionButton sont les suivants :
- **title** : le titre du bouton
- **subtitle** : le sous-titre du bouton
- **onPressed** : la fonction à exécuter lors du clic sur le bouton

> **Note** : La valeur du onPress a une incidence sur l'apparence du bouton. Si la valeur est nulle, le bouton sera désactivé. Si la valeur est non nulle, un icone apparaitra à gauche.
