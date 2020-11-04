library flutter_gifimage;
import 'package:flutter/material.dart';
import 'package:momome/src/ui/const_ui/const_ui.dart';
import 'package:momome/src/ui/home_page/home_page.dart';
import 'package:lottie/lottie.dart';


class IntroPage extends StatelessWidget {

  //GifController controller= GifController(vsync: this);
  //GifController controller= GifController();

  @override
  Widget build(BuildContext context) {
    Size sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: GlobalConstUI.primaryColor,
      backgroundColor: GlobalConstUI.gradient1,
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: -200,
                  top: -130,
                  child: Opacity(
                      opacity: .1, child: Image.asset("assets/icons/three-coin-stacks.png"))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: sizeDevice.height / 6,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome to\nMomome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      "A better way to send money.",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Gilroy",),
                    ),
                    SizedBox(
                      height: sizeDevice.height / 18,
                    ),


                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        decoration: BoxDecoration(
                          color: GlobalConstUI.secondColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 60),
                              alignment: Alignment.center,
                              child: Text(
                                "Get Started",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "Gilroy",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => HomePage()));
                      },
                    ),
                  ],
                ),
              ),


              Positioned(
                child: Column(
                  children: [

                    Lottie.network(
                           'https://assets3.lottiefiles.com/packages/lf20_ltbqacam.json',
                           repeat: true,
                           reverse: true,
                           animate: true,
                      width: 450,
                         ),
                  ],
                ),
                top: 350,
                bottom: 3,
                left: -20,
              ),

            ],
          )
      ),
    );
  }
}