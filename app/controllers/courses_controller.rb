class CoursesController < ApplicationController
	def index
		@courses=Course.all
		if params[:name].present?
			@courses=@courses.where("name like ?","%#{params[:name]}%")
		end
		if params[:teacher].present?
			@courses=@courses.where("name like ?","%#{params[:teacher]}%")
		end
		if params[:time].present?
			@courses=@courses.where("name like ?","%#{params[:time]}%")
		end
		if params[:place].present?
			@courses=@courses.where("name like ?","%#{params[:place]}%")
		end
		if params[:credit].present?
			@courses=@courses.where("name like ?","%#{params[:credit]}%")
		end
	end

	def show
		@course=Course.find(params[:id])
		
	end

	def new
		@course=Course.new
	end

	def create
		@course=Course.new(course_params)
		if @course.save
			redirect_to root_path
		else
			render :new
		end
		
	end

	def destroy
		@course=Course.find(params[:id])
		@course.destroy
		redirect_to root_path				
	end

	def edit
		@course=Course.find(params[:id])
		
	end

	def update
		@course=Course.find(params[:id])
		if @course.update(course_params)
			redirect_to root_path
		else
			render :edit
		end
		
	end

	private
	def course_params
		params.require(:course).permit(:name ,:teacher, :time ,:place ,:credit)
		
	end
end
