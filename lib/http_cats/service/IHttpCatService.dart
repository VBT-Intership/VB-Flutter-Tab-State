import 'package:s2l1/http_cats/model/task_model.dart';

import '../model/http_cat_model.dart';

abstract class IHttpCatService {
  Future<List<HttpCatModel>> getHttpList();
  Future<List<TaskModel>> getTaskList();
}
