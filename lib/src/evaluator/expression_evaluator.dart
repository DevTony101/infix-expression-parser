import 'dart:math';

import 'package:stack/stack.dart';
import 'package:string_validator/string_validator.dart';

class ExpressionEvaluator {

  static num evaluatePostfix({required String expression, required Map context}) {
    return _evaluate(expression.split(''), context: context, reverseOperands: true);
  }

  static num evaluatePrefix({required String expression, required Map context}) {
    return _evaluate(expression.split('').reversed.toList(), context: context);
  }

  static num _evaluate(List<String> tokens, {required Map context, bool reverseOperands = false}) {
    final resultStack = Stack<num>();
    for (var token in tokens) {
      if (isAlpha(token)) {
        resultStack.push(context[token]);
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
