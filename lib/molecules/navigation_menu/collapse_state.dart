@Deprecated('Ce composant sera bientôt supprimé pour une refonte complète.')
enum NavigationMenuCollapseState {
  none(0.0),
  collapsed(92.0),
  expanded(262);

  const NavigationMenuCollapseState(this.width);

  final double width;
}
