import 'package:flutter/material.dart';

import '../Home/home_button.dart';
import '../TopBar/app_bar.dart';
import '../AR/ar_view.dart';

class Customize extends StatefulWidget {
  final String path;
  const Customize(this.path, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Customize> createState() => _CustomizeState(path);
}

class _CustomizeState extends State<Customize> {
  final String path;
  _CustomizeState(this.path);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Customize the Product",
                style: TextStyle(
                    fontFamily: 'Itim',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Image(
                  image: AssetImage(path),
                  height: 350,
                  // width: 70,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "Select a color",
                  style: TextStyle(
                      fontSize: 20,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Select a dimension",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand'
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Length',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Width',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Height',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              SizedBox(
                width: 300,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ARViewWidget()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shadowColor: const Color.fromARGB(255, 120, 112, 112),
                    elevation: 2,
                    disabledForegroundColor: Colors.black.withOpacity(0.38),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  child: const Text(
                    "View in AR",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
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
