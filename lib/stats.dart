import 'package:flutter/material.dart';
import './main.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    myBanner2
      ..load()
      ..show(
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );

    return new Scaffold(
      backgroundColor: Colors.blueGrey[900],
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: new AppBar(
        title: new Text("Statistics",
        ),
        backgroundColor: Colors.blueGrey,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('products').snapshots(),
    builder: (context, snapshot) {
      var UKF = int.parse(snapshot.data.documents[12]['UKF'][0] +
          snapshot.data.documents[12]['UKF'][2] +
          snapshot.data.documents[12]['UKF'][3] +
          snapshot.data.documents[12]['UKF'][4]);
      var UHR = int.parse(snapshot.data.documents[10]['UHR'][0] +
          snapshot.data.documents[10]['UHR'][2] +
          snapshot.data.documents[10]['UHR'][3] +
          snapshot.data.documents[10]['UHR'][4]);
      var UIB = int.parse(snapshot.data.documents[11]['UIB'][0] +
          snapshot.data.documents[11]['UIB'][2] +
          snapshot.data.documents[11]['UIB'][3] +
          snapshot.data.documents[11]['UIB'][4]);
      var USK = int.parse(snapshot.data.documents[14]['USK'][0] +
          snapshot.data.documents[14]['USK'][2] +
          snapshot.data.documents[14]['USK'][3] +
          snapshot.data.documents[14]['USK'][4]);
      var UYC = int.parse(snapshot.data.documents[15]['UYC'][0] +
          snapshot.data.documents[15]['UYC'][2] +
          snapshot.data.documents[15]['UYC'][3] +
          snapshot.data.documents[15]['UYC'][4]);

      var UEC = [UKF, UHR, UIB, USK, UYC];
      var UEChigh = UEC[0];
      var UECsmall = UEC[0];
      for (var i = 0; i < UEC.length; i++) {
        if (UEC[i] > UEChigh) {
          UEChigh = UEC[i];
        }
        if (UEC[i] < UECsmall) {
          UECsmall = UEC[i];
        }
      }
      var WAN = int.parse(snapshot.data.documents[17]['WAN'][0] +
          snapshot.data.documents[17]['WAN'][2] +
          snapshot.data.documents[17]['WAN'][3] +
          snapshot.data.documents[17]['WAN'][4]);
      var WYCQ = int.parse(snapshot.data.documents[22]['WYCQ'][0] +
          snapshot.data.documents[22]['WYCQ'][2] +
          snapshot.data.documents[22]['WYCQ'][3] +
          snapshot.data.documents[22]['WYCQ'][4]);
      var WLMQ = int.parse(snapshot.data.documents[19]['WLMQ'][0] +
          snapshot.data.documents[19]['WLMQ'][2] +
          snapshot.data.documents[19]['WLMQ'][3] +
          snapshot.data.documents[19]['WLMQ'][4]);
      var WSDQ = int.parse(snapshot.data.documents[20]['WSDQ'][0] +
          snapshot.data.documents[20]['WSDQ'][2] +
          snapshot.data.documents[20]['WSDQ'][3] +
          snapshot.data.documents[20]['WSDQ'][4]);

      var WSC = [WAN, WYCQ, WLMQ, WSDQ];
      var WSChigh = WSC[0];
      var WSCsmall = WSC[0];
      for (var i = 0; i < WSC.length; i++) {
        if (WSC[i] > WSChigh) {
          WSChigh = WSC[i];
        }
        if (WSC[i] < WSCsmall) {
          WSCsmall = WSC[i];
        }
      }
      var UGJQ = int.parse(snapshot.data.documents[9]['UGJQ'][0] +
          snapshot.data.documents[9]['UGJQ'][2] +
          snapshot.data.documents[9]['UGJQ'][3] +
          snapshot.data.documents[9]['UGJQ'][4]);
      var USDQ = int.parse(snapshot.data.documents[13]['USDQ'][0] +
          snapshot.data.documents[13]['USDQ'][2] +
          snapshot.data.documents[13]['USDQ'][3] +
          snapshot.data.documents[13]['USDQ'][4]);
      var UYCQ = int.parse(snapshot.data.documents[16]['UYCQ'][0] +
          snapshot.data.documents[16]['UYCQ'][2] +
          snapshot.data.documents[16]['UYCQ'][3] +
          snapshot.data.documents[16]['UYCQ'][4]);
      var USC = [UGJQ, USDQ, UYCQ];
      var USChigh = USC[0];
      var USCsmall = USC[0];
      for (var i = 0; i < USC.length; i++) {
        if (USC[i] > USChigh) {
          USChigh = USC[i];
        }
        if (USC[i] < USCsmall) {
          USCsmall = USC[i];
        }
      }
      var LU = int.parse(snapshot.data.documents[2]['LU'][0] +
          snapshot.data.documents[2]['LU'][2] +
          snapshot.data.documents[2]['LU'][3] +
          snapshot.data.documents[2]['LU'][4]);
      var LW = int.parse(snapshot.data.documents[3]['LW'][0] +
          snapshot.data.documents[3]['LW'][2] +
          snapshot.data.documents[3]['LW'][3] +
          snapshot.data.documents[3]['LW'][4]);
      var LC = [LW, LU];
      var LChigh = LC[0];
      var LCsmall = LC[0];
      for (var i = 0; i < LC.length; i++) {
        if (LC[i] > LChigh) {
          LChigh = LC[i];
        }
        if (LC[i] < LCsmall) {
          LCsmall = LC[i];
        }
      }
      var WWSS = int.parse(snapshot.data.documents[21]['WWSS'][0] +
          snapshot.data.documents[21]['WWSS'][2] +
          snapshot.data.documents[21]['WWSS'][3] +
          snapshot.data.documents[21]['WWSS'][4]);
      var WHGS = int.parse(snapshot.data.documents[18]['WHGS'][0] +
          snapshot.data.documents[18]['WHGS'][2] +
          snapshot.data.documents[18]['WHGS'][3] +
          snapshot.data.documents[18]['WHGS'][4]);
      var SE = [WWSS, WHGS];
      var SEhigh = SE[0];
      var SEsmall = SE[0];
      for (var i = 0; i < SE.length; i++) {
        if (SE[i] > SEhigh) {
          SEhigh = SE[i];
        }
        if (SE[i] < SEsmall) {
          SEsmall = SE[i];
        }
      }
      var GMBS = int.parse(snapshot.data.documents[1]['GMBS'][0] +
          snapshot.data.documents[1]['GMBS'][2] +
          snapshot.data.documents[1]['GMBS'][3] +
          snapshot.data.documents[1]['GMBS'][4]);
      var GMBG = int.parse(snapshot.data.documents[0]['GMBG'][0] +
          snapshot.data.documents[0]['GMBG'][2] +
          snapshot.data.documents[0]['GMBG'][3] +
          snapshot.data.documents[0]['GMBG'][4]);
      var GMB = [GMBS, GMBG];
      var GMBhigh = GMB[0];
      var GMBsmall = GMB[0];
      for (var i = 0; i < GMB.length; i++) {
        if (GMB[i] > GMBhigh) {
          GMBhigh = GMB[i];
        }
        if (GMB[i] < GMBsmall) {
          GMBsmall = GMB[i];
        }
      }
      void _uecstats() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: new Text('Unwashed Export Coffee', style: TextStyle(
                  color: Colors.white,
                  )),
              content:
              new Text("Highest price: " + UEChigh.toString() + " ETB\n\n"
                       "Lowest price: " + UECsmall.toString() + " ETB", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17)),
            );
          },
        );
      }
      void _wscstats() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: new Text('Washed Specialty Coffee', style: TextStyle(
                color: Colors.white,
              )),
              content:
              new Text("Highest price: " + WSChigh.toString() + " ETB\n\n"
                  "Lowest price: " + WSCsmall.toString() + " ETB", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17)),
            );
          },
        );
      }
      void _uscstats() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: new Text('Unwashed Specialty Coffee', style: TextStyle(
                color: Colors.white,
              )),
              content:
              new Text("Highest price: " + USChigh.toString() + " ETB\n\n"
                  "Lowest price: " + USCsmall.toString() + " ETB", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17)),
            );
          },
        );
      }
      void _lcstats() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: new Text('Local Coffee', style: TextStyle(
                color: Colors.white,
              )),
              content:
              new Text("Highest price: " + LChigh.toString() + " ETB\n\n"
                  "Lowest price: " + LCsmall.toString() + " ETB", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17)),
            );
          },
        );
      }
      void _sestats() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: new Text('Sesame', style: TextStyle(
                color: Colors.white,
              )),
              content:
              new Text("Highest price: " + SEhigh.toString() + " ETB\n\n"
                  "Lowest price: " + SEsmall.toString() + " ETB", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17)),
            );
          },
        );
      }
      void _gmbstats() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: new Text('Green Mung Bean', style: TextStyle(
                color: Colors.white,
              )),
              content:
              new Text("Highest price: " + GMBhigh.toString() + " ETB\n\n"
                  "Lowest price: " + GMBsmall.toString() + " ETB", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17)),
            );
          },
        );
      }
      return Container(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: new BoxDecoration(color: Colors.blueGrey[900]),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(
                    //alignment: Alignment.topLeft,
                    height: 35,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: FlatButton.icon(
                        //color: Colors.red,
                        icon: Icon(Icons.show_chart, color: Colors.white),
                        //`Icon` to display
                        label: Text('Unwashed Export Coffee', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20)),
                        onPressed: () {
                          myInterstitial
                            ..load()
                            ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0
                            );
                          _uecstats();
                        },
                      ),
                    ),
                  ),
                  Text(' '),
                  Container(
                    //alignment: Alignment.topLeft,
                    height: 35,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: FlatButton.icon(
                        //color: Colors.red,
                        icon: Icon(Icons.show_chart, color: Colors.white),
                        //`Icon` to display
                        label: Text('Washed Specialty Coffee', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20)),
                        //`Text` to display
                        onPressed: () {
                          myInterstitial
                            ..load()
                            ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0
                            );
                          _wscstats();
                        },
                      ),
                    ),
                  ),
                  Text(' '),
                  Container(
                    //alignment: Alignment.topLeft,
                    height: 35,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: FlatButton.icon(
                        //color: Colors.red,
                        icon: Icon(Icons.show_chart, color: Colors.white),
                        //`Icon` to display
                        label: Text(
                            'Unwashed Specialty Coffee', style: TextStyle(
                            color: Colors.white,
                            fontSize: 19)),
                        //`Text` to display
                        onPressed: () {
                          myInterstitial
                            ..load()
                            ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0
                            );
                          _uscstats();
                        },
                      ),
                    ),
                  ),
                  Text(' '),
                  Container(
                    //alignment: Alignment.topLeft,
                    height: 35,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: FlatButton.icon(
                        //color: Colors.red,
                        icon: Icon(Icons.show_chart, color: Colors.white),
                        //`Icon` to display
                        label: Text('Local Coffee                        ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20)),
                        //`Text` to display
                        onPressed: () {
                          myInterstitial
                            ..load()
                            ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0
                            );
                          _lcstats();
                        },
                      ),
                    ),
                  ),
                  Text(' '),
                  Container(
                    //alignment: Alignment.topLeft,
                    height: 35,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: FlatButton.icon(
                        //color: Colors.red,
                        icon: Icon(Icons.show_chart, color: Colors.white),
                        //`Icon` to display
                        label: Text('Sesame                                ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20)),
                        //`Text` to display
                        onPressed: () {
                          myInterstitial
                            ..load()
                            ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0
                            );
                          _sestats();
                        },
                      ),
                    ),
                  ),
                  Text(' '),
                  Container(
                    //alignment: Alignment.topLeft,
                    height: 35,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: FlatButton.icon(
                        //color: Colors.red,
                        icon: Icon(Icons.show_chart, color: Colors.white),
                        //`Icon` to display
                        label: Text(
                            'Green Mung Beans            ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20)),
                        //`Text` to display
                        onPressed: () {
                          myInterstitial
                            ..load()
                            ..show(
                                anchorType: AnchorType.bottom,
                                anchorOffset: 0.0
                            );
                          _gmbstats();
                        },
                      ),
                    ),
                  ),
                  Text(' '),
                ]),
          ),
        ),
      );
    },
      ),
    );
  }
}
