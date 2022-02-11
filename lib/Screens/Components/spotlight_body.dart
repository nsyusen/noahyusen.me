import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noah_yusen_website/Screens/Components/project_dialog.dart';

import '../../constants.dart';

class SpotlightBody extends StatelessWidget {

  final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android);

  @override
  Widget build(BuildContext context) {
    if (!isWebMobile) {
      return OverflowBox(
        minWidth: 1000,
        maxWidth: MediaQuery
            .of(context)
            .size
            .width < 1000 ? 1000 : MediaQuery
            .of(context)
            .size
            .width,
        minHeight: MediaQuery
            .of(context)
            .size
            .height - topBarHeight - bottomBarHeight,
        maxHeight: MediaQuery
            .of(context)
            .size
            .height - topBarHeight - bottomBarHeight,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 100
          ),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(

                    ),
                    child: Text(
                      "Project Spotlights",
                      style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ProjectWidget(
                    fileName: "schoolsync",
                    projectName: "School Sync",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ProjectWidget(
                      fileName: "viewbuddy",
                      projectName: "View Buddy"
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ProjectWidget(
                      fileName: "click",
                      projectName: "Click"
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
    scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Project Spotlights",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ProjectWidget(
              fileName: "schoolsync",
              projectName: "School Sync",
            ),
            SizedBox(
              height: 20,
            ),
            ProjectWidget(
                fileName: "viewbuddy",
                projectName: "View Buddy"
            ),
            SizedBox(
              height: 20,
            ),
            ProjectWidget(
                fileName: "click",
                projectName: "Click"
            )
          ],
        ),
      );
    }
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    Key? key,
    required this.fileName,
    required this.projectName
  }) : super(key: key);

  final String fileName;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);
    if (!isWebMobile) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(5,7)
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color(0xFF3F3E3A),
                      Color(0xFF0B0B0B)
                    ]
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  showDialog(context: context, builder: (context) {
                    return ProjectDialog(fileName: fileName);
                  });
                },
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/$fileName.png",
                            height: double.infinity,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                fontSize: 100,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                projectName,
                                style: TextStyle(
                                    fontSize: 1000,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Column(
        children: [
          Text(
            projectName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            )
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 30,
              right: 30,
              bottom: 30
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 7,
                      offset: Offset(3,5)
                  )
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(0xFF3F3E3A),
                          Color(0xFF0B0B0B)
                        ]
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    splashColor: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return ProjectDialog(fileName: fileName);
                      });
                    },
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Image.asset(
                            "assets/images/$fileName.png",
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}