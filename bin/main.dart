import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:infix_expression_parser/src/command/convert.dart';

void main(List<String> args) {
  const name = 'infix-parser';
  const description = 'A CLI tool for evaluating expressions in prefix or postfix notations or converting infix expressions.';
  final runner = CommandRunner(name, description)..addCommand(ConvertCommand());
  runner.run(args).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64);
  });
}
