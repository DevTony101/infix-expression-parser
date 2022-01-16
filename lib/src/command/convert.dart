import 'package:args/command_runner.dart';
import 'package:infix_expression_parser/src/converter/infix_expression_converter.dart';

class ConvertCommand extends Command {
  @override
  final name = 'convert';

  @override
  final description = 'Converts an expression to its prefix or postfix notation';

  ConvertCommand() {
    argParser.addFlag('prefix');
    argParser.addFlag('postfix');
  }

  @override
  void run() {
    final converter = InfixExpressionConverter(expression: argResults!.rest.first);
    if (argResults?['prefix']) {
      print(converter.toPrefixNotation());
    } else if (argResults?['postfix']) {
      print(converter.toPostfixNotation());
    }
  }
}
