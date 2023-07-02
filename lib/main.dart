import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/screens/screens.dart';
import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/models/layaout_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
        ChangeNotifierProvider<LayaoutModel>(create: (_) => LayaoutModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (context, orientation) {
          //print('Orientacion: $orientation');
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return const LouncherTabletScreen();
          } else {
            return const LouncherScreen();
          }
        },
      ),
    );
  }
}
