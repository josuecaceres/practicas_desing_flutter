import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:disenos/src/widgets/slideshow.dart';
import 'package:disenos/src/theme/theme.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final childrem = [
      const Expanded(child: MySlideShow()),
      const Expanded(child: MySlideShow()),
    ];

    return Scaffold(
        body: (isLarge)
            ? Column(
                children: childrem,
              )
            : Row(
                children: childrem,
              ));
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return SlideShow(
      //puntosArriba: true,
      bulletActive: (appTheme.darkTheme) ? accentColor : const Color(0xffFF5A7E),
      //bulletInactive: Colors.black45,
      sizeActive: 16,
      sizeInactive: 8,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
