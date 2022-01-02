import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: 1,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      selectedItemColor: Colors.pink,
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      items: const [
        BottomNavigationBarItem(
            label: 'Calendario', icon: Icon(Icons.calendar_today_outlined)),
        BottomNavigationBarItem(label: 'Gráfica', icon: Icon(Icons.bar_chart)),
        BottomNavigationBarItem(label: 'Usuarios', icon: Icon(Icons.person)),
      ],
    );
  }
}
