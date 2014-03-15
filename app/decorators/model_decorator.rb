class ModelDecorator < Draper::Decorator
  delegate :height 

  def inches_to_height
    inches = object.height.to_i  % 12
    feet = object.height.to_i / 12
    human_select = "#{feet.to_s}\" #{inches.to_s}\'"
  end

end