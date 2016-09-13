module ApplicationHelper

  EMPTY_STRING = ''.freeze

  def title(text)
    content_for :title,text
  end

  def meta_tag(tag,text)
    content_for :"meta_#{tag}",text
  end

  def yield_meta_tag(tag,default_text=" ")
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

  def header_helper
    if controller_name == "post" && action_name == "index"
      render 'fixed_header'
    else
      render 'header'
    end
  end

  # 给定 controller name 是否是当前的 controller
  # Examples
  #
  #   # On TreeController
  #   current_controller?(:tree)           # => true
  #   current_controller?(:commits)        # => false
  #   current_controller?(:commits, :tree) # => true
  def current_controller?(*args)
    args.any? do |v|
      v.to_s.downcase == controller.controller_name || v.to_s.downcase == controller.controller_path
    end
  end

  # 给定 action name 是否是当前的 action
  def current_action?(*args)
    args.any? { |v| v.to_s.downcase == action_name }
  end

end
