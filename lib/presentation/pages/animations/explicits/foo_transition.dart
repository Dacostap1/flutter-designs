import 'package:flutter/material.dart';

class FooTransitionPage extends StatefulWidget {
  const FooTransitionPage({Key? key}) : super(key: key);

  @override
  State<FooTransitionPage> createState() => _FooTransitionPageState();
}

class _FooTransitionPageState extends State<FooTransitionPage>
    with TickerProviderStateMixin {
  //USO LATE PORQ NO PUEDO INICIALIZAR CON EL THIS DEL TICKET PORQ LA CLASE AUN SE ESTA CREANDO
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
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
            //Con el listener cada ves que cambia la animacion muta el estado
            Container(
              color: Colors.red,
              height: _animation.value,
              width: _animation.value,
            ),
            ElevatedButton(
                onPressed: () {
                  print(_controller.status);

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
