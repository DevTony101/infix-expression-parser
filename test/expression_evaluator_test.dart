import 'dart:math';

import 'package:infix_expression_converter/src/converter/infix_expression_converter.dart';
import 'package:infix_expression_converter/src/evaluator/expression_evaluator.dart';
import 'package:test/test.dart';

void main() {
  group('Postfix Evaluator', () {
    test('Test 1', () {
      final result = InfixExpressionConverter(expression: '2*(3+4)/5').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result), equals(2*(3+4)/5));
    });

    test('Test 2', () {
      final result = InfixExpressionConverter(expression: '2*3+4*5').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result), equals(2*3+4*5));
    });

    test('Test 3', () {
      final result = InfixExpressionConverter(expression: '2-3+4-5*6').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result), equals(2-3+4-5*6));
    });

    test('Test 4', () {
      final result = InfixExpressionConverter(expression: '(2-3+4)*(5+6*7)').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result), equals((2-3+4)*(5+6*7)));
    });

    test('Test 5', () {
      final result = InfixExpressionConverter(expression: '2+3*(4^5-6)^(7+8*9)-1').toPostfixNotation();
      expect(ExpressionEvaluator.evaluatePostfix(expression: result), equals(2+(3*(pow(((pow(4,5))-6),(7+(8*9)))))-1));
    });
  });

  group('Prefix Evaluator', () {
    test('Test 1', () {
      final result = InfixExpressionConverter(expression: '2*3+4/5').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result), equals(2*3+4/5));
    });

    test('Test 2', () {
      final result = InfixExpressionConverter(expression: '(2-3/4)*(2/5-6)').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result), equals((2-3/4)*(2/5-6)));
    });

    test('Test 3', () {
      final result = InfixExpressionConverter(expression: '2+3*4/5+6').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result), equals(2+3*4/5+6));
    });

    test('Test 4', () {
      final result = InfixExpressionConverter(expression: '((2+3)+4)-(5-6)^7').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result), equals(((2+3)+4)-(pow(5-6,7))));
    });

    test('Test 5', () {
      final result = InfixExpressionConverter(expression: '(2+3^4)*5+6^7').toPrefixNotation();
      expect(ExpressionEvaluator.evaluatePrefix(expression: result), equals(((2+(pow(3,4)))*5)+(pow(6,7))));
    });
  });
}