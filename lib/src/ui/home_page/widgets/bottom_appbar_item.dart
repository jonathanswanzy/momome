import 'package:flutter/material.dart';
import 'package:momome/src/ui/const_ui/const_ui.dart';

class BottomAppBarItem extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String title;
  //final Image image;
  BottomAppBarItem({this.active, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(icon,
              color: active ? GlobalConstUI.primaryColor : Colors.black26),
          onPressed: () {},
        ),
        Text(
          title ?? "",
          style: TextStyle(
              color: active ? GlobalConstUI.primaryColor : Colors.black26),
        )
      ],
    );
  }
}
