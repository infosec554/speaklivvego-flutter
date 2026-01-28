import 'package:flutter/material.dart';

abstract class BaseAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.addToHeight = 0,
  });

  final double addToHeight;

  @override
  Size get preferredSize =>
      Size(double.maxFinite, addToHeight + kToolbarHeight);
}
