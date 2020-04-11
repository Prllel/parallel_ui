import 'package:flutter/widgets.dart';
import 'package:parallel_ui/components/menu_base_item.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Icon suffixIcon;
  MenuItem({this.text, this.style = const TextStyle(), this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 8.0),
      child: MenuBaseItem(
        text: Text(text,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFFFFFFFF),
            ).merge(style)),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
