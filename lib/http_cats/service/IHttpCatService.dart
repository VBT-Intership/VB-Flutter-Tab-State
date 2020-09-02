import 'package:s2l1/http_cats/model/task_model.dart';

abstract class IHttpCatService {
  Future<dynamic> getHttpList();

  Future<List<TaskModel>> getTaskList();
}
