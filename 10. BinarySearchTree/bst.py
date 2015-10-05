class Node:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

    # From www.laurentluce.com/posts/binary-search-tree-library-in-python/
    def addNode(self, x):
        if (self.val):
            if (x < self.val):
                if (self.left is None):
                    self.left = Node(x)
                else:
                    self.left.addNode(x)
            else:
                if (self.right is None):
                    self.right = Node(x)
                else:
                    self.right.addNode(x)

    def printTree(self):
        if (self == None):
            return
        print(self.val)
        if (self.left is not None):
            self.left.printTree()
        if (self.right is not None):
            self.right.printTree()

def main():
    root = Node(5);
    root.addNode(8);
    root.addNode(19);
    root.addNode(6);
    root.addNode(19);
    root.addNode(4);
    root.addNode(1);
    root.addNode(9);
    root.addNode(23);
    root.addNode(6);
    root.printTree()

if __name__ == "__main__":
    main()
