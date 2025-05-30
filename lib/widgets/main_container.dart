import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget child;

  const MainContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 155, 218, 84),
            Colors.white,
          ],
          stops: [0.4, 0.4],
        ),
      ),
      child: child,
    );
  }
}
