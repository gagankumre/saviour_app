import 'dart:io';
import 'package:flutter/material.dart';
import 'package:saviour_app/util/customAppBar.dart';
import 'package:tflite/tflite.dart';

class Result extends StatefulWidget {

  final File imageFile;
  Result({@ required this.imageFile});

  @override
  _ResultState createState() => _ResultState(imageFile: imageFile);
}

class _ResultState extends State<Result> {
  final File imageFile;
  _ResultState({@required this.imageFile});

  String disease="loading";
  double accuracy=0.0;

  getResult() async {
    var recognitions = await Tflite.runModelOnImage(
        path: imageFile.path,   // required
        imageMean: 0.0,   // defaults to 117.0
        imageStd: 255.0,  // defaults to 1.0
        numResults: 2,    // defaults to 5
        threshold: 0.2,   // defaults to 0.1
        asynch: true      // defaults to true
    );
    setState(() {
      print(recognitions);
      if(recognitions.isNotEmpty){
        disease=recognitions[0]['label'];
        accuracy=recognitions[0]['confidence'];
      }else{
        disease='not detected';
      }
    });
    // await Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    // loadModel();
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    // timeDilation =1.3;
    return Scaffold(
      appBar: customAppBar(),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            SizedBox(height: MediaQuery.of(context).size.width*.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Hero(
                    tag: 'image-file',
                    child: Image.file(
                      widget.imageFile,
                      width: MediaQuery.of(context).size.width*.95,
                      height: MediaQuery.of(context).size.width*.95,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Text('disease - '+disease),
                Text('accuracy - '+accuracy.toString()),
              ],
            )
          ]
        ),
      ),
    );
  }
}

