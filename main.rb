require_relative 'tree'

random_numbers = Array.new(15) { rand(1..100) }
tree = Tree.new(random_numbers)

puts "Is the tree balanced? #{tree.balanced?}"

puts "\nLevel Order Traversal:"
tree.level_order { |node| print "#{node.data} " }
puts "\n\nPreorder Traversal:"
tree.preorder { |node| print "#{node.data} " }
puts "\n\nPostorder Traversal:"
tree.postorder { |node| print "#{node.data} " }
puts "\n\nInorder Traversal:"
tree.inorder { |node| print "#{node.data} " }

tree.insert(110)
tree.insert(120)
tree.insert(130)

puts "\n\nIs the tree unbalanced? #{tree.balanced?}"

tree.rebalance

puts "\nIs the tree balanced after rebalancing? #{tree.balanced?}"

puts "\nLevel Order Traversal after rebalancing:"
tree.pretty_print

puts "\n\nPreorder Traversal after rebalancing:"
tree.preorder { |node| print "#{node.data} " }
puts "\n\nPostorder Traversal after rebalancing:"
tree.postorder { |node| print "#{node.data} " }
puts "\n\nInorder Traversal after rebalancing:"
tree.inorder { |node| print "#{node.data} " }