# An AVL tree (Georgy Adelson-Velsky and Landis' tree, named after the inventors) is a self-balancing binary search tree. In an AVL tree, the heights of the two child subtrees of any node differ by at most one; if at any time they differ by more than one, rebalancing is done to restore this property.

static Node insert(Node root,int val) {
   if(root == null) {
       root = new Node();
       root.val = val;
       root.ht = setHeight(root);
       return root;
   }
   if(val <= root.val) {
       root.left = insert(root.left, val);
   }
   else if (val > root.val) {
       root.right = insert(root.right, val);
   }
   int balance = height(root.left) - height(root.right);

   if(balance > 1) {
       if(height(root.left.left) >= height(root.left.right)) {
           root = rightRotation(root);
       }
       else {
           root.left = leftRotation(root.left);
           root = rightRotation(root);
       }
   }
   else if(balance < -1) {
       if(height(root.right.right) >= height(root.right.left)) {
           root = leftRotation(root);
       }
       else {
           root.right = rightRotation(root.right);
           root = leftRotation(root);
       }
   }
   else {
       root.ht = setHeight(root);
   }
   return root;
}

private static Node rightRotation(Node root) {
   Node newRoot = root.left;
   root.left = newRoot.right;
   newRoot.right = root;
   root.ht = setHeight(root);
   newRoot.ht = setHeight(newRoot);
   return newRoot;
}

private static Node leftRotation(Node root) {
   Node newRoot = root.right;
   root.right = newRoot.left;
   newRoot.left = root;
   root.ht = setHeight(root);
   newRoot.ht = setHeight(newRoot);
   return newRoot;
}

private static int height(Node root) {
   if(root == null)
       return -1;
   else
       return root.ht;
}

private static int setHeight(Node root) {
   if(root == null) {
       return -1;
   }
   else {
       return 1 + Math.max(height(root.left), height(root.right));
   }
}
