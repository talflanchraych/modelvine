def height_to_inches
  height = 48.0
  height_arr = []
  while height <= 84.0
    height_arr << [human_readable_height(height), height]
    height += 1.0
  end
  p height_arr  
end

def human_readable_height(start_inches)
  inches = start_inches.to_i % 12
  feet = start_inches.to_i / 12
  human_select = "#{feet.to_s}\"#{inches.to_s}\'"
end

height_to_inches