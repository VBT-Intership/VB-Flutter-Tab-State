import 'package:flutter/material.dart';
import './sample_view_view_model.dart';

class SampleViewView extends SampleViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildColumn(),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [
        Container(height: context.height * 0.3, child: Image.network("https://picsum.photos/200")),
        buildTextTitle(),
        buildSizedBoxSpace(),
        buildTextFieldUserName(),
        SizedBox(height: 10),
        buildTextFieldUserName(),
        buildSizedBoxSpace(),
        buildOutlineButtonLogin
      ],
    );
  }

  Widget buildColumn() {
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 10, child: buildContainerImageLogin()),
              Spacer(flex: 3),
              Expanded(flex: 3, child: buildTextTitle()),
              buildTextFieldUserName(),
              Spacer(),
              buildTextFieldUserName(),
              Spacer(flex: 3),
              buildOutlineButtonLogin,
              Spacer(flex: 3),
              buildOutlineButtonLogin,
              buildOutlineButtonLogin,
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget buildContainerImageLogin() => SizedBox.expand(
        child: Image.network(
          "https://picsum.photos/500",
          fit: BoxFit.cover,
        ),
      );

  OutlineButton get buildOutlineButtonLogin {
    return OutlineButton(
      onPressed: () {},
      child: Text("data"),
    );
  }

  TextField buildTextFieldUserName() =>
      TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Hello"));

  SizedBox buildSizedBoxSpace() => SizedBox(height: 50);

  Widget buildTextTitle() => FittedBox(
        fit: BoxFit.fitHeight,
        child: Text("Hello", style: context.theme.textTheme.headline2, textScaleFactor: 0.5),
      );
}

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);
}
