import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flip_card/flip_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key, AnimationController animationController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  int _currentIndex = 0;
  ThemeStyle _currentStyle = ThemeStyle.Dribbble;

  AnimationController _animationController;
  Animation<double> _curvedAnimation;

  FocusNode _focusNode = FocusNode();

  AnimationController animationController;

  //List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: Color(0xFFF2F3F8),
  );



  double get w =>
      MediaQuery
          .of(context)
          .size
          .width;

  double get h =>
      MediaQuery
          .of(context)
          .size
          .height;




  @override
  void initState() {

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = HomePage(animationController: animationController);
    //tabBody = HomePage();
    //tabBody = MyDiaryScreen();
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.addStatusListener((AnimationStatus status) {
      if (!_focusNode.hasFocus && _animationController.isCompleted) {
        setState(() {
          FocusScope.of(context).requestFocus(_focusNode);
          print('complete  ${_focusNode.hasFocus}');
        });
      } else if (_focusNode.hasFocus && !_animationController.isCompleted) {
        _focusNode.unfocus();
      }
    });
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  void _flip(bool reverse) {
    if (_animationController.isAnimating) return;
    if (reverse) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E3E4),
      body: SafeArea(
          child: ListView(
            //shrinkWrap: true,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 140,
                        //color: GlobalConstUI.primaryColor,
                        color: Color(0xFFE5E3E4),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              SizedBox(
                                width: 10,
                              ),


                              Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 40,),
                                  Text(
                                    "Hi, Eddie",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontFamily: "Gilroy",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "Nice to see you again.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Gilroy",),
                                  ),

                                  SizedBox(
                                    width: 20,
                                  ),

                                  /* Positioned(
                                    child: Image.asset(
                                      "assets/icons/soup.png",
                                      width: 40,
                                    ),
                                  ),*/
                                ],
                              ),
                              Spacer(),
                              SizedBox(height: 40,),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 110,
                      ),


                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "    Start a Transaction",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 150,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[


                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          35.0, 12.0, 35.0, 12.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          SvgPicture.asset(
                                            "assets/images/mobile-payment.svg",
                                            width: 60,),
                                          SizedBox(height: 11,),
                                          Positioned(
                                            child: Text("Momo",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Gilroy",
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),),
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xFFF49931),
                                  ),
                                ),


                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          35.0, 12.0, 35.0, 12.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          SvgPicture.asset(
                                            "assets/images/museum.svg",
                                            width: 60,),
                                          SizedBox(height: 12,),
                                          Positioned(
                                            child: Text("Bank",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Gilroy",
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),),
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xFF3F9BFB),
                                  ),
                                ),


                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          35.0, 12.0, 35.0, 12.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          SvgPicture.asset(
                                            "assets/images/cash-.svg",
                                            width: 60,),
                                          SizedBox(height: 12,),
                                          Positioned(
                                            child: Text("Cash",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Gilroy",
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),),
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xFF54AE0D),
                                  ),
                                ),


                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          35.0, 12.0, 35.0, 12.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          SvgPicture.asset(
                                            "assets/images/tv-monitor.svg",
                                            width: 60,),
                                          SizedBox(height: 12,),
                                          Positioned(
                                            child: Text("TV",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Gilroy",
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),),
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xFF0E709E),
                                  ),
                                ),


                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          35.0, 12.0, 35.0, 12.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          SvgPicture.asset(
                                            "assets/images/idea.svg",
                                            width: 60,),
                                          SizedBox(height: 12,),
                                          Positioned(
                                            child: Text("Utilities",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Gilroy",
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),),
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xFF580B7C),
                                  ),
                                ),


                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          35.0, 12.0, 35.0, 12.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          SvgPicture.asset(
                                            "assets/images/water-tap.svg",
                                            width: 60,),
                                          SizedBox(height: 12,),
                                          Positioned(
                                            child: Text("Water",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Gilroy",
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),),
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xFFB41515),
                                  ),
                                ),


                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "    Your Cards",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                    child: Container(

                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 230.0,
                                      child: FlipCard(
                                        direction: FlipDirection.HORIZONTAL, // default
                                        front: Material(
                                          color: Colors.blueAccent,
                                          //color: Colors.white.withOpacity(0.9),
                                          borderRadius: BorderRadius.circular(24.0),
                                          shadowColor: Color(0x802196F3).withOpacity(0.2),
                                          child: _nameDetailsContainer(),
                                        ),
                                        back: Material(
                                          //color: Colors.white.withOpacity(0.7),
                                          color: Color(0xFF545454),
                                          borderRadius: BorderRadius.circular(24.0),
                                          shadowColor: Color(0x802196F3),
                                          child: _socialContainer(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "    Beneficiaries",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                            width: 30,
                          ),


                          Container(
                            height: 60,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[

                                SizedBox(
                                  //height: 20,
                                  width: 30,
                                ),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary0.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary01.jpg'),
                                ),
                                SizedBox(width: 10,),

                                Container(
                                  child: GestureDetector(
                                    //_showModalSheet();
                                    onTap: () {
                                      createAlertDialog(context);
                                    },
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/images/beneficiary1.jpg'),
                                    ),
                                  ),

                                ),

                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary2.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary3.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary4.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary5.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary6.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary7.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary8.jpg'),
                                ),
                                SizedBox(width: 10,),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/beneficiary10.jpg'),
                                ),
                                SizedBox(width: 30,),

                              ],
                            ),
                          ),


                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "    Recent Transactions",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Gilroy",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                            //width: 30,
                          ),

                          Container(
                            height: 100,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[


                                Container(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          45.0, 12.0, 45.0, 1.0),
                                      child: Row(

                                        children: [

                                          Stack(
                                            children: <Widget>[

                                              Row(
                                                children: [
                                                  SizedBox(height: 10,),
                                                  Text("Michael Korli       ",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontFamily: "Gilroy",
                                                      color: Colors.black,
                                                    ),),
                                                ],
                                              ),


                                              Row(
                                                children: [
                                                  SizedBox(height: 70,),
                                                  Text("October 30, 2020",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontFamily: "Gilroy",
                                                      color: Color(0xFF888888),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 11,),
                                          Positioned(
                                            child: Column(
                                              children: [
                                                SizedBox(width: 20,),
                                                new Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    new RaisedButton(
                                                      elevation: 0.0,
                                                      shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius
                                                              .circular(30.0)),
                                                      padding: EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 7.0,
                                                          right: 30.0,
                                                          left: 7.0),
                                                      onPressed: () {
                                                        //Navigator.of(context).pushReplacementNamed(VIDEO_SPALSH);
                                                      },
                                                      child: new Row(
                                                        mainAxisSize: MainAxisSize
                                                            .min,
                                                        children: <Widget>[
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 10.0),
                                                              child: new Text(
                                                                "  Successful",
                                                                style: TextStyle(
                                                                  fontSize: 15.0,
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color: Color(
                                                                      0xFF529550),
                                                                  fontFamily: "Gilroy",
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                      textColor: Color(
                                                          0xFF292929),
                                                      color: Color(0xFFccf0cc),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            //top: 80,
                                          ),
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 0.5,
                                    margin: EdgeInsets.all(10),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),


                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(top: 40, right: 15),
                        height: 90,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(
                            'assets/images/eddie-.jpg', fit: BoxFit.fill,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),

                  //bottomBar(),
                ],
              ),

              /*Stack(
                children: [
                  bottomBar(),
                ],
              ),*/
            ],
          ),
      ),
      bottomNavigationBar: _buildFloatingBar(),
    );
  }



  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }




  Widget _nameDetailsContainer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 70.0,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: ListTile(

                ),
              ),
            ],),
          ),
          Container(
            child: _detailsContainer(),
          ),
        ],
      ),
    );
  }

  Widget _socialContainer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 70.0,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      height: 50,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text("AUTHORIZED SIGNATURE",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],),
          ),

          Container(
            width: 150,
            height: 50,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("***",
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                  ),)
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            width: 150,
            //height: 50,
            //color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset('assets/images/eagle-.png', width: 50,),

                    SizedBox(width: 6,),
                    Text("Stanbic Bank",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


          Container(
            child: _socialdetailsContainer(),
          ),
        ],
      ),
    );
  }

  Widget _detailsContainer() {
    return Container(
      //color: Colors.blueAccent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 14.0, right: 14.0, bottom: 25),
            child: Column(
              children: [
                Positioned(
                  //alignment: AlignmentDirectional.topStart,
                  child: Row(
                    children: [
                      Image.asset("assets/images/chip.png", width: 60,),
                      SizedBox(width: 210,),
                      Image.asset("assets/images/stanbic-logo.png", width: 80,),
                    ],
                  ),
                  top: 30,
                ),

                Row(
                  children: [

                    Text(
                      '4445 6785 0031 3754',
                      style: TextStyle(
                          //color: Color(0xff000000),
                        color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: "Credit Card",
                        fontWeight: FontWeight.w700
                      ),
                    ),

                    SizedBox(width: 20,),

                    Column(
                      children: [
                        Text(
                          'VALID THRU',
                          style: TextStyle(
                            //color: Color(0xff000000),
                              color: Colors.white,
                              fontSize: 8.0,
                              fontFamily: "Credit Card",
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '08/24',
                          style: TextStyle(
                            //color: Color(0xff000000),
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: "Credit Card",
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ),
        ],
      ),
      );
  }


  Widget _socialdetailsContainer() {
    return Column(
      children: <Widget>[
        SizedBox(width: 10.0,),
        Padding(
          padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
          child: Container(
              child: Row(
                children: <Widget>[

                ],
              ),
          ),
        ),
      ],
    );
  }


//works
  createAlertDialog(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) {
      return Container(
        //height: MediaQuery.of(context).size.height * .90,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 50,),
                  SizedBox(height: 10,),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/beneficiary1.jpg'),
                  ),
                  Text("        233549692205\n        Michael Korli",
                    style: TextStyle(
                        fontFamily: "Gilroy", fontWeight: FontWeight.bold),),
                  Spacer(),

                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.black,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                ],
              ),

              Column(
                children: [
                  SizedBox(height: 50,),
                  Text("GHS 0.00",
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: "Gilroy",
                      color: Color(0xFFB2B2B2),
                    ),),
                ],
              ),


              Column(
                children: <Widget>[


                  // SizedBox(height: 50,),
                  Text("Enter Amount",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Gilroy",
                        color: Colors.black,
                        fontWeight: FontWeight.w700
                    ),),

                  Text("GHS 5000.00 MAX",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Gilroy",
                        color: Color(0xFF706E6E),
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),


              Row(
                children: <Widget>[
                  Container(
                    //  child: RadioGroup(),
                  ),
                ],
              ),


              SizedBox(height: 30),

              Text("Select Operator", style: TextStyle(fontFamily: "Gilroy",
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
              SizedBox(width: 10,),

              DropdownButton(
                style: TextStyle(fontFamily: "Gilroy", color: Colors.black),
                //onChanged:handleNetwork,
                //value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "MTN", style: TextStyle(fontWeight: FontWeight.w700),),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text("AirtelTigo",
                      style: TextStyle(fontWeight: FontWeight.w700),),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Vodafone",
                      style: TextStyle(fontWeight: FontWeight.w700),),
                    value: 2,
                  ),
                ],
                onChanged: (value) {

                },
              ),


              SizedBox(height: 40,),

              TextFormField(

                decoration: InputDecoration(
                  hintText: "Enter a reference",
                ),
                //validator: validateMobile,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Gilroy"),

              ),

              SizedBox(height: 20,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Make Payment',
                      style: TextStyle(fontFamily: "Gilroy", fontSize: 20),),
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () async {

                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      //);
    });
  }




  Widget _buildBottomNavigationBar() {
    switch (_currentStyle) {
      case ThemeStyle.Dribbble:
        return _buildOriginDesign();
      case ThemeStyle.Light:
        return _buildLightDesign();
      case ThemeStyle.AntDesign:
        return _buildCustomIconDesign();
      case ThemeStyle.BorderRadius:
        return _buildBorderRadiusDesign();
      case ThemeStyle.FloatingBar:
        return _buildFloatingBar();
      case ThemeStyle.NoElevation:
        return _buildNoElevation();
      default:
        return _buildOriginDesign();
    }
  }

  Widget _buildOriginDesign() {
    return CustomNavigationBar(
      scaleFactor: 0.1,
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Color(0xff040307),
      items: [
        CustomNavigationBarItem(
          icon: Icons.home,
        ),
        CustomNavigationBarItem(
          icon: Icons.shopping_cart,
        ),
        CustomNavigationBarItem(
          icon: Icons.lightbulb_outline,
        ),
        CustomNavigationBarItem(
          icon: Icons.search,
        ),
        CustomNavigationBarItem(
          icon: Icons.account_circle,
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildLightDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff040307),
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: Icons.home,
        ),
        CustomNavigationBarItem(
          icon: Icons.shopping_cart,
        ),
        CustomNavigationBarItem(
          icon: Icons.lightbulb_outline,
        ),
        CustomNavigationBarItem(
          icon: Icons.search,
        ),
        CustomNavigationBarItem(
          icon: Icons.account_circle,
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildNoElevation() {
    return CustomNavigationBar(
      elevation: 0.0,
      iconSize: 30.0,
      selectedColor: Color(0xff625aff),
      strokeColor: Color(0xff625aff),
      unSelectedColor: Colors.white,
      backgroundColor: Color(0xffa9a5f2),
      items: [
        CustomNavigationBarItem(
          icon: Icons.home,
        ),
        CustomNavigationBarItem(
          icon: Icons.shopping_cart,
        ),
        CustomNavigationBarItem(
          icon: Icons.lightbulb_outline,
        ),
        CustomNavigationBarItem(
          icon: Icons.search,
        ),
        CustomNavigationBarItem(
          icon: Icons.account_circle,
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildCustomIconDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: AntDesign.getIconData('home'),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData('shoppingcart'),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData("cloudo"),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData('search1'),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData("user"),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildBorderRadiusDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: Radius.circular(20.0),
      items: [
        CustomNavigationBarItem(
          icon: AntDesign.getIconData('home'),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData('shoppingcart'),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData("cloudo"),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData('search1'),
        ),
        CustomNavigationBarItem(
          icon: AntDesign.getIconData("user"),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildFloatingBar() {
    return CustomNavigationBar(
      iconSize: 38.0,
      selectedColor: Color(0xff4a24db),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      //backgroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      //borderRadius: Radius.circular(20.0),
      items: [

        CustomNavigationBarItem(
          icon: FontAwesome.getIconData('home'),
        ),
        CustomNavigationBarItem(
          icon: FontAwesome.getIconData("credit-card"),
        ),
        CustomNavigationBarItem(
          icon: FontAwesome.getIconData("random"),
        ),
        CustomNavigationBarItem(
          icon: FontAwesome.getIconData('ellipsis-h'),
        ),

      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: false,
    );
  }


}

enum ThemeStyle {
  Dribbble,
  Light,
  NoElevation,
  AntDesign,
  BorderRadius,
  FloatingBar
}