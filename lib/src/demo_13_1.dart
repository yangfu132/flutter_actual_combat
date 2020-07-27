import 'package:flutter/material.dart';

class LocaleHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo_13_1'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text(MaterialLocalizations.of(context).backButtonTooltip),
            onPressed: () {
              Locale myLocale = Localizations.localeOf(context);
              print('currentLocale：$myLocale');
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Locale信息'),
                    content: Text('当前Locale：$myLocale'),
                    actions: [
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('确定'),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
