import 'package:flutter/material.dart';

class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({Key? key}) : super(key: key);

  @override
  State<TweenAnimationPage> createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage> {
  double end = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //SIEMPRE VA DE INICIO A FIN, NO SE PUEDE MOVER A UN PUNTO INTERMEDIO DE LA ANIMACION
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 300),
          tween: Tween<double>(begin: 10.0, end: end),
          builder: (BuildContext context, double value, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.red,
                  height: value,
                  width: value,
                ),
                ElevatedButton(
                    onPressed: () {
                      end = 300;

                      setState(() {});
                    },
                    child: const Text('SetState'))
              ],
            );
          },
        ),
      ),
    );
  }
}
