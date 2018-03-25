require_relative 'linked_list'

# Write code to remove duplicates from an unsorted linked list

ll = LinkedList.new('b')
ll.add('a')
ll.add('c')
ll.add('c')
puts ll.to_a.inspect

already_seen = []
current = ll.head
while (current && current.next)
  if already_seen.include? current.next.val
    current.next = current.next.next
  else
    already_seen.push(current.next.val)
  end
  current = current.next
end

puts ll.to_a.inspect # should be b->a->c

ll.add('c')
# Follow up: how would you solve this problem if a temporary buffer is not allowed.
# My thinking was that we'd just sort the list prior.  But they suggest using the runner method.  So let's code it up with a runner.

puts ll.to_a.inspect
current = ll.head
while (current)
  runner = current

  while (runner.next)
    if runner.next.val == current.val
      runner.next = runner.next.next
    else
      runner = runner.next
    end
  end

  current = current.next
end
puts ll.to_a.inspect # should be b->a->c
