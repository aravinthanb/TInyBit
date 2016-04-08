module ApplicationHelper

  def bootstrap_class_for flash_type
        flash_type.to_s
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end
end
