import 'package:flutter/material.dart';

import 'package:designs/presentation/pages/main_list.dart';
import 'package:designs/presentation/pages/list_designs.dart';
import 'package:designs/presentation/pages/list_animations.dart';
import 'package:designs/presentation/pages/design/first_design.dart';
import 'package:designs/presentation/pages/design/second_design.dart';
import 'package:designs/presentation/pages/design/third_page.dart';
import 'package:designs/presentation/pages/animations/implicits/animated_foo.dart';
import 'package:designs/presentation/pages/animations/implicits/tween_animation.dart';
import 'package:designs/presentation/pages/animations/explicits/foo_transition.dart';
import 'package:designs/presentation/pages/animations/explicits/foo_transition_scale.dart';
import 'package:designs/presentation/pages/animations/explicits/animated_widget.dart';
import 'package:designs/presentation/pages/animations/explicits/animated_widget_two_animations.dart';
import 'package:designs/presentation/pages/animations/explicits/animated_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.blue),
        textTheme: const TextTheme(
          button: TextStyle(color: Colors.blue),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            primary: Colors.white,
            fixedSize: const Size(150, 40),
            shape: const StadiumBorder(),
          ),
        ),
      ),
      initialRoute: 'main-page',
      routes: {
        'main-page': (_) => const MainPage(),
        'designs-page': (_) => const DesignsPage(),
        'animations-page': (_) => const AnimationsPage(),
        'first-design': (_) => const FirstDesign(),
        'second-design': (_) => const SecondDesign(),
        'third-design': (_) => const ThirdDesign(),
        'animated-foo': (_) => const AnimatedFoo(),
        'tween-animation': (_) => const TweenAnimationPage(),
        'foo-transition': (_) => const FooTransitionPage(),
        'foo-transition-scale': (_) => const FooTransitionScalePage(),
        'animated-widget': (_) => const AnimatedWidgetPage(),
        'animated-widget-two-tweens': (_) =>
            const AnimatedWidgetTwoTweensPage(),
        'animated-builder': (_) => const AnimatedBuilderPage(),
      },
    );
  }
}
