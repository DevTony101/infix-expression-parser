import 'package:infix_expression_parser/infix_expression_converter.dart';
import 'package:infix_expression_parser/expression_evaluator.dart';

void main() {
  // Provide an infix expression
  const infixExpression = 'a-b+c-d*e';

  // Convert it to either its postfix or prefix notation
  final converter = InfixExpressionConverter(expression: infixExpression);
  final postfixExpression = converter.toPostfixNotation();

  // Define a context map
  const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6};

  // Use the static method provided by the ExpressionEvaluator class and pass both the expression and the context
  final value = ExpressionEvaluator.evaluatePostfix(expression: postfixExpression, context: context);

  print(value); // -27.0
}
