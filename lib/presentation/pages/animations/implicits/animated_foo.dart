import 'package:flutter/material.dart';

class AnimatedFoo extends StatefulWidget {
  const AnimatedFoo({Key? key}) : super(key: key);

  @override
  State<AnimatedFoo> createState() => _AnimatedFooState();
}

class _AnimatedFooState extends State<AnimatedFoo> {
  double _height = 0.0;
  double _width = 0.0;
  Color color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve: Curves.bounceOut,
              height: _height,
              width: _width,
              color: color,
              duration: const Duration(milliseconds: 300),
            ),
            ElevatedButton(
                onPressed: () {
                  _height = 300;
                  _width = 300;
                  color = Colors.pink;

                  setState(() {});
                },
                child: const Text('SetState'))
          ],
        ),
      ),
    );
  }
}
