import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:noah_yusen_website/constants.dart';

import 'Components/home_body.dart';
import 'Components/spotlight_body.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _hovering = [false, false];
  String currentPage = "Home";
  Widget _animatedWidget = HomeBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: topBarHeight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onHover: (value) {
                  setState(() {
                    _hovering[0] = value;
                  });
                },
                onTap: () {
                  setState(() {
                    currentPage = "Home";
                    _animatedWidget = HomeBody();
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _hovering[0] ? Colors.white
                              : currentPage == "Home" ? Colors.white
                              : Color.fromARGB(255, 210, 210, 210)
                      ),
                    ),
                    SizedBox(
                        height: 5
                    ),
                    Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: (_hovering[0] || currentPage == "Home"),
                        child: Container(
                            height: 2,
                            width: 30,
                            color: Colors.white
                        )
                    )
                  ],
                )
            ),
            SizedBox(
                width: 50
            ),
            InkWell(
                onHover: (value) {
                  setState(() {
                    _hovering[1] = value;
                  });
                },
                onTap: () {
                  setState(() {
                    currentPage = "Spotlight";
                    _animatedWidget = SpotlightBody();
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Spotlight",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _hovering[1] ? Colors.white
                              : currentPage == "Spotlight" ? Colors.white
                              : Color.fromARGB(255, 210, 210, 210)
                      ),
                    ),
                    SizedBox(
                        height: 5
                    ),
                    Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: (_hovering[1] || currentPage == "Spotlight"),
                        child: Container(
                            height: 2,
                            width: 30,
                            color: Colors.white
                        )
                    )
                  ],
                )
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _animatedWidget
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: bottomBarHeight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Spacer(),
                InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/linkedin-round.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "LinkedIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        )
                      ),
                    ],
                  ),
                  onTap: () => launch("https://www.linkedin.com/in/noah-yusen-543518215/"),
                ),
                Spacer(),
                InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/github.png",
                      ),
                      SizedBox(
                        width: 10
                      ),
                      Text(
                        "Github",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        ),
                      ),
                    ],
                  ),
                  onTap: () => launch("https://github.com/nitrous10?tab=repositories")
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}