import 'package:flutter/widgets.dart';
import 'package:parallel_ui/colors.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  final Widget child;
  final MenuDrawerController controller;
  final List<Widget> elements;
  MenuDrawer({@required this.child, this.controller, this.elements});

  @override
  State<StatefulWidget> createState() => MenuDrawerState();
}

class MenuDrawerState extends State<MenuDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  CurvedAnimation shiftAnimation;
  Animation<double> scaleAnimation;
  final menuScrollKey = GlobalKey();

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    shiftAnimation =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOut);

    scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
        CurvedAnimation(parent: _animController, curve: Curves.easeInOut));

    widget.controller.addListener(() {
      print('widget.controller.opened; ${widget.controller.opened}');
      if (widget.controller.opened) {
        open();
      } else {
        close();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animController,
      child: widget.child,
      builder: (ctx, child) {
        return Container(
            color: PColors.black,
            child: Stack(
              children: <Widget>[
                Transform.scale(
                    scale: scaleAnimation.value,
                    origin: Offset(-(w * .5), 0.0),
                    child: child),
                _buildMenu(),
              ],
            ));
      },
    );
  }

  Widget _buildMenu() {
    final w = MediaQuery.of(context).size.width * 1.0;
    return Positioned(
      top: 0,
      bottom: 0,
      right: (-w * (1 - shiftAnimation.value)),
      child: SizedBox(
        width: w,
        child: Container(
            // color: PColors.BackgroundOverlayColor,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [PColors.transparent, PColors.black])),
            child: Align(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                key: menuScrollKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 100.0),
                    ...(widget.elements ?? []),
                    SizedBox(height: 100.0,)
                  ],
                ),
              ),
            )),
      ),
    );
  }

  open() {
    _animController.forward();
  }

  close() {
    _animController.reverse();
  }
}

class MenuDrawerController extends ChangeNotifier {
  get opened => _opened;
  bool _opened = false;

  open() {
    if (_opened == true) {
      return;
    }
    _opened = true;
    notifyListeners();
  }

  close() {
    if (_opened == false) {
      return;
    }
    _opened = false;
    notifyListeners();
  }

  toggle() {
    _opened = !_opened;
    notifyListeners();
  }
}
