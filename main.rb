require_relative 'tree'

# Test tree construction
arr = [4, 2, 6, 1, 3, 5, 7, 7]
binary_tree = Tree.new(arr)
puts "Binary Tree Construction Test:"
binary_tree.pretty_print

# Test insertion
puts "\nInsertion Test:"
binary_tree.insert(8)
binary_tree.pretty_print

# Test deletion
puts "\nDeletion Test:"
binary_tree.delete(8)
binary_tree.pretty_print

# Test level order traversal
puts "\nLevel Order Traversal Test:"
binary_tree.level_order { |node| puts node.data }

# Test inorder traversal
puts "\nInorder Traversal Test:"
binary_tree.inorder { |node| puts node.data }

# Test preorder traversal
puts "\nPreorder Traversal Test:"
binary_tree.preorder { |node| puts node.data }

# Test postorder traversal
puts "\nPostorder Traversal Test:"
binary_tree.postorder { |node| puts node.data }

# Test search
puts "\nSearch Test:"
result = binary_tree.find(6)
raise "Node not found" if result.nil?
puts "Node found: #{result.data}"