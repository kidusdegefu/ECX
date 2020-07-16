import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import './stats.dart';

String inter1 = "ca-app-pub-8168896396859644/6861928531";

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['Delivery', 'Food'],
  contentUrl: 'https://google.com',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>["D93A3ADC37331E24F75DD69AB0C692B2"], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  adUnitId: 'ca-app-pub-8168896396859644/1641391443',
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
BannerAd myBanner2 = BannerAd(
  adUnitId: 'ca-app-pub-8168896396859644/1641391443',
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
InterstitialAd myInterstitial = InterstitialAd(
      adUnitId: 'ca-app-pub-8168896396859644/6861928531',
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

void main() => runApp(ecxApp());


class ecxApp extends StatefulWidget {
  @override
  _ecxAppState createState() => _ecxAppState();
}


class _ecxAppState extends State<ecxApp> {
  @override
  void initState(){
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8168896396859644~8509224140");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ethiopia Commodity Exchange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ethiopia Commodity Exchange'),
      builder: (BuildContext context, Widget child){
        myBanner
          ..load()
          ..show(
            anchorOffset: 0.0,
            anchorType: AnchorType.bottom,
          );
        double paddingBottom = 90.0;
        return new Padding(
          child: child,
          padding: new EdgeInsets.only(bottom: paddingBottom,)
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var now = new DateTime.now();
  String product = "Product";
  String symbol = "Symbol";
  String price = "Price";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ethiopia Commodity Exchange'), backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.show_chart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Stats(),
                  ));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('products').snapshots(),
        builder: (context, snapshot){
    return Container(
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: new BoxDecoration(color: Colors.blueGrey[900]),
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                        ),
                        child: Center(
                          child:  Text("Last updated: "+new DateFormat("dd-MM-yyyy").format(now),style: TextStyle(
                              color: Colors.white,
                              fontSize: 20)),
                        ),
                      ),
                      Text(' '),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Unwashed Export Coffee",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder
                              .all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text(product,style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text(symbol,style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text(price,style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Kaffa',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('UKF',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[12]['UKF'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Harar',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('UHR',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[10]['UHR'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Illubabour',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('UIB',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[11]['UIB'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Shaka',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('USK',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[14]['USK'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Yirgachefe',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('UYC',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[15]['UYC'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Washed Specialty Coffee",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Anderacha',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('WAN',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[17]['WAN'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Yirgachefe',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('WYCQ',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[22]['WYCQ'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Limmu',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('WLMQ',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[19]['WLMQ'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Sidama',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('WSDQ',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[20]['WSDQ'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Unwashed Specialty Coffee",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Guji',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('UGJQ',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[9]['UGJQ'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Sidama',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('USDQ',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[13]['USDQ'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Yirgachefe',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('UYCQ',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[16]['UYCQ'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Local Coffee",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Local Unwashed',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('LU',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[2]['LU'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Local Washed',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('LW',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[3]['LW'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("White Pea Beans",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Round White Pea Beans',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('RWPB',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[4]['RWPB'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ])
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Wollege Sesame",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Whitish Wollege',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('WWSS',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[21]['WWSS'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ])
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Humera Gonder Sesame",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Whitish Humera Gonder',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('WHGS',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[18]['WHGS'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Green Mung Bean",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Gonder',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('GMBG',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[0]['GMBG'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Shoa',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('GMBS',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[1]['GMBS'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 50, // spacing between each of the widgets below
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
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
                              child:  Text("Soya beans",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color:Colors.blueGrey),
                          children: [
                            TableRow(children: [
                              Text('Product',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Symbol',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                              Text('Price',style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Wollega',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('SBWO',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[8]['SBWO'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Assosa',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('SBAS',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[5]['SBAS'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Gojam',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('SBGJ',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[6]['SBGJ'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                            TableRow(children: [
                              Text('Gonder',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text('SBGO',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                              Text(snapshot.data.documents[7]['SBGO'],style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18)),
                            ]),
                          ],
                        ),
                      ),
                      Text(''),
                    ],
                  )
              )
              ,
            )
            ,
          );
        },
      ),
    )
    ;
  }
}
