import 'package:flutter/material.dart';
import 'package:s2l1/http_cats/model/http_cat_model.dart';
import '../viewModel/http_cats_view_model.dart';

class HttpCatsView extends HttpCatsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView.builder(
        itemCount: httpCats.length,
        itemBuilder: (context, index) => buildCardHttp(httpCats[index]),
      ),
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
