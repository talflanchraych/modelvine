module ApplicationHelper

	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Model Vine"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def is_default_photo?(photo_id)
  	current_user.default_photo_id == photo_id
  end
end
