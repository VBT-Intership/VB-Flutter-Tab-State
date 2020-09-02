import 'package:flutter/material.dart';
import 'package:s2l1/http_cats/model/error_model.dart';
import 'package:s2l1/http_cats/model/http_cat_model.dart';
import 'package:s2l1/http_cats/model/task_model.dart';
import '../viewModel/http_cats_view_model.dart';

class HttpCatsView extends HttpCatsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder<List<TaskModel>>(
        future: httpCatService.getTaskList(),
        builder: (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data[index].title),
                    trailing: Icon(Icons.check, color: snapshot.data[index].completed ? Colors.green : Colors.grey),
                    subtitle: Text(snapshot.data[index].userId.toString()),
                  ),
                );
              } else {
                final error = snapshot.error as ErrorModel;
                return Center(
                  child: Text(error.text),
                );
              }

              break;
            default:
              return Text("Something went wrong");
          }
        },
      ),
    );
  }

  FutureBuilder<List<HttpCatModel>> buildFutureBuilder() {
    return FutureBuilder<List<HttpCatModel>>(
      future: httpCatService.getHttpList(),
      builder: (BuildContext context, AsyncSnapshot<List<HttpCatModel>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return buildListViewHttp2(snapshot.data);
            } else {
              final error = snapshot.error as ErrorModel;
              return Center(
                child: Text(error.text),
              );
            }

            break;
          default:
            return Text("Something went wrong");
        }
      },
    );
  }

  ListView buildListViewHttp() {
    return ListView.builder(
      itemCount: httpCats.length,
      itemBuilder: (context, index) => buildCardHttp(httpCats[index]),
    );
  }

  ListView buildListViewHttp2(List<HttpCatModel> cats) {
    return ListView.builder(
      itemCount: cats.length,
      itemBuilder: (context, index) => buildCardHttp(cats[index]),
    );
  }

  Card buildCardHttp(HttpCatModel cat) {
    return Card(
      margin: EdgeInsets.all(20),
      child: ListTile(
        title: SizedBox(height: MediaQuery.of(context).size.height * 0.2, child: Image.network(cat.imageUrl)),
        subtitle: Text(cat.description),
        trailing: Text(cat.statusCode.toString()),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: buildTextAppBar(),
      leading: buildPaddingProgress,
    );
  }

  Widget get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Text buildTextAppBar() => Text("Http Cat View");
}
