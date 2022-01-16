import 'dart:math';

import 'package:test/test.dart';
import 'package:infix_expression_parser/src/converter/infix_expression_converter.dart';
import 'package:infix_expression_parser/src/evaluator/expression_evaluator.dart';

void main() {
  group('Postfix Evaluator', () {
    test('Test 1', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5};
      final result = InfixExpressionConverter(expression: 'a*(b+c)/d').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result, context: context), equals(2 * (3 + 4) / 5));
    });

    test('Test 2', () {
      const context = {'a': 2, 'b': 10, 'c': 4, 'd': 5};
      final result = InfixExpressionConverter(expression: 'a*b+c*d').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result, context: context), equals(2 * 10 + 4 * 5));
    });

    test('Test 3', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6};
      final result = InfixExpressionConverter(expression: 'a-b+c-d*e').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result, context: context), equals(2 - 3 + 4 - 5 * 6));
    });

    test('Test 4', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6, 'f': 7};
      final result = InfixExpressionConverter(expression: '(a-b+c)*(d+e*f)').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result, context: context), equals((2 - 3 + 4) * (5 + 6 * 7)));
    });

    test('Test 5', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6, 'f': 7, 'g': 8, 'h': 9, 'i': 1};
      final result = InfixExpressionConverter(expression: 'a+b*(c^d-e)^(f+g*h)-i').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result, context: context), equals(2 + (3 * (pow(((pow(4, 5)) - 6), (7 + (8 * 9))))) - 1));
    });
  });

  group('Prefix Evaluator', () {
    test('Test 1', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5};
      final result = InfixExpressionConverter(expression: 'a*b+c/d').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result, context: context), equals(2 * 3 + 4 / 5));
    });

    test('Test 2', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6};
      final result = InfixExpressionConverter(expression: '(a-b/c)*(a/d-e)').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result, context: context), equals((2 - 3 / 4) * (2 / 5 - 6)));
    });

    test('Test 3', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6};
      final result = InfixExpressionConverter(expression: 'a+b*c/d+e').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result, context: context), equals(2 + 3 * 4 / 5 + 6));
    });

    test('Test 4', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6, 'f': 7};
      final result = InfixExpressionConverter(expression: '((a+b)+c)-(d-e)^f').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result, context: context), equals(((2 + 3) + 4) - (pow(5 - 6, 7))));
    });

    test('Test 5', () {
      const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6, 'f': 7};
      final result = InfixExpressionConverter(expression: '(a+b^c)*d+e^f').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result, context: context), equals(((2 + (pow(3, 4))) * 5) + (pow(6, 7))));
    });
  });
}
