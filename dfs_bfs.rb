def dfs(target_value = nil, &prc)
    raise "Need a proc or target!" if [target_value, prc].none?
    prc ||= Proc.new{  |node| node.value == target_value }

    return self if prc.call(self)
        
        children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end
        nil
end

def bfs(target_value = nil, &prc)
    raise "Need a proc or target!" if [target_value, prc].none?
    prc ||= Proc.new{  |node| node.value == target_value }

    nodes = [self]
    until nodes.empty?
        node = nodes.shift

        return node if prc.call(node)
        nodes.concat(node.children)
    end
    nil
end