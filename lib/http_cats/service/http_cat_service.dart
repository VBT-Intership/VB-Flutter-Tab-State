import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:s2l1/http_cats/model/base_model.dart';
import 'package:s2l1/http_cats/model/error_model.dart';
import 'package:s2l1/http_cats/model/task_model.dart';

import '../model/http_cat_model.dart';
import 'IHttpCatService.dart';

class HttpCatService extends IHttpCatService {
  final baseUrl = "https://hwasampleapi.firebaseio.com";
  final baseUrl2 = "https://jsonplaceholder.typicode.com";

  @override
  Future<dynamic> getHttpList() async {
    dynamic fetchedData = await _httpGet<BaseModel>(
        "$baseUrl/http/0/statusCode.json", HttpCatModel());
    if (fetchedData is List)
      return fetchedData.cast<HttpCatModel>().toList();
    else
      return fetchedData;
  }

  @override
  Future<List<TaskModel>> getTaskList() async {
    return await _httpGet<TaskModel>("$baseUrl2/user", TaskModel());
  }

  Future<dynamic> _httpGet<T extends BaseModel>(String path, T model) async {
    try {
      final response = await http.get(path);
      if (response is http.Response) {
        switch (response.statusCode) {
          case HttpStatus.ok:
            return _bodyParser<T>(response.body, model);
            break;
          default:
            throw ErrorModel(response.body);
        }
      }
    } catch (e) {
      return ErrorModel("VB <3");
    }
  }

  dynamic _bodyParser<T extends BaseModel>(String body, BaseModel model) {
    final jsonBody = jsonDecode(body);
    if (jsonBody is List) {
      return jsonBody.map((e) => model.fromJson(e)).cast<T>().toList();
    } else if (jsonBody is Map) {
      return model.fromJson(jsonBody);
    } else {
      return jsonBody;
    }
  }
}
