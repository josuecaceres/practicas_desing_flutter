import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos/src/screens/screens.dart';
import 'package:disenos/src/retos/cuadadro_animado.dart';

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', const SlideShowScreen()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyScreen()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersScreen()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro animado', const CuadradoAnimadoScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de progreso', const GraficasCircularesScreen()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestScreen()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListScreen()),
  _Route(FontAwesomeIcons.starAndCrescent, 'Animate Do', const Pagina1Screen()),
];
