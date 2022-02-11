import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../constants.dart';

class ProjectDialog extends StatelessWidget {
  const ProjectDialog({
    Key? key,
    this.radius = 10,
    required this.fileName,
  }) : super(key: key);

  final double radius;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius)
        ),
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)
                  ),
                  color: primaryColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder(
                  future: Future.delayed(Duration(milliseconds: 150)).then((value) {
                    return rootBundle.loadString('assets/$fileName.md');
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(
                        data: snapshot.data as String,
                        styleSheet: MarkdownStyleSheet(
                          h1: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                          ),
                          h2: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          h3: TextStyle(
                              color: Colors.white
                          ),
                          p: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          listBullet: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: primaryColor,
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(radius),
                          bottomRight: Radius.circular(radius)
                      )
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text(
                    "Close",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            )
          ],
        )
    );
  }

}