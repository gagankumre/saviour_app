import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saviour_app/util/gradientBoxDecoration.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackContainer extends StatefulWidget {
  @override
  _FeedbackContainerState createState() => _FeedbackContainerState();
}

class _FeedbackContainerState extends State<FeedbackContainer> {

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  String name="";
  String plantName="";
  String message="";

  _launchURLMail() async {
    var url =
        'mailto:bothard12345@gmail.com?subject=Request for Addition of data set&body=Plant name - '+plantName+'\n'+message+'\n Regards\n'+name;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          decoration: gradientBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 13),
                  child: Text(
                    "Leave us a message, and we'll resolve your query as soon as possible. ",
                    style: TextStyle(
                      fontSize: 17.5,
                      height: 1.3,
                      fontFamily: 'RobotoSlab',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (val) {
                      if (val != null || val.length > 0) name = val;
                    },
                    controller: t1,
                    decoration: InputDecoration(
                      fillColor: Color(0xffe6e6e6),
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      hintText: 'Your name',
                      hintStyle: TextStyle(
                          color: Colors.blueGrey, fontFamily: 'RobotoSlab'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (val) {
                      if (val != null || val.length > 0) plantName = val;
                    },
                    controller: t2,
                    decoration: InputDecoration(
                      fillColor: Color(0xffe6e6e6),
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      hintText: 'Name of the plant',
                      hintStyle: TextStyle(
                          color: Colors.blueGrey, fontFamily: 'RobotoSlab'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (val) {
                      if (val != null || val.length > 0) message = val;
                    },
                    textAlign: TextAlign.start,
                    controller: t3,
                    decoration: InputDecoration(
                      fillColor: Color(0xffe6e6e6),
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                      hintText: 'Your message',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'RobotoSlab',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(name!=null&&plantName!=null&&name.length>0&&plantName.length>0){
                          _launchURLMail();
                          t1.clear();
                          t2.clear();
                          t3.clear();
                          name="";
                          plantName="";
                          message="";
                        }else{
                          print('err');
                          Fluttertoast.showToast(
                              msg: "'Name' or 'Plant name' can't be empty",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIos: 1,
                          );
                        }
                      });
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Center(
                              child: Text(
                                "Send",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'RobotoSlab'),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
              ],
            ),
          ),
        ),
      );
  }
}