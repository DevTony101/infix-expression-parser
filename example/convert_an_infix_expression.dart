import 'package:infix_expression_parser/infix_expression_converter.dart';

void main() {
  // Provide an infix expression
  const infixExpression = '(a-b+c)*(d+e*f)';

  // Create an instance of InfixExpressionConverter
  final converter = InfixExpressionConverter(expression: infixExpression);

  final postfixExpression = converter.toPostfixNotation();
  final prefixExpression = converter.toPrefixNotation();

  print(postfixExpression); // ab-c+def*+*
  print(prefixExpression); // *+-abc+d*ef
}
