import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bmi.dart';
import 'counter.dart';

class Demo_Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "Demo"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});
  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  void _decrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).decrementCounter();
  }
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(35),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () => _incrementCounter(context),
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(35),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () => _decrementCounter(context),
                    child: Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BMI_Calc(),),
                    ),
                    child: Text("BMI"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}