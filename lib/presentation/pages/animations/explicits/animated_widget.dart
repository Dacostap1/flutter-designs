import 'package:flutter/material.dart';

class AnimatedWidgetPage extends StatefulWidget {
  const AnimatedWidgetPage({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetPage> createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage>
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
      ..addStatusListener((status) {
        //SE HACE INFINITO
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..addStatusListener((status) => print(status));
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
            AnimatedMyContainer(animation: _animation),
            ElevatedButton(
                onPressed: () {
                  _controller.forward();
                },
                child: const Text('Animar'))
          ],
        ),
      ),
    );
  }
}

class AnimatedMyContainer extends AnimatedWidget {
  //INTERNAMENTE HACE SU ADD LISTENER Y SET STATE
  const AnimatedMyContainer({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final _animation = listenable as Animation<double>;

    return Container(
      color: Colors.red,
      height: _animation.value,
      width: _animation.value,
    );
  }
}
