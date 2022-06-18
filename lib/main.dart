import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String whatIamDoing = "Cooking breakfast";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getAllBoodBanks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasData) {
                return Center(
                  child: ListView(children: [
                    ElevatedButton(
                      child: Text(whatIamDoing),
                      onPressed: doChores,
                    ),
                    ...drawCards(snapshot.data as List<String>)
                  ]),
                );
              }

              return Container();
            }));
  }

  void myFunction() {}

  List<Widget> drawCards(List<String> bloodBanks) {
    List<Widget> myWidgets = [];
    for (int i = 0; i < bloodBanks.length; i++) {
      myWidgets.add(Text(bloodBanks[i]));
    }
    return myWidgets;
  }

  Future<List<String>> getAllBoodBanks() async {
    var time = await Future.delayed(Duration(seconds: 2));
    return [
      "Red Cross Blood Bank",
      "Rajiv Gandi Bloof Bank",
      "Modi ji Blood Bank"
    ];
  }

  void doChores() {
    print("Lets start");

    //Statement 2
    String result = whatIamDoing;

    //Statement 3
    var myFuture = Future.delayed(Duration(seconds: 3), () {
      Random rand = Random();
      int res = rand.nextInt(3);
      if (res == 0)
        throw Exception();
      else if (res == 1)
        result = "Vegetables not found";
      else
        result = "Done cooking";
      return "Result: $result";
    });

    setState(() {
      whatIamDoing = "teaching you guys";
    });

    //Statement 4
    myFuture.then((result) {
      setState(() {
        whatIamDoing = "Done cooking";
      });
    });

    //Statement 5
    myFuture.catchError((error) {
      setState(() {
        whatIamDoing = "Oh ! gas not available";
      });
    });
  }
}
