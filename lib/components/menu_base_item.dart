import 'package:flutter/widgets.dart';

class MenuBaseItem extends StatelessWidget {
  
  final Icon suffixIcon;
  final Text text;
  MenuBaseItem({this.text, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      text,
      if (suffixIcon != null) ...[SizedBox(width: 4.0,), suffixIcon]
    ]);
  }
}