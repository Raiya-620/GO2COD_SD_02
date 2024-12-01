import 'package:basic_calculator/my_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String question = '';
  String buttonTap(String buttonValue) {
    setState(() {
      question = buttonValue;
    });
    return '';

    // print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    List<String> buttontext = [
      'AC',
      'DEL',
      '%',
      '/',
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
                        : (buttontext[index] == '/' ||
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
                  buttonTap(
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
