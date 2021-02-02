import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bmi_provider.dart';

// ignore: camel_case_types
class BMI_Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Calc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BMI(title: "Demo"),
      ),
    );
  }
}

class BMI extends StatelessWidget{
  final myHeight = TextEditingController();
  final myWeight = TextEditingController();
  final String title;
  BMI({this.title});
  void _calculator(BuildContext context) {
    Provider.of<Calc>(context, listen: false).CalculateBmi(double.parse(myWeight.text), double.parse(myHeight.text));
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Calc>(context).getCounter;
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Column(
            children: <Widget> [
              Expanded(child: ListView(
                children: [
                  Row(
                    children: <Widget> [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 320,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your Weight in KG",
                          ),
                          controller: myWeight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget> [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 320,
                       child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter your Height in Feet"
                          ),
                          controller: myHeight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: RaisedButton(
                          child: Text("Calculate", style: TextStyle(color: Colors.white),),
                          onPressed: (){
                            _calculator(context);
                          },
                          color: Colors.blue,
                        ),
                        margin: const EdgeInsets.only(left: 115.0, top: 5.0, right: 25.0, bottom: 5.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Your BMI - $counter',),
                    ],
                  )
                ],
              )),

            ],
          ),
        ),
      ),
    );
  }

}