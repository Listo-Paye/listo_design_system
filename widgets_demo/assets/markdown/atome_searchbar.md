# Searchbar

Pour utiliser une barre de recherche, il faut utiliser le widget `ListoSearchAnchor` :

```dart
import 'package:listo_design_system/atoms/search_anchor.dart';

ListoSearchAnchor(
    hintText: 'Placeholder',
    onChanged: (String value) {
      print(value);
    },
    onClear: () {
        print('Clear');
    }, 
    onSearch: (String value) {
      print('Search $value');
    },
    enabled: true,
),
```

Vous pouvez utiliser un écran de suggestion avec les propriétés `items` et `showSuggestions` :

```dart
import 'package:listo_design_system/atoms/search_anchor.dart';

ListoSearchAnchor(
    hintText: 'Placeholder',
    onChanged: (String value) {
      print(value);
    },
    onClear: () {
        print('Clear');
    }, 
    onSearch: (String value) {
      print('Search $value');
    },
    enabled: true,
    items: ['Item 1', 'Item 2', 'Item 3'],
    showSuggestions: true,
),
```

