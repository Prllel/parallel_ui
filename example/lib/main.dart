import 'package:flutter/material.dart';
import 'package:parallel_ui/components/menu_drawer.dart';
import 'package:parallel_ui/components/menu_item.dart';
import 'package:parallel_ui/components/menu_title.dart';
import 'package:parallel_ui/components/menu_strapline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuDrawerController menuController;
  
  @override
  void initState() {
    menuController = MenuDrawerController();
    super.initState();
  }

  void _openDrawer() {
    menuController.toggle();
  }

  List<Widget> _buildMoreItems() {
    List<Widget> items = [];
    for(int i = 0; i < 42; i++) {
      switch (i%10) {
        case 1:
        items.add(MenuTitle(text: 'This is another title'));
          break;
        case 4:
        items.add(MenuStrapLine(text: 'This is another strapline'));
          break;
        default:
        items.add(MenuItem(text: 'This is an the item $i'));
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuDrawer(
        elements: <Widget>[
          MenuStrapLine(text: 'This is a strapline'),
          MenuTitle(text: 'This is a Title'),
          MenuItem(text: 'This is an item', suffixIcon: Icon(Icons.ac_unit, color: Colors.white,),),
          ..._buildMoreItems(),
        ],
        controller: menuController,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Just a container',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openDrawer,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
