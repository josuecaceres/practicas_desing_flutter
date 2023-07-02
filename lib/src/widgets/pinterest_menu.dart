import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    required this.onPressed,
    required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  const PinterestMenu(
      {super.key,
      this.mostrar = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.redAccent,
      this.inactiveColor = Colors.blueGrey,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuItem(index, menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuItem extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final mModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        item.onPressed();
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (mModel.itemSelected == index) ? 35 : 25,
        color: (mModel.itemSelected == index) ? mModel.activeColor : mModel.inactiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.redAccent;
  Color inactiveColor = Colors.blueGrey;

  int get itemSelected => _itemSelected;
  set itemSelected(int index) {
    _itemSelected = index;
    notifyListeners();
  }
}
