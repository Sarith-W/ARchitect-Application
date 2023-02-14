import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {}, //Menu button
        ),
        title: Text("ARCHITECT",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            )),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: (MediaQuery.of(context).size.height - 200) / 3,
                      child: Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: (MediaQuery.of(context).size.height - 200) / 3,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            "SCAN",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800,
                                fontSize: 50,
                                color: Colors.white),
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 12),
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: (MediaQuery.of(context).size.height - 200) / 3,
                      child: Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1109&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: (MediaQuery.of(context).size.height - 200) / 3,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            "CREATE",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800,
                                fontSize: 50,
                                color: Colors.white),
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 12),
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: (MediaQuery.of(context).size.height - 200) / 3,
                      child: Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: (MediaQuery.of(context).size.height - 200) / 3,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            "EDIT.",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800,
                                fontSize: 50,
                                color: Colors.white),
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shadowColor: Colors.black,
                      elevation: 2,
                      disabledForegroundColor: Colors.black.withOpacity(0.38),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                    ),
                    child: Text("Initiate Scan",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
