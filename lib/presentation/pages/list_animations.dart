import 'package:flutter/material.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  final _items = [
    //Implicits
    Item(title: 'AnimatedFoo', route: 'animated-foo'),
    Item(title: 'Tween Animation', route: 'tween-animation'),

    //Explicits
    Item(title: 'FooTransition(Basic)', route: 'foo-transition'),
    Item(title: 'FooTransition(use Scale)', route: 'foo-transition-scale'),
    Item(title: 'AnimatedWidget', route: 'animated-widget'),
    Item(
        title: 'AnimatedWidget with two Tweens',
        route: 'animated-widget-two-tweens'),
    Item(title: 'AnimatedBuilder', route: 'animated-builder')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis animaciones'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) => ItemWidget(
          item: _items[index],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      onTap: () => Navigator.pushNamed(context, item.route),
      leading: const Icon(Icons.check_circle),
      trailing: const Icon(Icons.navigate_next_outlined),
    );
  }
}

class Item {
  final String title;
  final String route;

  Item({
    required this.title,
    required this.route,
  });
}
