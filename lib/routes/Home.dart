import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:saviour_app/container/checkForDisease.dart';
import 'package:saviour_app/container/feedbackContainer.dart';
import 'package:saviour_app/util/customAppBar.dart';
import 'package:tflite/tflite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedPos = 0;
  double bottomNavBarHeight = 65.0;
  CircularBottomNavigationController _navigationController;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.image_search_outlined, "Check for disease", Colors.cyan, labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(Icons.feedback_outlined, "Feedback", Colors.red, labelStyle: TextStyle(fontWeight: FontWeight.bold)),
  ]);

  loadModel() async{
    await Tflite.loadModel(
        model: "res/plant_disease_model_3.tflite",
        labels: "res/disease_label.txt",
        numThreads: 1, // defaults to 1
        isAsset: true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
  }

  @override
  void initState() {
    super.initState();
    loadModel();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(),
      body: Stack(
        children: <Widget>[
          Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight,top: 100),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    if(selectedPos==0){
      return CheckForDisease();
    }else{
      return FeedbackContainer();
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.orange,
      normalIconColor: Colors.grey[100],
      selectedIconColor: Colors.black,
      circleStrokeWidth: 5.0,
      animationDuration: Duration(milliseconds: 500),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

}
