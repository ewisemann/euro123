class Tool < ActiveRecord::Base
	belongs_to :toolcategory
	has_attached_file :tool_img, styles: { tool_index: "300x300>", tool_show: "500x500>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :tool_img, content_type: /\Aimage\/.*\z/
end
