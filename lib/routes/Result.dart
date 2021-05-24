import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saviour_app/util/customAppBar.dart';
import 'package:saviour_app/util/gradientBoxDecoration.dart';
import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';

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

  _launchURLGoogle() async {
    var url ='https://www.google.com/search?q='+disease;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        accuracy*=100;
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
        child: Container(
          decoration: gradientBoxDecoration(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Hero(
                      tag: 'image-file',
                      child: Image.file(
                        widget.imageFile,
                        width: MediaQuery.of(context).size.width*.80,
                        height: MediaQuery.of(context).size.width*.80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(
                children: [
                  Text('Disease - '+disease,style: TextStyle(
                    fontSize: 25
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  Text('Accuracy - '+accuracy.toStringAsFixed(5)+' %',style: TextStyle(
                      fontSize: 20
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.04),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _launchURLGoogle();
                          });
                          // print('clicked');
                        },
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Click here to read more about ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white, fontSize: 25,fontWeight: FontWeight.w800,),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                                    Text(disease,style: TextStyle(
                                      color: Colors.white,
                                        fontSize: 20
                                    ),),
                                  ]
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}

