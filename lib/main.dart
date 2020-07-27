import 'package:flutter/material.dart';
import 'package:flutter_actual_combat/l10n/localization_intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/demo_12_2.dart';
import 'src/demo_12_3.dart';
import 'src/demo_12_6.dart';
import 'src/demo_13_1.dart';
import 'src/demo_13_2.dart';
import 'src/demo_13_3.dart';
import 'src/demo_14_2.dart';
import 'src/demo_14_3.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateTitle: (context) {
        // 此时context在Localizations的子树中
        return DemoLocalizations.of(context).title;
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate(),
        IntlDemoLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CN'),
      ],
      locale: const Locale('en', 'US'),
      localeResolutionCallback: functionLocale,
      localeListResolutionCallback: functionLocaleList,
    );
  }

  Locale functionLocale(Locale locale, Iterable<Locale> supportedLocales) {
    return locale;
  }

  Locale functionLocaleList(
      List<Locale> locales, Iterable<Locale> supportedLocales) {
    return locales[0];
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title});
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('12.2 插件开发：平台通道简介'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DefalutPlatformRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('12.3 开发Flutter插件'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return BatteryRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('12.4 插件开发：Android端API实现'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return BatteryRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('12.5 插件开发：iOS端API实现'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return BatteryRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('12.6 Texture和PlatformView'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CameraRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('13.1 让App支持多语言'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return LocaleHomeRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('13.2 实现Localizations'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DemoLocalizationsHomeRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('13.3使用Intl包'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return IntlHomeRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('13.4 国际化常见问题'), //未添加代码
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return IntlHomeRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('14.1 Flutter UI系统'), //未添加代码
            onTap: null,
          ),
          ListTile(
            title: Text('14.2 Element与BuildContext'), //未添加代码
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ElementHomeRoute();
              }),
            ),
          ),
          ListTile(
            title: Text('14.3 RenderObject和RenderBox'), //未添加代码
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return RenderObjectRoute();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
