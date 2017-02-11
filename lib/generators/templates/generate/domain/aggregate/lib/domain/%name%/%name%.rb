module <%= domain_name.camelize %>
  module Domain
    module <%= name.camelize %>
      self.head
        <%= options[:head_name].camelize %>
      end
    end
  end
end
