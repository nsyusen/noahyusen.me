import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:noah_yusen_website/constants.dart';

class HomeBody extends StatelessWidget {

  final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

  @override
  Widget build(BuildContext context) {
    if (!isWebMobile) {
      return OverflowBox(
        minWidth: 1000,
        maxWidth: MediaQuery.of(context).size.width < 1000 ? 1000 : MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height - topBarHeight - bottomBarHeight,
        maxHeight: MediaQuery.of(context).size.height - topBarHeight - bottomBarHeight,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 100,
                    left: 100
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/snowman.jpeg",
                              height: 300,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: Offset(3,5)
                            )
                          ]
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ShadowText(
                              data: "Introduction",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 75,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              infoDescription,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "My Favorite Tools and Languages",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  )
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50
                  ),
                  child: Container(
                    height: 400,
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Image.asset(
                              "assets/images/icon${index+1}.png",
                              height: 200,
                            )
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                    right: 100
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShadowText(
                              data: "Other Interests",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 75,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              interestsDescription,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        "assets/images/language.png",
                        height: 200,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 30,
          right: 30
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Introduction",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/snowman.jpeg",
                      height: 250,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15
              ),
              Text(
                infoDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                  "My Favorite Tools and Languages",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  )
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: _generateChildren(),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Other Interests",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "images/language.png",
                height: 100,
              ),
              Text(
                interestsDescription,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      );
    }
  }

  List<Widget> _generateChildren() {
    return List<Widget>.generate(6, (index) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Image.asset(
              "assets/images/icon${index+1}.png",
              height: 100,
            )
        ),
      );
    });
  }
}

class ShadowText extends StatelessWidget {
  const ShadowText({
    Key? key,
    required this.data,
    required this.style,
    required this.textAlign
});

  final String data;
  final TextAlign textAlign;
  final TextStyle style;

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 2.0,
            left: 2.0,
            child: new Text(
              data,
              textAlign: textAlign,
              style: style.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: new Text(data, textAlign: textAlign, style: style),
          ),
        ],
      ),
    );
  }
}
