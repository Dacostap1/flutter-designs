import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class FirstDesign extends StatelessWidget {
  const FirstDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Placeholder(fallbackHeight: 350),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                PlaceInfo(),
                PlaceActions(),
                PlaceDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceInfo extends StatelessWidget {
  const PlaceInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3),
              Text('Kandersteg, Switzerland'),
            ],
          ),
          Theme(
            data: ThemeData(
              primarySwatch: Colors.pink,
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star),
              label: const Text('41'),
            ),
          )
        ],
      ),
    );
  }
}

class PlaceActions extends StatelessWidget {
  const PlaceActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ButtonAction(text: 'call', icon: Icon(Icons.call)),
          ButtonAction(text: 'route', icon: Icon(Icons.near_me)),
          ButtonAction(text: 'share', icon: Icon(Icons.share)),
        ],
      ),
    );
  }
}

class PlaceDescription extends StatelessWidget {
  const PlaceDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(faker.lorem.sentences(12).join('')),
    );
  }
}

class ButtonAction extends StatelessWidget {
  final String text;
  final Icon icon;

  const ButtonAction({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: () {}, icon: icon),
        Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
      ],
    );
  }
}
