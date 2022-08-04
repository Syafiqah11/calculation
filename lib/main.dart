// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:statemgt/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemgt/displaycalc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: BlocProvider(
          create: (context) => CounterCubit(),
          child: MyHomePage(
            title: 'Home Page',
            value: '',
          )),
      routes: {
        '/counter': (context) => Calculate(
              value: '',
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.value})
      : super(key: key);

  final String value;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _valueController = TextEditingController();
  int count = 0;

  late CounterCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<CounterCubit>(context);
    super.initState();
  }

  // @override
  // void didChangeDependies() {
  //   cubit = BlocProvider.of<CounterCubit>(context);
  //   super.didChangeDependencies();
  // }

  // void navigateToCalcPage() {
  //   //BuildContext context to pass/link data from below context
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (BuildContext context) {
  //       return Calculate();
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       const Text(
        //         'You have pushed the button this many times:',
        //       ),
        //       Text(
        //         '$_counter',
        //         style: Theme.of(context).textTheme.headline4,
        //       ),
        //     ],
        //   ),
        // ),
        //
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),

        body: BlocConsumer<CounterCubit, int>(
          listener: (context, state) {
            const snackbar = SnackBar(
              content: Text('State is reached'),
            );

            if (state == 5) {
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _valueController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Value'),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    '$state',
                    style: TextStyle(fontSize: 80),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              cubit.increment();
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue[900]),
                            ),
                            child: const Text("Increment")),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              cubit.decrement();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue[900])),
                            child: const Text("Decrement")),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              cubit.reset();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red[900])),
                            child: const Text("Reset")),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(50),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Calculate(
                                          value: _valueController.text,
                                        )));
                                // navigateToCalcPage();
                                // cubit.multiple(state);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blueGrey),
                              ),
                              child: const Text("Multiple")),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // navigateToCalcPage();
                                // cubit.divide(state);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey)),
                              child: const Text("Divide")),
                        ]),
                  )
                ],
              ),
            );
          },
        ));
  }
}
