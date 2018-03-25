# Implement an algorithm to delete a node in the middle (i.e. any node but the first and last node, not necessarily the
# exact middle) of a singly linked list, given only access to that node.

#Example:
#Input: The node c from the linked list a->b->c->d->e->f
#Result: nothing is returned, but the new linked list looks like a->b->d->e->f

require_relative 'linked_list'

ll = LinkedList.new('a')
ll.add('b')
ll.add('c')
ll.add('d')
ll.add('e')
ll.add('f')
puts ll.to_a.inspect

ll.delete('c')
puts ll.to_a.inspect
