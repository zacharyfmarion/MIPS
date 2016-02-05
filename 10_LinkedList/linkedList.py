class Node:
    def __init__(this, val=None, nextNode=None):
        this.val = val
        this.nextNode = nextNode

head = None

def addToList(val):
    global head
    node = Node(val)
    if not head:
        head = node
        node.nextNode = None
    elif node.val < head.val:
        node.nextNode = head
        head = node
    else:
        curr = head
        while curr.nextNode:
            if node.val < curr.nextNode.val:
                node.nextNode = curr.nextNode
                curr.nextNode = node
                break
            curr = curr.nextNode
        curr.nextNode = node

def printList():
    global head
    curr = head
    while curr:
        print(curr.val)
        curr = curr.nextNode

def main():
    # Insert into linked list
    addToList(5)
    addToList(3)
    addToList(8)
    printList()

if __name__ == "__main__":
    main()
