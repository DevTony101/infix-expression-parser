import 'package:infix_expression_parser/expression_evaluator.dart';

void main() {
  // Define a context map
  const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6};

  // Provide a postfix expression
  const prefixExpression = '*-a/bc-/ade';

  // Use the static method provided by the ExpressionEvaluator class and pass both the expression and the context
  final value = ExpressionEvaluator.evaluatePrefix(expression: prefixExpression, context: context);

  print(value); // -7.0
}
