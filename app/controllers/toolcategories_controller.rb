class ToolcategoriesController < ApplicationController

before_action :find_tool, only: [:edit, :update, :show, :destroy]
layout "applicationadmin"
	#def toolshome
	#	render :layout => "applicationtool"
	#end

	def index
		
		@toolcategories=Toolcategory.all.order("level1, level2, level3")
	
		
	end

	def show
		#Rails.logger.debug params.inspect
		
	end

	def new
		@toolcategory=Toolcategory.new
		
	end

	def create
		@toolcategory=Toolcategory.new(tool_params)
		
		if @toolcategory.save
			redirect_to toolcategories_path
		else
			render "new"
		end
	end

	def edit
		
	end

	def update
		
		if @toolcategory.update(tool_params)
			redirect_to toolcategories_path
		else
			render "edit"
		end
	end

	def destroy
		@toolcategory.destroy
		redirect_to toolcategories_path
	end

	private
	def tool_params
		params.require(:toolcategory).permit(:level1, :level2, :level3)
	end

	def find_tool
		@toolcategory=Toolcategory.find(params[:id])
	end

end
