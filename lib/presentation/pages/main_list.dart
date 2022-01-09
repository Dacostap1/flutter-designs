import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _items = [
    Item(title: 'Diseños', route: 'designs-page'),
    Item(title: 'Animaciones', route: 'animations-page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daniel Acosta'),
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
