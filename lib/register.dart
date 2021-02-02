import 'package:flutter/material.dart';

// ignore: camel_case_types
class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Register_State();
  }

}

// ignore: camel_case_types
class Register_State extends State<Register>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text("REGISTER", style: TextStyle(fontSize: 20),),
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 0, bottom: 5),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Name",
                            ),
                          ),
                          width: 320,
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10, bottom: 5),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Phone",
                            ),
                          ),
                          width: 320,
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10, bottom: 5),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                            ),
                          ),
                          width: 320,
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10, bottom: 5),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Password",
                            ),
                            obscureText: true,
                          ),
                          width: 320,
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10, bottom: 5),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: RaisedButton(
                            child: Text("CREATE ACCOUNT"),
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text("Message"),
                                  content: Text("Registered Successfully "),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => Home_Session(),),
                                        // );
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            color: Colors.blue,
                          ),
                          margin: const EdgeInsets.only(left: 85.0, top: 5.0, right: 25.0, bottom: 5.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}