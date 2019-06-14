import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyCalculator()
    );
  }
}

class MyCalculator extends StatefulWidget {

  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String displayedString = '';
  String _displayedString = '';
  num _num1 = 0;
  num _num2 = 0;
  String _oper = '';

  buttonPressed(String buttonText) {

    if (buttonText == 'CLEAR') {
      _displayedString = '';
      _num1 = 0;
      _num2 = 0;
      _oper = '';
    } else if(buttonText == '=') {
      if(_num2 == 0) {
        _num2 = int.parse(_displayedString);
      }
      
      if(_oper == '+') {
        num temp = _num1 + _num2;
        _num1 = temp;
        _displayedString = temp.toString();
      } else if(_oper == '-') {
        num temp = _num1 - _num2;
        _num1 = temp;
        _displayedString = temp.toString();
      } else if(_oper == '*') {
        num temp = _num1 * _num2;
        _num1 = temp;
        _displayedString = temp.toString();
      } else if(_oper == '/') {
        num temp = _num1 / _num2;
        _num1 = temp;
        _displayedString = temp.toString();
      }

      _num2 = 0;
    } else if(buttonText == '+') {
      _oper = '+';
      _num1 = int.parse(_displayedString);
      _displayedString = '';
    } else if(buttonText == '-') {
      _oper = '-';
      _num1 = int.parse(_displayedString);
      _displayedString = '';
    } else if(buttonText == '*') {
      _oper = '*';
      _num1 = int.parse(_displayedString);
      _displayedString = '';
    } else if(buttonText == '/') {
      _oper = '/';
      _num1 = int.parse(_displayedString);
      _displayedString = '';
    } else {
      _displayedString = _displayedString + buttonText;
    }

    setState(() {
      displayedString = _displayedString;
    });
  }

  Widget _buildButton(String buttonText, int flex) {
    return Expanded(
      flex: flex,
      child: OutlineButton(
        onPressed: () => {
          buttonPressed(buttonText)
        },
        padding: const EdgeInsets.all(20),
        splashColor: Colors.blueAccent,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0, color: Colors.black)
        )
      )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator')
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child:Text(
                  displayedString,
                  style: TextStyle(fontSize: 30)
                )
              )
            ),
            Row(
              children: [
                _buildButton('7', 1),
                _buildButton('8', 1),
                _buildButton('9', 1),
                _buildButton('+', 1)
              ]
            ),

            Row(
              children: [
                _buildButton('4', 1),
                _buildButton('5', 1),
                _buildButton('6', 1),
                _buildButton('-', 1)
              ]
            ),

            Row(
              children: [
                _buildButton('1', 1),
                _buildButton('2', 1),
                _buildButton('3', 1),
                _buildButton('*', 1)
              ]
            ),

            Row(
              children: [
                // Expanded(flex: 3, child: Center(child: Text('0'))),
                _buildButton('0', 3),
                // Expanded(flex: 1, child: Center(child: Text('/')))
                _buildButton('/', 1)
              ]
            ),
            Row(
              children: [
                _buildButton('CLEAR', 1),
                _buildButton('=', 1)
              ]
            )
          ]
        )
      )
    );
  }
}