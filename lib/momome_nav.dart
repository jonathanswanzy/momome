import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MomomeNav extends StatefulWidget {
  final double w;
  final double h;

  const MomomeNav({Key key, this.w, this.h}) : super(key: key);
  @override
  _MomomeNavState createState() => _MomomeNavState();
}

class _MomomeNavState extends State<MomomeNav> {
  List<Nav3ItemClass> items3 = List<Nav3ItemClass>();
  int pos = 1;

  @override
  void initState() {
    super.initState();
    items3.add(Nav3ItemClass(true, 'assets/svg/home.svg', 'Home', 1));
    items3.add(Nav3ItemClass(false, 'assets/svg/shop.svg', 'Cards', 3));
    items3.add(Nav3ItemClass(false, 'assets/svg/user.svg', 'Transfers', 5));
    items3.add(Nav3ItemClass(false, 'assets/svg/menu.svg', 'More', 7));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.w - 0,
        height: widget.h / 4 * 0.4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff03091E),
              Color(0xff010921),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          //borderRadius: BorderRadius.circular(widget.h / 4 * 0.4),
        ),
        padding: EdgeInsets.all(6),
        child: Container(
          padding: EdgeInsets.only(
            left: 50,
            right: 16,
          ),
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.h / 4 * 0.4),
            color: Color(0xff39036B),
          ),*/
          child: Stack(
            children: <Widget>[
              Row(
                children: items3.map((i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        items3.forEach((el) => el.isOpen = false);
                        i.isOpen = true;
                        pos = i.pos;
                      });
                    },
                    child: Nav3Item(
                      w: widget.w,
                      h: widget.w,
                      item: i,
                    ),
                  );
                }).toList(),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.elasticOut,
                top: ((widget.h / 4 * 0.4) - 12) * 0.65,
                left: ((((widget.w - 48) - 32 - 12) / 4) / 2) * pos - 10 / 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFB84C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Nav3ItemClass {
  bool isOpen;
  String icon;
  String title;
  int pos;

  Nav3ItemClass(this.isOpen, this.icon, this.title, this.pos);
}

class Nav3Item extends StatelessWidget {
  final double w;
  final double h;
  final Nav3ItemClass item;

  const Nav3Item({Key key, this.w, this.h, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((w - 48) - 44) / 4,
      height: (h / 4 * 0.4) + 36,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceOut,
            top: item.isOpen ? -24 : ((h / 4 * 0.4) + 12) / 2,
            left: ((((w - 48) - 44) / 4) - 24) / 2,
            child: Container(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                item.icon,
                fit: BoxFit.cover,
                color: Color(0xffc7a1da),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceOut,
            top: item.isOpen ? ((h / 4 * 0.4) + 12) / 2 : -24,
            child: Container(
              width: ((w - 48) - 44) / 4,
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
