import 'package:basic_calculator/calculator_logic.dart';
import 'package:basic_calculator/my_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String question = '';
  String result = '';
  final CalculatorLogic calculationLogic = CalculatorLogic();
  String buttonTap(String buttonValue) {
    setState(() {
      if (buttonValue == 'AC') {
        question = '';
        result = '';
      } else if (buttonValue == 'DEL') {
        question = question.isNotEmpty
            ? question.substring(0, question.length - 1)
            : '';
      } else if (buttonValue == '=') {
        print('Evaluating: $question');
        double evaluation = calculationLogic.evaluateExpression(question);
        print('Result: $evaluation'); // Debug log
        result = evaluation.toString();
        question = result;
      } else if (buttonValue == 'ANS') {
        if (result.isNotEmpty) {
          // If there's a result, append it to the question.
          // Only append if there is an operator before (to continue the operation)
          if (question.isNotEmpty && question.contains(RegExp(r'[\+\-\×\÷]'))) {
            question += result; // Reuse result in the new expression
          }
        }
      } else {
        question += buttonValue;
      }
    });
    return '';
  }

  @override
  Widget build(BuildContext context) {
    List<String> buttontext = [
      'AC',
      'DEL',
      '%',
      '÷',
      '7',
      '8',
      '9',
      '×',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '0',
      '.',
      'ANS',
      '=',
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: buttontext.length,
              itemBuilder: (BuildContext context, index) {
                var textColor = (buttontext[index] == 'AC' ||
                            buttontext[index] == 'DEL' ||
                            buttontext[index] == '%')
                        ? Colors.black
                        : Colors.white,
                    buttonBackground = (buttontext[index] == 'AC' ||
                            buttontext[index] == 'DEL' ||
                            buttontext[index] == '%')
                        ? Colors.grey
                        : (buttontext[index] == '÷' ||
                                buttontext[index] == '×' ||
                                buttontext[index] == '-' ||
                                buttontext[index] == '+' ||
                                buttontext[index] == '=')
                            ? Colors.orange.shade400
                            : const Color(0xFF565656);

                return MyButtons(
                  buttontext[index],
                  textColor,
                  buttonBackground,
                  () => buttonTap(
                    buttontext[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
