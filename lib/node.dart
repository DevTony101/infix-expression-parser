import 'binary_tree_node.dart';

class Node extends BinaryTreeNode<String> {
  Node();
  
  Node.fromData({String data}) {
    this.data = data;
    leftChild = Node();
    rightChild = Node();
  }

  Node.fromNode({Node node}) {
    data = node.data;
    leftChild = node.leftChild;
    rightChild = node.rightChild;
  }

  @override
  void assignLeftChild(BinaryTreeNode<String> child) {
    leftChild = child;
  }

  @override
  void assignRightChild(BinaryTreeNode<String> child) {
    rightChild = child;
  }

  @override
  BinaryTreeNode<String> getLeftChild() {
    return leftChild;
  }

  @override
  BinaryTreeNode<String> getRightChild() {
    return rightChild;
  }

  @override
  String getValue() {
    return data;
  }
}
