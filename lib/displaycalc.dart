import 'package:flutter/material.dart';

class Calculate extends StatelessWidget {
  String value;
  Calculate({required this.value});

  @override
  Widget build(BuildContext context) {
    TextEditingController _valueController = TextEditingController(text: value);
    return Scaffold(
        appBar: AppBar(title: Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextField(
                    // To set the appropriate controller
                    // to the text field.
                    controller: _valueController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Value inserted",
                    ),
                  )),
              Text('data'),
              Text('data'),
            ],
          ),
        ));
  }
}
