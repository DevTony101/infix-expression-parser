import 'binary_tree_node.dart';

class Node extends BinaryTreeNode<String> {
  Node();

  Node.fromData({required String data}) {
    this.data = data;
  }

  Node.fromNode({required Node node}) {
    data = node.data;
    leftChild = node.leftChild;
    rightChild = node.rightChild;
  }

  @override
  void assignLeftChild(BinaryTreeNode<String>? child) {
    leftChild = child;
  }

  @override
  void assignRightChild(BinaryTreeNode<String>? child) {
    rightChild = child;
  }

  @override
  BinaryTreeNode<String>? getLeftChild() {
    return leftChild;
  }

  @override
  BinaryTreeNode<String>? getRightChild() {
    return rightChild;
  }

  @override
  String? getValue() {
    return data;
  }
}
