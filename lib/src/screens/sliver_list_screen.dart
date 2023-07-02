import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/theme/theme.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList(),
          ),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll();

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
    ];

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomDelegateHeader(
            minheight: 180,
            maxheight: 250,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: const _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...items,
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverCustomDelegateHeader extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomDelegateHeader({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomDelegateHeader oldDelegate) {
    return maxheight != oldDelegate.maxheight || minheight != oldDelegate.minheight || child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : const Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                color: Color(0xffD93A30),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String texto;
  final Color fondo;

  const _ListItem(this.texto, this.fondo);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(30),
      height: 130,
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : fondo,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xffED6762),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
            ),
          ),
        ),
        child: SizedBox(
          height: 100,
          width: size.width * 0.8,
          child: const Center(
            child: Text(
              'CREATE NEW LIST',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
