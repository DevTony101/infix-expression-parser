A dart package to help you parse and evaluate infix mathematical expressions into their prefix and postfix notations.

## Features
- Convert an infix expression into its prefix and postfix notations
- Evaluate a mathematical expression
- Support for basic mathematical operations

## Usage
You can use `infix-expression-parser` as a library or as a CLI tool. Below are some examples explaining how to use the package in each case.

### As a library
The package exposes two main classes:

- **InfixExpressionConverter**: Use this class when you have an infix expression and want to convert it either to its postfix or infix notation.
- **ExpressionEvaluator**: Use this class when you already have a postfix or prefix expression and want to evaluate it to a result. Use in combination with `InfixExpressionConverter` to also evaluate infix expressions easily. Note that in order to return a value, you need to provide a **context** in which you give each symbol in the expression a numeric value.

#### Example #1: Converting an infix expression
```dart
import 'package:infix_expression_parser/infix_expression_converter.dart';

// Provide an infix expression
const infixExpression = '(a-b+c)*(d+e*f)';

// Create an instance of InfixExpressionConverter
final converter = InfixExpressionConverter(expression: infixExpression);

final postfixExpression = converter.toPostfixNotation();
final prefixExpression = converter.toPrefixNotation();

print(postfixExpression); // ab-c+def*+*
print(prefixExpression); // *+-abc+d*ef
```

#### Example #2: Evaluating a postfix expression
```dart
import 'package:infix_expression_parser/expression_evaluator.dart';

// Define a context map
const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5};

// Provide a postfix expression
const postfixExpression = 'abc+*d/';

// Use the static method provided by the ExpressionEvaluator class and pass both the expression and the context
final value = ExpressionEvaluator.evaluatePostfix(expression: postfixExpression, context: context);

print(value); // 2.8
```

#### Example #3: Evaluating a prefix expression
```dart
import 'package:infix_expression_parser/expression_evaluator.dart';

// Define a context map
const context = {'a': 2, 'b': 3, 'c': 4, 'd': 5, 'e': 6};

// Provide a postfix expression
const prefixExpression = '*-a/bc-/ade';

// Use the static method provided by the ExpressionEvaluator class and pass both the expression and the context
final value = ExpressionEvaluator.evaluatePrefix(expression: prefixExpression, context: context);

print(value); // -7.0
```

#### Example #4: Evaluating an infix expression
```dart
import 'package:infix_expression_parser/infix_expression_converter.dart';
import 'package:infix_expression_parser/expression_evaluator.dart';

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
```

### As a CLI tool
The package expose a `infix-parser` command explained below:
```bash
A CLI tool for evaluating expressions in prefix or postfix notations or converting infix expressions.

Usage: infix-parser <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  convert   Converts an expression to its prefix or postfix notation

Run "infix-parser help <command>" for more information about a command.
```

You can use the `convert` sub-command to parse infix expressions.

#### Example #1: Converting an infix expression to a prefix expression
```bash
pub run infix_expression_parser:main convert '(a-b/c)*(a/d-e)'  --prefix
*-a/bc-/ade
```

#### Example #2: Converting an infix expression to a postfix expression
```bash
pub run infix_expression_parser:main convert '(a-b/c)*(a/d-e)'  --postfix
abc/-ad/e-*
```

## Future improvements
- A sub-command for evaluating expressions in the command line may come in future iterations of this package
- Support for other mathematical operations, functions and symbols may come come in future iterations of this package
