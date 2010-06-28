module NovelsHelper

  def add_tag_link(name)
    link_to_function name do |page|
      page.insert_html :bottom,:tags,:partial=>"tag",:object=>Tag.new
    end
  end
end
