import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8], //PUNTOS DE QUIEBRE
      colors: [
        Color(0xff2E305F),
        Color(0xff202333),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        const Positioned(
          top: -100,
          left: -30,
          child: _PinBox(),
        )
      ],
    );
  }
}

class _PinBox extends StatelessWidget {
  const _PinBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -95,
      child: Container(
        height: 360,
        width: 360,
        //  transform: Matrix4.rotationZ(-pi / 5), //No tiene un el mismo punto de origen que con el widget Transform
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(80),
        ),
      ),
    );
  }
}
