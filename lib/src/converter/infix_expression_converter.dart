import '../binary_tree/node.dart';
import 'package:stack/stack.dart';
import 'package:string_validator/string_validator.dart';

class InfixExpressionConverter {
  late final String _expression;
  late final Map _operatorsPriority;
  late final Node _root;
  late String _prefixNotation, _postfixNotation;

  InfixExpressionConverter({required String expression}) {
    _expression = '($expression)';
    _operatorsPriority = {')': 0, '+': 1, '-': 1, '/': 2, '*': 2, '^': 3};
    _root = _buildTree();
  }

  String toPostfixNotation() {
    _postfixNotation = '';
    _postOrderTraversal(_root);
    return _postfixNotation;
  }

  String toPrefixNotation() {
    _prefixNotation = '';
    _preOrderTraversal(_root);
    return _prefixNotation;
  }

  void _postOrderTraversal(Node? node) {
    if (node != null) {
      if (node.getLeftChild() != null) _postOrderTraversal(node.getLeftChild() as Node);
      if (node.getRightChild() != null) _postOrderTraversal(node.getRightChild() as Node);
      _postfixNotation += node.getValue() ?? '';
    }
  }

  void _preOrderTraversal(Node? node) {
    if (node != null) {
      _prefixNotation += node.getValue() ?? '';
      if (node.getLeftChild() != null) _preOrderTraversal(node.getLeftChild() as Node);
      if (node.getRightChild() != null) _preOrderTraversal(node.getRightChild() as Node);
    }
  }

  Node _buildTree() {
    final tokens = _expression.split('');
    final nodeStack = Stack<Node>();
    final charStack = Stack<String>();
    Node? currentNode, rightSibling, leftSibling;
    for (var token in tokens) {
      if (token == '(') {
        charStack.push(token);
      } else if (isAlpha(token)) {
        currentNode = Node.fromData(data: token);
        nodeStack.push(currentNode);
      } else if (_getPriority(token) > 0) {
        final tokenIsPower = token == '^';
        final tokenPriority = _getPriority(token);
        final getPriorityOfCharStackTop = () => _getPriority(charStack.isNotEmpty ? charStack.top() : null);
        final tokenIsPowerAndIsNotPriority = () => tokenIsPower && getPriorityOfCharStackTop() > tokenPriority;
        final tokenIsNotPowerAndIsNotPriority = () => !tokenIsPower && getPriorityOfCharStackTop() >= tokenPriority;
        while (charStack.isNotEmpty && charStack.top() != '(' && (tokenIsPowerAndIsNotPriority() || tokenIsNotPowerAndIsNotPriority())) {
          currentNode = Node.fromData(data: charStack.pop());
          rightSibling = nodeStack.isNotEmpty ? nodeStack.pop() : null;
          leftSibling = nodeStack.isNotEmpty ? nodeStack.pop() : null;
          currentNode.assignLeftChild(leftSibling);
          currentNode.assignRightChild(rightSibling);
          nodeStack.push(currentNode);
        }
        charStack.push(token);
      } else if (token == ')') {
        while (charStack.isNotEmpty && charStack.top() != '(') {
          currentNode = Node.fromData(data: charStack.pop());
          rightSibling = nodeStack.isNotEmpty ? nodeStack.pop() : null;
          leftSibling = nodeStack.isNotEmpty ? nodeStack.pop() : null;
          currentNode.assignLeftChild(leftSibling);
          currentNode.assignRightChild(rightSibling);
          nodeStack.push(currentNode);
        }

        if (charStack.isNotEmpty) charStack.pop();
      }
    }

    return nodeStack.top();
  }

  int _getPriority(String? token) {
    if (token != null && _operatorsPriority.keys.contains(token)) {
      return _operatorsPriority[token];
    }
    return -1;
  }
}
