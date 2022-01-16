import 'package:infix_expression_converter/src/converter/infix_expression_converter.dart';
import 'package:test/test.dart';

void main() {
  group('Postfix Conversion', () {
    test('Test 1', () {
      final result = InfixExpressionConverter(expression: '2*(3+4)/5').toPostfixNotation();
      expect(result, equals('234+*5/'));
    });

    test('Test 2', () {
      final result = InfixExpressionConverter(expression: '2*3+4*5').toPostfixNotation();
      expect(result, equals('23*45*+'));
    });

    test('Test 3', () {
      final result = InfixExpressionConverter(expression: '2-3+4-5*6').toPostfixNotation();
      expect(result, equals('23-4+56*-'));
    });

    test('Test 4', () {
      final result = InfixExpressionConverter(expression: '(2-3+4)*(5+6*7)').toPostfixNotation();
      expect(result, equals('23-4+567*+*'));
    });

    test('Test 5', () {
      final result = InfixExpressionConverter(expression: '2+3*(4^5-6)^(7+8*9)-1').toPostfixNotation();
      expect(result, equals('2345^6-789*+^*+1-'));
    });
  });

  group('Prefix Conversion', () {
    test('Test 1', () {
      final result = InfixExpressionConverter(expression: '2*3+4/5').toPrefixNotation();
      expect(result, equals('+*23/45'));
    });

    test('Test 2', () {
      final result = InfixExpressionConverter(expression: '(2-3/4)*(2/5-6)').toPrefixNotation();
      expect(result, equals('*-2/34-/256'));
    });

    test('Test 3', () {
      final result = InfixExpressionConverter(expression: '2+3*4/5+6').toPrefixNotation();
      expect(result, equals('++2/*3456'));
    });

    test('Test 4', () {
      final result = InfixExpressionConverter(expression: '((2+3)+4)-(5-6)^7').toPrefixNotation();
      expect(result, equals('-++234^-567'));
    });

    test('Test 5', () {
      final result = InfixExpressionConverter(expression: '(2+3^4)*5+6^7').toPrefixNotation();
      expect(result, equals('+*+2^345^67'));
    });
  });
}
