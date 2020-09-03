import 'package:flutter/material.dart';

abstract class BaseModel<T> {
  String name;
  BuildContext context;
  void init(BuildContext context);
  void initName(String name);
  T fromJson(Map json);
}

class Veli extends BaseModel<Veli> {
  static const Veli2 = "A";
  init(BuildContext context) {
    this.context = context;
  }

  void initName(String name) {
    this.name = name;
  }

  Veli fromJson(Map json) => Veli();
}

class ApplicationConstats {
  static ApplicationConstats _instance;
  static ApplicationConstats get instance {
    if (_instance == null) _instance = ApplicationConstats._init();
    return _instance;
  }

  ApplicationConstats._init();

  String value = "";
}

class SampleStatless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Container(color: Colors.red),
        ),
        Container(color: Colors.red),
        BaseRow(child: []),
        BaseRow(),
      ],
    );
  }
}

class BaseRow extends StatelessWidget {
  const BaseRow({
    Key key,
    this.child,
  }) : super(key: key);

  final List<Widget> child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 5,
        ),
        Expanded(
            flex: 90,
            child: Column(
              children: child,
            )),
        Spacer(
          flex: 5,
        ),
      ],
    );
  }
}
