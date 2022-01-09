import 'package:flutter/material.dart';

class AnimatedWidgetTwoTweensPage extends StatefulWidget {
  const AnimatedWidgetTwoTweensPage({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetTwoTweensPage> createState() =>
      _AnimatedWidgetTwoTweensPageState();
}

class _AnimatedWidgetTwoTweensPageState
    extends State<AnimatedWidgetTwoTweensPage> with TickerProviderStateMixin {
  //USO LATE PORQ NO PUEDO INICIALIZAR CON EL THIS DEL TICKET PORQ LA CLASE AUN SE ESTA CREANDO
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
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
            AnimatedMyContainer(
                animation:
                    _animation), //Se puede pasar el controlador tambien es instancia de Animation<double>
            ElevatedButton(
                onPressed: () {
                  _controller.forward();

                  //SE HACE CONTROLADO POR EL EVENTO ONPRESS

                  // if (_controller.status == AnimationStatus.completed) {
                  //   _controller.reverse();
                  // } else {
                  //   _controller.forward();
                  // }
                },
                child: const Text('Animar'))
          ],
        ),
      ),
    );
  }
}

class AnimatedMyContainer extends AnimatedWidget {
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);

  //INTERNAMENTE HACE SU ADD LISTENER Y SET STATE
  const AnimatedMyContainer({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final _animation = listenable as Animation<double>;

    return Opacity(
      opacity: _opacityTween.evaluate(_animation),
      child: Container(
        color: Colors.red,
        height: _sizeTween.evaluate(_animation),
        width: _sizeTween.evaluate(_animation),
      ),
    );
  }
}
