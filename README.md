# binary-search-tree
## Assignment:

1. Build a **Node** class. It should have an attribute for the data it stores as well as its left and right children. As a bonus, try including the **Comparable** module and compare nodes using their data attribute.

2. Build a **Tree** class which accepts an array when initialized. The Tree class should have a root attribute which uses the return value of **#build_tree** which you’ll write next.

3. Write a **#build_tree method** which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!).

4. Write an **#insert** and **#delete** method which accepts a value to insert/delete (you’ll have to deal with several cases for delete such as when a node has children or not).

5. Write a **#find** method which accepts a value and returns the node with the given value.

6. Write a **#level_order** method that returns an array of values. This method should traverse the tree in breadth-first level order. This method can be implemented using either iteration or recursion (try implementing both!).

7. Write **#inorder**, **#preorder**, and **#postorder** methods that returns an array of values. Each method should traverse the tree in their respective depth-first order.

8. Write a **#height** method which accepts a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.

9. Write a **#depth** method which accepts a node and returns its depth. Depth is defined as the number of edges in path from a given node to the tree’s root node.

10. Write a **#balanced?** method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.

11. Write a **#rebalance** method which rebalances an unbalanced tree.
