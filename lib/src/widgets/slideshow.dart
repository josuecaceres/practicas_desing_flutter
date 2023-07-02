import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color bulletActive;
  final Color bulletInactive;
  final double sizeActive;
  final double sizeInactive;

  const SlideShow({
    super.key,
    required this.slides,
    this.puntosArriba = false,
    this.bulletActive = Colors.blue,
    this.bulletInactive = Colors.grey,
    this.sizeActive = 16,
    this.sizeInactive = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlidershowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlidershowModel>(context).colorActive = bulletActive;
              Provider.of<_SlidershowModel>(context).colorInactive = bulletInactive;
              Provider.of<_SlidershowModel>(context).sizeActive = sizeActive;
              Provider.of<_SlidershowModel>(context).sizeInactive = sizeInactive;
              return Column(
                children: <Widget>[
                  if (puntosArriba) _Dots(slides.length),
                  Expanded(
                    child: _Slides(slides),
                  ),
                  if (!puntosArriba) _Dots(slides.length),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      final sliderProvider = Provider.of<_SlidershowModel>(context, listen: false);
      sliderProvider.currentPage = pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalSlides,
          (index) => _Dot(index),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slidershowModel = Provider.of<_SlidershowModel>(context);
    double bulletZise;
    Color color;

    if (slidershowModel.currentPage >= index - 0.5 && slidershowModel.currentPage < index + 0.5) {
      bulletZise = slidershowModel.sizeActive;
      color = slidershowModel.colorActive;
    } else {
      bulletZise = slidershowModel.sizeInactive;
      color = slidershowModel.colorInactive;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: bulletZise,
      height: bulletZise,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlidershowModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _colorActive = Colors.blue;
  Color _colorInactive = Colors.grey;
  double _sizeActive = 12;
  double _sizeInactive = 12;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get colorActive => _colorActive;
  set colorActive(Color color) {
    _colorActive = color;
  }

  Color get colorInactive => _colorInactive;
  set colorInactive(Color color) {
    _colorInactive = color;
  }

  double get sizeActive => _sizeActive;
  set sizeActive(double valor) {
    _sizeActive = valor;
  }

  double get sizeInactive => _sizeInactive;
  set sizeInactive(double valor) {
    _sizeInactive = valor;
  }
}
