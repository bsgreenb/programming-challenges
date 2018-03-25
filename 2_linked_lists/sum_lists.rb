require_relative 'linked_list'
ll1 = LinkedList.new('7')
ll1.add('1')
ll1.add('6')

ll2 = LinkedList.new('5')
ll2.add('9')
ll2.add('2')

def sum_lists(l1, l2)
   return l1
end

sum_lists(l1, l2)
# We expect it to output a LinkedList 9,1,2



puts ll.to_a.inspect
