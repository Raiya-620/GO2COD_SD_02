class CalculatorLogic {
  double evaluateExpression(String expression) {
    try {
      // Normalize the input: Replace '×' with '*' and '÷' with '/'
      expression = expression.replaceAll('×', '*').replaceAll('÷', '/');

      // Step 1: Tokenize the input expression
      List<String> tokens = _tokenize(expression);

      // Step 2: Handle '*' and '/' first
      tokens = _processHighPrecedence(tokens);

      // Step 3: Handle '+' and '-' next
      return _processLowPrecedence(tokens);
    } catch (e) {
      print("Error: $e");
      return 0.0; // Return 0.0 if there is an error
    }
  }

  // Tokenize the input expression into numbers and operators
  List<String> _tokenize(String expression) {
    RegExp regex = RegExp(r'(\d+\.?\d*|\+|\-|\*|\/)');
    return regex.allMatches(expression).map((e) => e.group(0)!).toList();
  }

  // Process * and / operators
  List<String> _processHighPrecedence(List<String> tokens) {
    List<String> result = [];
    double tempResult;

    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == '*') {
        tempResult =
            double.parse(result.removeLast()) * double.parse(tokens[++i]);
        result.add(tempResult.toString());
      } else if (tokens[i] == '/') {
        tempResult =
            double.parse(result.removeLast()) / double.parse(tokens[++i]);
        result.add(tempResult.toString());
      } else {
        result.add(tokens[i]);
      }
    }

    return result;
  }

  // Process + and - operators
  double _processLowPrecedence(List<String> tokens) {
    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double nextNumber = double.parse(tokens[i + 1]);

      if (operator == '+') {
        result += nextNumber;
      } else if (operator == '-') {
        result -= nextNumber;
      }
    }

    return result;
  }
}
