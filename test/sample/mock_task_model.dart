import 'package:s2l1/http_cats/model/http_cat_model.dart';
import 'package:s2l1/http_cats/model/task_model.dart';
import 'package:s2l1/http_cats/service/IHttpCatService.dart';

class MockHttpCatService extends IHttpCatService {
  @override
  Future<List<HttpCatModel>> getHttpList() {}

  @override
  Future<List<TaskModel>> getTaskList() {
    // TODO: implement getTaskList
    throw UnimplementedError();
  }
}
