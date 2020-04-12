import 'package:flutter/widgets.dart';
import 'package:parallel_ui/components/common.dart';
import 'package:parallel_ui/components/menu_content_item.dart';

class MenuTitle extends StatelessWidget with MenuItemMixin {
  final Icon suffixIcon;
  final String text;
  final TextStyle style;
  MenuTitle({this.text, this.style = const TextStyle(), this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return buildMenuItem(
      context: context,
      defaultFontSize: 21.0,
      defaultFontColor: Color(0xFFFFFFFF),
      defaultPadding: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 8.0));
  }
}
