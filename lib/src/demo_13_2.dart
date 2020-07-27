import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DemoLocalizations {
  DemoLocalizations(this.isZh);
  //是否为中文
  bool isZh = false;
  //为了使用方便，我们定义一个静态方法
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  //Locale相关值，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

// Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("$locale");
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(locale.languageCode == "zh"));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }
}

class DemoLocalizationsHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo_13_1'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text(DemoLocalizations.of(context).title),
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
