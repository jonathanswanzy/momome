import 'package:flutter/material.dart';

class CustomNavigationBarItem {
  /// Create a Custom Navigationbar Item.
  ///
  /// the [selectedIcon] must not be null.
  const CustomNavigationBarItem({
    @required this.icon,
    IconData selectedIcon,
    this.selectedTitle,
    this.unSelectedTitle,
  }) : selectedIcon = selectedIcon ?? icon;

  ///
  /// The icon of the item
  /// Typically the icon is an [Icon].
  ///
  final IconData icon;

  /// An alternative icon displayed when this bottom navigation item is
  /// selected.
  ///
  /// If this icon is not provided, the bottom navigation bar will display
  /// [icon] in either state.
  final IconData selectedIcon;

  ///
  /// The title string when item is selected.
  ///
  /// Item will only show [icon] when [selectedTitle] is null.
  final String selectedTitle;

  ///
  /// The title string when item is unselected.
  ///
  /// Item will only show [icon] when [unSelectedTitle] is null.
  final String unSelectedTitle;
}
