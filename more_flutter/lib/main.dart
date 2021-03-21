import 'package:flutter/material.dart';
import 'package:more_flutter/widgets/info_card.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  void _showDialog(BuildContext context, {String title, String msg}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        RaisedButton(
          color: Colors.teal,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
    showDialog(context: context, builder: (x) => dialog);
  }

  final String phone = "+2349031757021";
  final String email = "mremmalex2@gmail.com";
  final String url = "http://github.com/Mremmalex";
  final String location = "Aba,Abia State,Nigeria";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/profile.jpeg"),
            ),
            Text("Sampson IfeanyiChukwu",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                )),
            Text("Mobile Developer",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal[50],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro',
                )),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.teal.shade700,
              ),
            ),
            InfoCard(
              text: phone,
              icon: Icons.phone,
              onPressed: () async {
                if (await launcher.canLaunch("tel:$phone")) {
                  await launcher.launch("tel:$phone");
                } else {
                  _showDialog(context,
                      title: "Sorry",
                      msg: "Phone number can't called at this time");
                }
              },
            ),
            InfoCard(
              text: email,
              icon: Icons.email,
              onPressed: () async {
                if (await launcher.canLaunch("mailto:$email")) {
                  await launcher.launch("mailto:$email");
                } else {
                  _showDialog(context,
                      title: "Sorry", msg: "Can't Send a mail at thie moment");
                }
              },
            ),
            InfoCard(
              text: url,
              icon: Icons.web,
              onPressed: () async {
                if (await launcher.canLaunch(url)) {
                  await launcher.launch(url);
                } else {
                  _showDialog(context,
                      title: "Sorry", msg: "Can't open this url");
                }
              },
            ),
            InfoCard(
              text: location,
              icon: Icons.location_city,
            )
          ],
        ),
      ),
    );
  }
}
