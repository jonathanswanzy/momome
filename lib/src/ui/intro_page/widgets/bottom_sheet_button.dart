import 'package:flutter/material.dart';
import 'package:momome/src/ui/const_ui/const_ui.dart';
import 'package:momome/src/ui/home_page/home_page.dart';


class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        decoration: BoxDecoration(
          color: GlobalConstUI.secondColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 110),
              alignment: Alignment.center,
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: GlobalConstUI.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
