import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderPage> createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with TickerProviderStateMixin {
      
  //USO LATE PORQ NO PUEDO INICIALIZAR CON EL THIS DEL TICKET PORQ LA CLASE AUN SE ESTA CREANDO    
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
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
            MySizeTransition(
              animation: _animation,
              child: const MyContainerWidget(),
            ),
            ElevatedButton(
                onPressed: () {
                  // SE HACE CONTROLADO POR EL EVENTO ONPRESS

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

class MySizeTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> _animation;

  const MySizeTransition({
    Key? key,
    required Animation<double> animation,
    required this.child,
  })  : _animation = animation,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          height: _animation.value,
          width: _animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  const MyContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
