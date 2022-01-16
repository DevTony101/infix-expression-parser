import 'package:infix_expression_parser/src/converter/infix_expression_converter.dart';
import 'package:test/test.dart';

void main() {
  group('Postfix Conversion', () {
    test('Test 1', () {
      final result = InfixExpressionConverter(expression: 'a*(b+c)/d').toPostfixNotation();
      expect(result, equals('abc+*d/'));
    });

    test('Test 2', () {
      final result = InfixExpressionConverter(expression: 'a*b+c*d').toPostfixNotation();
      expect(result, equals('ab*cd*+'));
    });

    test('Test 3', () {
      final result = InfixExpressionConverter(expression: 'a-b+c-d*e').toPostfixNotation();
      expect(result, equals('ab-c+de*-'));
    });

    test('Test 4', () {
      final result = InfixExpressionConverter(expression: '(a-b+c)*(d+e*f)').toPostfixNotation();
      expect(result, equals('ab-c+def*+*'));
    });

    test('Test 5', () {
      final result = InfixExpressionConverter(expression: 'a+b*(c^d-e)^(f+g*h)-i').toPostfixNotation();
      expect(result, equals('abcd^e-fgh*+^*+i-'));
    });
  });

  group('Prefix Conversion', () {
    test('Test 1', () {
      final result = InfixExpressionConverter(expression: 'a*b+c/d').toPrefixNotation();
      expect(result, equals('+*ab/cd'));
    });

    test('Test 2', () {
      final result = InfixExpressionConverter(expression: '(a-b/c)*(d/e-f)').toPrefixNotation();
      expect(result, equals('*-a/bc-/def'));
    });

    test('Test 3', () {
      final result = InfixExpressionConverter(expression: 'a+b*c/d+e').toPrefixNotation();
      expect(result, equals('++a/*bcde'));
    });

    test('Test 4', () {
      final result = InfixExpressionConverter(expression: '((a+b)+c)-(d-e)^f').toPrefixNotation();
      expect(result, equals('-++abc^-def'));
    });

    test('Test 5', () {
      final result = InfixExpressionConverter(expression: '(a+b^c)*d+e^f').toPrefixNotation();
      expect(result, equals('+*+a^bcd^ef'));
    });
  });
}
