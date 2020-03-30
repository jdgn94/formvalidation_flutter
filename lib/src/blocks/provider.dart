import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocks/login_block.dart';
export 'package:formvalidation/src/blocks/login_block.dart';

class Provider extends InheritedWidget {
  static Provider _instance;

  factory Provider ({ Key key, Widget child }) {
    if (_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }

    return _instance;
  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child);

  // todo el codigo que se encuentra en la parte superior se usa para mantener los datos tras un hot reload, solo funciona en dev
  // si no se quiere inplementar este codigo se hace de la siguiente manera
  /*
    final loginBlock = LoginBlock();

    Provider({ Key key, Widget child })
      : super(key: key, child: child);
  */
  
  final loginBlock = LoginBlock();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBlock of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBlock;
  }
}