import 'package:s2l1/http_cats/model/base_model.dart';

class ErrorModel extends BaseModel {
  final String text;

  ErrorModel(this.text);

  @override
  fromJson(Map<String, Object> json) {}

  @override
  Map<String, Object> toJson() {}
}
