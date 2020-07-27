import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DefalutPlatformRoute extends StatelessWidget {
  void defalutPlatform(context) {
    String value = 'defaultTargetPlatform:$defaultTargetPlatform';
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      value = 'defaultTargetPlatform:iOS';
    }
    //else cont.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('平台信息'),
          content: Text(value),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('确定'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FlatButton(
              child: Text('平台信息'),
              color: Colors.grey[300],
              onPressed: () {
                defalutPlatform(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
