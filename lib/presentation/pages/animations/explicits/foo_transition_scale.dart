import 'package:flutter/material.dart';

class FooTransitionScalePage extends StatefulWidget {
  const FooTransitionScalePage({Key? key}) : super(key: key);

  @override
  State<FooTransitionScalePage> createState() => _FooTransitionScalePageState();
}

class _FooTransitionScalePageState extends State<FooTransitionScalePage>
    with TickerProviderStateMixin {
  //USO LATE PORQ NO PUEDO INICIALIZAR CON EL THIS DEL TICKET PORQ LA CLASE AUN SE ESTA CREANDO
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = Tween<double>(begin: 0, end: 30).animate(_controller);

    // _animation = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.fastOutSlowIn,
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Parecido a lo que seria un GrowTransition
            ScaleTransition(
              scale: _animation,
              child: Container(
                color: Colors.yellow,
                height: 10, // *30 = 300
                width: 10, // *30 = 300
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_controller.status == AnimationStatus.completed) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: const Text('Animar'))
          ],
        ),
      ),
    );
  }
}
