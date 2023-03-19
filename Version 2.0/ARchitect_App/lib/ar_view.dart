import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:image/image.dart' as img;
import 'classifier.dart';
import 'dart:io';

import 'model.dart';

class ARViewWidget extends StatefulWidget {
  const ARViewWidget({Key? key}) : super(key: key);

  @override
  State<ARViewWidget> createState() => _ARViewWidgetState();
}

class _ARViewWidgetState extends State<ARViewWidget> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARAnchorManager? arAnchorManager;
  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];
  String currentObjectUri =
      "https://raw.githubusercontent.com/Sarith-W/ARchitect-Application/main/models/sofa1.glb";

  ScreenshotController screenshotController = ScreenshotController();
  late Classifier _classifier;

  @override
  void initState() {
    super.initState();
    _classifier = Model();
  }

  @override
  void dispose() {
    super.dispose();
    arSessionManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontal,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          height: 250,
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                height: 50,
                                width: 320,
                                child: FloatingActionButton.extended(
                                  label: const Text(
                                      'Rate the Furniture Arrangement'),
                                  backgroundColor: Colors.black,
                                  icon: const Icon(
                                    Icons.table_bar_rounded,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    onTakeScreenshot();
                                  },
                                ),
                              ),
                              Expanded(
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        buildOption(
                                          "https://raw.githubusercontent.com/Sarith-W/ARchitect-Application/main/models/sofa1.glb",
                                          "assets/images/sofa1Img.jpg",
                                        ),
                                        buildOption(
                                          "https://raw.githubusercontent.com/Sarith-W/ARchitect-Application/main/models/sofa2.glb",
                                          "assets/images/sofa2Img.jpg",
                                        ),
                                        buildOption(
                                          "https://raw.githubusercontent.com/Sarith-W/ARchitect-Application/main/models/sofa3.glb",
                                          "assets/images/sofa3Img.jpg",
                                        ),
                                        buildOption(
                                          "https://raw.githubusercontent.com/Sarith-W/ARchitect-Application/main/models/sofa4.glb",
                                          "assets/images/sofa4Img.jpg",
                                        ),
                                        buildOption(
                                          "https://raw.githubusercontent.com/Sarith-W/ARchitect-Application/main/models/sofa5.glb",
                                          "assets/images/sofa5Img.jpg",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.red,
                                    child: InkWell(
                                      onTap: () => onRemoveEverything(),
                                      borderRadius: BorderRadius.circular(10.0),
                                      splashColor: Colors.red.withOpacity(0.5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                          SizedBox(width: 8.0),
                                          Text(
                                            'Remove Everything',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.keyboard_arrow_up),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;
    this.arSessionManager!.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "assets/images/triangle.PNG",
          showWorldOrigin: false,
          handlePans: true,
          handleRotation: true,
        );
    this.arObjectManager!.onInitialize();
    this.arSessionManager!.onPlaneOrPointTap = onPlaneOrPointTapped;
  }

  Future<void> onRemoveEverything() async {
    for (var anchor in anchors) {
      arAnchorManager!.removeAnchor(anchor);
    }
    anchors = [];
  }

  Future<void> onTakeScreenshot() async {
    var image = await arSessionManager?.snapshot();
    if (image == null) return;

    await showDialog(
      context: context,
      builder: (_) => Dialog(
        child: SizedBox(
          height: 500,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 30,
                child: Text(
                  "A Preview",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Tap outside to see the results",
                  textAlign: TextAlign.center,
                ),
              ),
              Screenshot(
                controller: screenshotController,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: image, fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final path = (await getApplicationDocumentsDirectory()).path;
    String fileName = "image.png";
    final imagePath = '$path/image.png';

    screenshotController.captureAndSave(path, fileName: fileName);
    final imageFile = File(imagePath);

    final pred =
        _classifier.predict(img.decodeImage(imageFile.readAsBytesSync())!);

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Center(
          child: Text(
            "Here's the Result",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        content: Text(pred.toString()),
        actions: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere(
        (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    var newAnchor =
        ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
    bool? didAddAnchor = await arAnchorManager!.addAnchor(newAnchor);
    if (didAddAnchor!) {
      anchors.add(newAnchor);
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri: currentObjectUri,
          scale: vector.Vector3(0.8, 0.8, 0.8),
          position: vector.Vector3(0.0, 0.0, 0.0),
          rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddNodeToAnchor =
          await arObjectManager!.addNode(newNode, planeAnchor: newAnchor);
      if (didAddNodeToAnchor!) {
        nodes.add(newNode);
      } else {
        arSessionManager!.onError("Adding Node to Anchor failed");
      }
    } else {
      arSessionManager!.onError("Adding Anchor failed");
    }
  }

  Widget buildOption(String objectUrl, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: GestureDetector(
        onTap: () {
          currentObjectUri = objectUrl;
          Navigator.pop(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
