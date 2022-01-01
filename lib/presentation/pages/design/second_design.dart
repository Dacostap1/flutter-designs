import 'package:flutter/material.dart';

class SecondDesign extends StatelessWidget {
  const SecondDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //const Placeholder(),
          const Background(),
          PageView(
            scrollDirection: Axis.vertical,
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
      color: const Color(0xff50C2DD),
      child: const Image(
        image: AssetImage('assets/images/image_background.png'),
      ), //Image.asset('assets/images/image_background.png'),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headline3?.copyWith(
          color: Colors.white,
        );

    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('11º', style: titleStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Miércoles', style: titleStyle),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 90,
            )
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[300],
      child: Center(
        child: TextButton(onPressed: () {}, child: const Text('Bienvenido')),
      ),
    );
  }
}
