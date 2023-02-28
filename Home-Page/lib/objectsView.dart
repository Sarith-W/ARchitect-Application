// ignore_for_file: file_names

import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ObjectsView extends StatefulWidget {
  const ObjectsView({Key? key}) : super(key: key);

  @override
  State<ObjectsView> createState() => _ObjectsViewState();
}

class _ObjectsViewState extends State<ObjectsView> {
  late final ARSessionManager arSessionManager;
  late final ARObjectManager arObjectManager;
  late final ARAnchorManager arAnchorManager;
  late final ARLocationManager arLocationManager;

  ARNode? webObjectNode;

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arSessionManager.onInitialize(
          showPlanes: true,
          showWorldOrigin: true,
        );
    this.arObjectManager.onInitialize();
  }

  Future<void> onWebObjectAtButtonPressed() async {
    if (webObjectNode != null) {
      arObjectManager.removeNode(webObjectNode!);
      webObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri:
              "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Fox/glTF-Binary/Fox.glb",
          scale: vector.Vector3(0.2, 0.2, 0.2));
      bool? didAddWebNode = await arObjectManager.addNode(newNode);
      webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ARCHITECT",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  color: Colors.black,
                  child: ARView(
                    onARViewCreated: onARViewCreated,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: onWebObjectAtButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: const Color.fromARGB(255, 120, 112, 112),
                  elevation: 2,
                  disabledForegroundColor: Colors.black.withOpacity(0.38),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                child: Text(
                  webObjectNode == null
                      ? "Add Local Object"
                      : "Remove Local Object",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
