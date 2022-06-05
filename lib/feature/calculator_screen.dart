import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  brackets() {
    List<String> equationls = equation.split('').toList();
    int countbr = 0;
    int countcbr = 0;
    if (equation.contains("(") || equation.contains(")")) {
      for (int i = 0; i < equationls.length; i++) {
        if (equationls[i] == '(') {
          countbr++;
        } else if (equationls[i] == ')') {
          countcbr++;
        }
      }
      if (countbr == countcbr) {
        equation += '(';
      } else {
        equation += ')';
      }
    } else if (int.parse(equation) == 0) {
      equation = '(';
    } else {
      equation += '(';
    }
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "( )") {
        brackets();
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget myButton({color, text}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      child: Text(
        text.toString(),
        style: TextStyle(fontSize: 30.0, color: ((AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) && ([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, '.'].contains(text))) ? const Color(0xff1c313a) : null),
      ),
      onPressed: () => buttonPressed(text.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
        ),
        elevation: 0.0,
        title: Text(
          'Calculator',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20.00,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: IconButton(
              onPressed: () => (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) ? (AdaptiveTheme.of(context).setDark()) : (AdaptiveTheme.of(context).setLight()),
              icon: Icon(
                Icons.wb_sunny,
                color: Theme.of(context).textTheme.titleMedium?.color,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 200,
                      color: Colors.transparent,
                    ),
                    SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            equation,
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 45.0),
                          ),
                          Text(
                            result,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 65.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 7.0,
                children: [
                  myButton(color: Theme.of(context).canvasColor, text: 'AC'),
                  myButton(color: const Color(0xfff0a633), text: '( )'),
                  myButton(color: const Color(0xfff0a633), text: '%'),
                  myButton(color: const Color(0xfff0a633), text: '÷'),
                  myButton(color: Theme.of(context).primaryColor, text: 7),
                  myButton(color: Theme.of(context).primaryColor, text: 8),
                  myButton(color: Theme.of(context).primaryColor, text: 9),
                  myButton(color: const Color(0xfff0a633), text: '×'),
                  myButton(color: Theme.of(context).primaryColor, text: 4),
                  myButton(color: Theme.of(context).primaryColor, text: 5),
                  myButton(color: Theme.of(context).primaryColor, text: 6),
                  myButton(color: const Color(0xfff0a633), text: '-'),
                  myButton(color: Theme.of(context).primaryColor, text: 1),
                  myButton(color: Theme.of(context).primaryColor, text: 2),
                  myButton(color: Theme.of(context).primaryColor, text: 3),
                  myButton(color: const Color(0xfff0a633), text: '+'),
                  myButton(color: Theme.of(context).primaryColor, text: 0),
                  myButton(color: Theme.of(context).primaryColor, text: '.'),
                  myButton(color: Theme.of(context).canvasColor, text: '⌫'),
                  myButton(color: const Color(0xff27ce55), text: '='),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
