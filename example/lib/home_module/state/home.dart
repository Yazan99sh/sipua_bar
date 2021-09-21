import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_hub/home_module/state/home_state.dart';
import 'package:idea_hub/main.dart';
import 'package:sipua_bar/sipua_bar.dart';
class HomeStartState extends HomeState {
  HomeStartState(HomeScreenState screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 255, 132, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(238, 255, 132, 1),
        centerTitle: false,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: home(context),
      bottomNavigationBar: SipuaNavigationBar(
        cursorColor: Colors.white,
        currentIndex: 0,
        selectedContent: Colors.black,
        items: [
          SipuaItem(label: 'Home', icon: Icons.home_rounded),
          SipuaItem(label: 'Tips', icon: Icons.opacity_rounded),
          SipuaItem(label: 'Ideas', icon: Icons.lightbulb_rounded),
          SipuaItem(label: 'Book', icon: Icons.book_rounded),
        ],
        onItemSelected: (int) {},
        unselectedContent: Colors.white,
        animationDuration: Duration(milliseconds: 350),
        backgroundColor:Color.fromRGBO(238, 255, 132, 1),
      ),
    );
  }
}

Widget home(BuildContext context) {
  return Stack(children: [
    Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            TweenAnimationBuilder(
                tween: Tween<Offset>(begin: Offset(14, 0), end: Offset(0, 0)),
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.51,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(10)),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 7.0, left: 7.0),
                      child: Text(
                        'IDEA',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 41,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                builder: (_, Offset val, child) {
                  return Transform.translate(offset: val, child: child);
                }),
            Padding(
              padding: const EdgeInsets.only(left: 7.0, right: 7),
              child: Text(
                'HUB',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 41,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            width: 250,
            child: Text(
              'Let me help you finding the perfect idea for your project',
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          height: 44,
          width: 120,
          child: RaisedButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            color: Colors.grey[850],
            child: Text(
              'Start Now',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        )
      ],
    ),
  ]);
}
