import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:designs/presentation/pages/widgets/botton_navigation_widget.dart';
import 'package:designs/presentation/pages/widgets/background_widget.dart';

class ThirdDesign extends StatelessWidget {
  const ThirdDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundWidget(),
          _Home(),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _HomeTitle(),
            _HomeBody(),
          ],
        ),
      ),
    );
  }
}

class _HomeTitle extends StatelessWidget {
  const _HomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Classify transaction',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            'Classify this transaction into a particular category',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      WrapItem(
        label: 'General',
        icon: Icons.window,
        color: Colors.blue,
      ),
      WrapItem(
        label: 'Transport',
        icon: Icons.toys,
        color: Colors.purple,
      ),
      WrapItem(
        label: 'Shopping',
        icon: Icons.shopping_bag,
        color: Colors.pink,
      ),
      WrapItem(
        label: 'Bills',
        icon: Icons.paid,
        color: Colors.orange,
      ),
      WrapItem(
        label: 'Entretentend',
        icon: Icons.movie,
        color: Colors.purple,
      ),
      WrapItem(
        label: 'Shopping',
        icon: Icons.car_repair,
        color: Colors.pink,
      ),
      WrapItem(
        label: 'Bills',
        icon: Icons.car_repair,
        color: Colors.orange,
      ),
      WrapItem(
        label: 'Bills',
        icon: Icons.car_repair,
        color: Colors.blue,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(15),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        alignment: WrapAlignment.center,
        //crossAxisAlignment: WrapCrossAlignment.center,
        children: items
            .map((item) => _ItemWidget(
                  icon: item.icon,
                  label: item.label,
                  color: item.color,
                ))
            .toList(),
      ),
    );
  }
}

class WrapItem {
  final String label;
  final IconData icon;
  final MaterialColor color;

  WrapItem({
    required this.label,
    required this.icon,
    required this.color,
  });
}

class _ItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final MaterialColor color;

  const _ItemWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //Evita que se propage el filtro de backdropFilter a más alto nivel
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        //Aplica para todos lo anterior
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: 160,
          height: 180,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.shade100,
                      color.shade800,
                    ],
                  ),
                ),
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                label,
                style:
                    Theme.of(context).textTheme.button?.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
