import 'package:flutter/widgets.dart';
import 'package:parallel_ui/components/common.dart';
import 'package:parallel_ui/components/menu_content_item.dart';

class MenuStrapLine extends StatelessWidget with MenuItemMixin{
  final String text;
  final TextStyle style;
  final Icon suffixIcon;
  MenuStrapLine({this.text, this.style = const TextStyle(), this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return buildMenuItem(
      context: context,
      defaultFontSize: 12.0,
      defaultFontColor: Color(0xFF999999),
      defaultPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 16.0, 4.0));
  }
}
