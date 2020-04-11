import 'package:flutter/widgets.dart';
import 'package:parallel_ui/components/menu_base_item.dart';

class MenuStrapLine extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Icon suffixIcon;
  MenuStrapLine({this.text, this.style = const TextStyle(), this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 16.0, 4.0),
      child: MenuBaseItem(
        text: Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF999999),
          ).merge(style),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
