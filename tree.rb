require_relative 'node'

class Tree
    attr_reader :root

    def initialize(arr)
        @root = build_tree(arr.uniq.sort)
    end

    def build_tree(arr, root = 0)
        return nil if arr.empty?

        mid = arr.length * 0.5
        root = Node.new(arr[mid])

        root.left = build_tree(arr[0...mid])
        root.right = build_tree(arr[mid + 1.. -1])

        return root
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insert(value, node = @root)
        return Node.new(value) if node.nil?

        if value < node.data
        node.left = insert(value, node.left)
        elsif value > node.data
        node.right = insert(value, node.right)
        end

        return node
    end

    def delete(value, node = @root)
        return node if node.nil?
    
        if value < node.data
            node.left = delete(value, node.left)
        elsif value > node.data
            node.right = delete(value, node.right)
        else
            if node.right.nil?
                return node.left
            elsif node.left.nil?
                return node.right
            else
                succ_parent = node
                succ = node.right
    
                while succ.left != nil
                    succ_parent = succ
                    succ = succ.left
                end
    
                if succ_parent != node
                    succ_parent.left = succ.right
                else
                    succ_parent.right = succ.right
                end
    
                node.data = succ.data
                node.right = delete(succ.data, node.right)
            end
        end
    
        node
    end
end

arr = [4, 2, 6, 1, 3, 5, 7, 7]
binary_tree = Tree.new(arr)
binary_tree.pretty_print(binary_tree.root)