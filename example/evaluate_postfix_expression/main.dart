import 'package:infix_expression_parser/expression_evaluator.dart';

void main() {
  // Define a context map
  const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5};

  // Provide a postfix expression
  const postfixExpression = 'abc+*d/';

  // Use the static method provided by the ExpressionEvaluator class and pass both the expression and the context
  final value = ExpressionEvaluator.evaluatePostfix(expression: postfixExpression, context: context);

  print(value); // 2.8
}
