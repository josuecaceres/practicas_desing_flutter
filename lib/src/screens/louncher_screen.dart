import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/routes/route.dart';

class LouncherScreen extends StatelessWidget {
  const LouncherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños - Portrail'),
        backgroundColor: appTheme.colorScheme.secondary,
      ),
      drawer: const _MenuPrincipal(),
      body: const _ListaOpts(),
    );
  }
}

class _ListaOpts extends StatelessWidget {
  const _ListaOpts();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) {
                return pageRoutes[index].page;
              },
            ),
          );
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context);
    final accentColor = apptheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 200,
            child: SafeArea(
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text(
                  'EJC',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(
            child: _ListaOpts(),
          ),
          ListTile(
            leading: Icon(
              Icons.lightbulb_circle_outlined,
              color: accentColor,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              activeColor: accentColor,
              value: apptheme.darkTheme,
              onChanged: (value) => apptheme.darkTheme = value,
            ),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon(Icons.add_to_home_screen, color: accentColor),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: apptheme.customTheme,
                onChanged: (value) => apptheme.customTheme = value,
              ),
            ),
          )
        ],
      ),
    );
  }
}
