import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/widgets/radial_progress.dart';

class GraficasCircularesScreen extends StatefulWidget {
  const GraficasCircularesScreen({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesScreen> createState() => _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.green,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.2,
                color: Colors.redAccent,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje * 1.4,
                color: Colors.orange,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.6,
                color: Colors.cyan,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) porcentaje = 0;
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({super.key, required this.porcentaje, required this.color});

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.textTheme.bodyLarge?.color ?? Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 4,
      ),
    );
  }
}
