import 'package:flutter/material.dart';

class ElementHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo_13_3'),
      ),
      body: CustomHomeWidget(),
    );
  }
}

class CustomHomeWidget extends Widget {
  @override
  Element createElement() {
    return HomeViewElement(this);
  }
}

class HomeViewElement extends ComponentElement {
  HomeViewElement(Widget widget) : super(widget);
  String text = "123456789";

  @override
  Widget build() {
    Color primary = Theme.of(this).primaryColor; //1
    return GestureDetector(
      child: Center(
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(color: primary),
          ),
          onPressed: () {
            var t = text.split("")..shuffle();
            text = t.join();
            markNeedsBuild(); //点击后将该Element标记为dirty，Element将会rebuild
          },
        ),
      ),
    );
  }
}
