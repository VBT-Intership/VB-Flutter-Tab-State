import 'package:s2l1/http_cats/model/base_model.dart';

class HttpCatModel extends BaseModel<HttpCatModel> {
  String description;
  String imageUrl;
  int statusCode;

  HttpCatModel({this.description, this.imageUrl, this.statusCode});

  HttpCatModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    imageUrl = json['imageUrl'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['statusCode'] = this.statusCode;
    return data;
  }

  @override
  HttpCatModel fromJson(Map<String, Object> json) {
    return HttpCatModel.fromJson(json);
  }
}
