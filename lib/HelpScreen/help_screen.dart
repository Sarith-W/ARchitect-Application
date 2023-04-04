import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                  'Help',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  )
              ),
              centerTitle: true,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: Offset(0.0, 3)
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'How to view the furniture in AR?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 320,
                          decoration: const BoxDecoration(
                              color: Color(0xFF2d3436),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 3)
                                )
                              ]
                          ),
                          child: Column(
                            children: const [
                              SizedBox(height: 20),
                              Text(
                                'Method 1:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Step 1: Go to the Home',
                                textAlign: TextAlign.left, // add this line to align the text to the left
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Step 2: Click the “AR” on the slideshow.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 320,
                          decoration: const BoxDecoration(
                              color: Color(0xFF2d3436),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 3)
                                )
                              ]
                          ),
                          child: Column(
                            children: const [
                              SizedBox(height: 20),
                              Text(
                                'Method 2:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Step 1: Go to the Home',
                                textAlign: TextAlign.left, // add this line to align the text to the left
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Step 2: Click the three lines in the top \nleft corner',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Step 3: Select View in AR.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
