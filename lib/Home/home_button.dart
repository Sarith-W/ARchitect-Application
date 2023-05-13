import 'package:architect_app/Home/home.dart';
import 'package:flutter/material.dart';

class DraggableButton extends StatefulWidget {
  const DraggableButton({super.key});

  @override
  State<DraggableButton> createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  double _x = 0.0;
  double _y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _x,
      top: _y,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _x += details.delta.dx;
              _y += details.delta.dy;
            });
          },
          child: Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Center(
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
