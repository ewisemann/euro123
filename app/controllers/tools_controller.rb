class ToolsController < ApplicationController
	before_action :find_tool, only: [:edit, :update, :show, :destroy]

	def toolshome
		render :layout => "applicationtool"
	end

	def index
		@tools=Tool.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@tool=Tool.new
		@toolcategories=Toolcategory.all.order("level1, level2, level3").map{|tc| [tc.level1.to_s + " > " + tc.level2.to_s + " > " + tc.level3.to_s, tc.id] }
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
		params.require(:tool).permit(:title, :short_desc, :long_desc, :toolcategory_id)
	end

	def find_tool
		@tool=Tool.find(params[:id])
	end


end