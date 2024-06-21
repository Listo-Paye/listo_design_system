enum NavigationMenuCollapseState {
  none(0.0),
  collapsed(72.0),
  expanded(262);

  const NavigationMenuCollapseState(this.width);

  final double width;
}
