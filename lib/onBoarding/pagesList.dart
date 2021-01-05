import 'package:flutter/cupertino.dart';
import 'package:saviour_app/util/styles.dart';

List<Widget> getPages(){
  return <Widget>[
    Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'images/onboarding1.png',
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Select a sample\nof leaf',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'Capture a picture of leaf from camera, or select an image of leaf from the gallery.',
            style: kSubtitleStyle,
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'images/onboarding0.png',
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Adjust the\nimage',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'Adjust the selected image in such a way that the leaf is clearly visible on the screen. And press confirm to proceed',
            style: kSubtitleStyle,
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'images/onboarding2.png',
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Get the\nresults',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'The test results of the selected image will be displayed with its corresponding accuracy',
            style: kSubtitleStyle,
          ),
        ],
      ),
    ),
  ];
}