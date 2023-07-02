import 'package:flutter/material.dart';

class CuadradoAnimadoScreen extends StatelessWidget {
  const CuadradoAnimadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado();

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> derecha;
  late Animation<double> arriba;
  late Animation<double> izquierda;
  late Animation<double> abajo;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500));
    derecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.25, curve: Curves.bounceOut),
    ));

    arriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.25, 0.50, curve: Curves.bounceOut),
    ));

    izquierda = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.50, 0.75, curve: Curves.bounceOut),
    ));

    abajo = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.75, 1.0, curve: Curves.bounceOut),
    ));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: const _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(derecha.value - izquierda.value, arriba.value - abajo.value),
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.cyan,
      ),
    );
  }
}
