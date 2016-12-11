module ApplicationHelper
	#Returns the full title on a per-page basis
	def full_title(page_title = '')
		base_title="European Design"
		if page_title.empty?
			base_title
		else
			page_title + "|" + base_title
		end
	end

	def noext_asset_path(path)
		if Rails.env.development?
			filepath = path
			filepath_without_extension=File.join(File.dirname(filepath), File.basename(filepath, '.*'))
			"/assets/#{filepath_without_extension}"
		else			
			filepath = asset_path(path)
			filepath_without_extension=File.join(File.dirname(filepath), File.basename(filepath, '.*'))
		end
	end

	
end
