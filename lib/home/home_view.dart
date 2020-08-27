import 'package:flutter/material.dart';
import 'package:s2l1/home/radius_image.dart';
import 'package:s2l1/home/second_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: RadiusImage(imageUrl: "https://picsum.photos/200")),
            Expanded(child: buildDefaultTabController()),
          ],
        ),
      ),
    );
  }

  DefaultTabController buildDefaultTabController() => DefaultTabController(length: 2, child: buildScaffoldBackground());

  Scaffold buildScaffoldBackground() {
    return Scaffold(
      body: buildTabBarView(),
      bottomNavigationBar: buildBottomAppBar1(),
      floatingActionButton: buildFloatingActionButtonCenter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(children: [
      Container(color: Colors.red),
      Container(color: Colors.blue),
    ]);
  }

  BottomAppBar buildBottomAppBar1() {
    return BottomAppBar(
      notchMargin: 10,
      shape: CircularNotchedRectangle(),
      child: TabBar(
          unselectedLabelColor: Colors.black26,
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [Tab(icon: Icon(Icons.ac_unit)), Tab(icon: Icon(Icons.ac_unit))]),
    );
  }

  FloatingActionButton buildFloatingActionButtonCenter() {
    return FloatingActionButton(
      heroTag: "A",
      onPressed: () {
        secondViewNavigator();
      },
    );
  }

  Row buildRowButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(flex: 9),
        buildFloatingActionButton2(),
        Spacer(flex: 1),
        buildFloatingActionButton1(),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton2() {
    return FloatingActionButton(
        heroTag: "A",
        child: Icon(Icons.chevron_right),
        onPressed: () {
          secondViewNavigator();
        });
  }

  FloatingActionButton buildFloatingActionButton1() {
    return FloatingActionButton(
        heroTag: 2,
        child: Icon(Icons.arrow_left),
        onPressed: () {
          secondViewNavigator();
        });
  }

  void secondViewNavigator() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondView(),
        ));
  }
}
