import 'package:flutter/widgets.dart';
import 'package:parallel_ui/components/common.dart';

class MenuItem extends StatelessWidget with MenuItemMixin {
  final String text;
  final TextStyle style;
  final Icon suffixIcon;
  MenuItem({this.text, this.style = const TextStyle(), this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return buildMenuItem(
      context: context,
      defaultFontSize: 14.0,
      defaultFontColor: Color(0xFFFFFFFF),
      defaultPadding: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 8.0));
  }
}
