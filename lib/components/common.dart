
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:parallel_ui/components/menu_content_item.dart';

mixin MenuItemMixin {
  String get text;
  TextStyle get style;
  Icon get suffixIcon;

  Widget buildMenuItem({
    BuildContext context,
    num defaultFontSize = 14,
    Color defaultFontColor,
    EdgeInsetsGeometry defaultPadding = const EdgeInsets.all(8.0)
    }) {
    return Padding(
      padding: defaultPadding,
      child: MenuContentItem(
        text: Text(text,
            style: TextStyle(
              fontSize: defaultFontSize,
              color: defaultFontColor,
            ).merge(style)),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
