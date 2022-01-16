import 'dart:math';
import '../utils/utils.dart';
import 'package:stack/stack.dart';

class ExpressionEvaluator {
  static num evaluatePostfix({required String expression}) {
    return _evaluate(expression.split(''), reverseOperands: true);
  }

  static num evaluatePrefix({required String expression}) {
    return _evaluate(expression.split('').reversed.toList());
  }

  static num _evaluate(List<String> tokens, {bool reverseOperands = false}) {
    final resultStack = Stack<num>();
    for (var token in tokens) {
      if (Utils.isNumber(string: token)) {
        resultStack.push(num.parse(token));
      } else {
        final a = resultStack.pop(), b = resultStack.pop();
        if (token == '+') {
          resultStack.push(a + b);
        } else if (token == '-') {
          resultStack.push(reverseOperands ? b - a : a - b);
        } else if (token == '*') {
          resultStack.push(a * b);
        } else if (token == '/') {
          resultStack.push(reverseOperands ? b / a : a / b);
        } else if (token == '^') {
          resultStack.push(reverseOperands ? pow(b, a) : pow(a, b));
        }
      }
    }
    return resultStack.top();
  }
}
