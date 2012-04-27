module ApplicationHelper
  def title
    base_title = "System Simulation Department"
    if @title.nil?
      base_title
    else
      "#{base_title}| #{@title}"
    end
  end
  def logo
    image_tag("ssd.png", :alt => "Simulation", :class => "round")
  end

end
