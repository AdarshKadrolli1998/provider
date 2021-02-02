import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc.dart';
import 'event_counter.dart';
import 'register.dart';

class Bloc extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DemoBloc(),
    );
  }
}

class DemoBloc extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DemoBloc> {
  final _bloc = Bloc_Counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context,AsyncSnapshot<int> snapshot){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:',),
                Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 30)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register(),),
                        );
                        },
                        child: Text("Register"),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.add),
            onPressed: (){
              //class bloc class by passing IncrementEvent
              _bloc.counterEventSink.add(IncrementEvent());
            },
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.remove),
            onPressed: (){
              //class bloc class by passing DecrementEvent
              _bloc.counterEventSink.add(DecrementEvent());
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //dispose all the controller
    _bloc.dispose();
  }
}