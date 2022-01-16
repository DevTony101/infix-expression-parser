abstract class BinaryTreeNode<T> {
  T? data;
  BinaryTreeNode<T>? leftChild, rightChild;

  T? getValue();
  void assignLeftChild(BinaryTreeNode<T>? child);
  void assignRightChild(BinaryTreeNode<T>? child);
  BinaryTreeNode<T>? getLeftChild();
  BinaryTreeNode<T>? getRightChild();
}
