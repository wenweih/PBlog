module  TabHelper
  def nav_active(options = {})
    # path 的格式类型为 controller_name#action_name
    if path = options.delete(:path)
      if path.respond_to?(:each)
        c = path.map { |p| p.split('#').first }
        a = path.map { |p| p.split('#').last }
      else
        c, a, _ = path.split('#')
      end
    elsif action = options.delete(:action)
      a = action
    else
      c = options.delete(:controller)
    end
    if c && a
      # When given both options, make sure BOTH are active
      klass = current_controller?(*c) && current_action?(*a) ? 'active' : ''
    else
      # Otherwise check EITHER option
      klass = current_controller?(*c) || current_action?(*a) ? 'active' : ''
    end
    klass
  end
end
