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

	def create_tool_menu
    #toolcategories = (defined? @toolcategories) ? @toolcategories : Toolcategory.all.order("level1, level2, level3")
	    toolcategories = Toolcategory.all.order("level1, level2, level3")
	    menu = ""
	    exlevel1=""
	    exlevel2=""
	    exlevel3=""

	    toolcategories.each do |tc|





	    	if tc.level1? and not(exlevel1 == tc.level1.to_s)
	      		menu += "<h1>#{tc.level1}</h1><div>"
	      	end

	      	if tc.level2? and not(exlevel2 == tc.level2.to_s and (exlevel3 == tc.level3.to_s))
	      		#if not(exlevel3 == "") and not(tc.level3?)
	      		if not(exlevel2 == tc.level2.to_s)
		      		if not(exlevel3=="")
			      		menu += "</div>"
			      		menu += "<h2>#{tc.level2}</h2><div>"
		      		else
		      			menu += "<h2>#{tc.level2}</h2><div>"
		      		end
		      	end
	      	else
	      		menu += "</div>"
	      	end

	      	if tc.level3? and not((exlevel3 == tc.level3.to_s) and (exlevel2 == tc.level2.to_s))
	      		menu += "<h3>#{tc.level3}</h3><div></div>"
	      	else
	      		if tc.level2? 
	      			if not(exlevel3 == "")
	      				menu += "</div></div>"
	      			else
	      				menu += "</div>"
	      			end
	      		end
	      	end
	      	exlevel1=tc.level1.to_s
			exlevel2=tc.level2.to_s
	      	exlevel3=tc.level3.to_s

	    end
	    raw menu
  	end
end
