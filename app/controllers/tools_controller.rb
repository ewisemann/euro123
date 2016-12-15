class ToolsController < ApplicationController
	before_action :find_tool, only: [:edit, :update, :show, :destroy]

	#def toolshome
	#	render :layout => "applicationtool"
	#end

	def index
		if params[:tcat1].blank?
			@tools=Tool.all.order("created_at DESC")
		else 
			if params[:tcat2].blank?
				@toolcategory_id = Toolcategory.where(level1: params[:tcat1]).ids
				@tools = Tool.where(:toolcategory_id => @toolcategory_id)
			else
				@toolcategory_id = Toolcategory.find_by(level1: params[:tcat1], level2: params[:tcat2],level3: params[:tcat3]).id	
				@tools = Tool.where(:toolcategory_id => @toolcategory_id)
			end
			
		end
		#if user is admin render admin else tool
		render layout: "applicationtool"
	end

	def show
		#Rails.logger.debug params.inspect
		render layout: "applicationtool"
	end

	def new
		@tool=Tool.new
		@toolcategories=Toolcategory.all.order("level1, level2, level3").map{|tc| [tc.level1.to_s + " > " + tc.level2.to_s + " > " + tc.level3.to_s, tc.id] }
		render layout: "applicationtool"
	end

	def create
		@tool=Tool.new(tool_params)
		@tool.toolcategory_id=params[:toolcategory_id]
		if @tool.save
			redirect_to tools_path
		else
			render "new"
		end
	end

	def edit
		@toolcategories=Toolcategory.all.order("level1, level2, level3").map{|tc| [tc.level1.to_s + " > " + tc.level2.to_s + " > " + tc.level3.to_s, tc.id] }
		render layout: "applicationtool"
	end

	def update
		@tool.toolcategory_id=params[:toolcategory_id]
		if @tool.update(tool_params)
			redirect_to tools_path
		else
			render "edit"
		end
	end

	def destroy
		@tool.destroy
		redirect_to tools_path
	end

	private
	def tool_params
		params.require(:tool).permit(:title, :short_desc, :long_desc, :toolcategory_id, :tool_img)
	end

	def find_tool
		@tool=Tool.find(params[:id])
	end


end