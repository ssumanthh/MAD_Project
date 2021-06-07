import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloodBank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Phone Call'),
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
  List<Map<String, String>> data = [
    {"name": "sushil", "blood": "B+", "phone": "9441445103"},
    {"name": "suhas", "blood": "AB+", "phone": "9438445103"},
    {"name": "suketh", "blood": "A+", "phone": "9442445103"},
    {"name": "sumukha", "blood": "B-", "phone": "9445445103"},
    {"name": "sujan", "blood": "O+", "phone": "9446445103"},
    {"name": "suresh", "blood": "O-", "phone": "9447445103"},
    {"name": "sudhesh", "blood": "AB-", "phone": "9444445103"},
    {"name": "suraj", "blood": "A-", "phone": "9449445103"},
    {"name": "suhan", "blood": "B+", "phone": "9440445103"},
    {"name": "sumanth", "blood": "B+", "phone": "8748929010"},
  ];

  _callNumber(String pnumber) async {
    String number = pnumber; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BloodBank"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: data.length, //number of data
              itemBuilder: (BuildContext context, int index) {
                //display the details in card view in list
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          child: Text('${data[index]['name'][0]}'),
                        ),
                        title: Text('${data[index]['name']}'),
                        subtitle: Text(
                          '${data[index]['blood']}\n${data[index]['phone']}',
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //button to make call
                          new FlatButton(
                            child: Text('call'),
                            onPressed: () {
                              _callNumber(data[index]['phone']);
                            },
                          ),
                          //button to send msg
                          new FlatButton(
                            child: const Text('message'),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
