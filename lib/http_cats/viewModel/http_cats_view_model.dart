import 'package:flutter/material.dart';
import 'package:s2l1/http_cats/model/http_cat_model.dart';
import 'package:s2l1/http_cats/service/IHttpCatService.dart';
import 'package:s2l1/http_cats/service/http_cat_service.dart';

import '../view/http_cats.dart';

abstract class HttpCatsViewModel extends State<HttpCats> {
  // Add your state and logic here
  bool isLoading = false;
  List<HttpCatModel> httpCats = [];

  IHttpCatService httpCatService;

  @override
  void initState() {
    super.initState();
    httpCatService = HttpCatService();
//    callItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callItems() async {
    changeLoading();
    await _getHttpCats();
    changeLoading();
    checkErrorList();
  }

  void checkErrorList() {
    if (httpCats.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text(".statusCode.toString()"),
        ),
      );
    }
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _getHttpCats() async {
    httpCats = await httpCatService.getHttpList();
  }
}
