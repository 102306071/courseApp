class CoursesController < ApplicationController
	def index
		if params[:name].blank?
			if params[:teacher].blank?
				if params[:time].blank?
					@courses=Course.all
				end
			end
		end
		if params[:name].present? 
			if params[:teacher].present?
				if params[:time].present?
					@courses = Course.where("name like ?","%#{params[:name]}%").where("teacher like ?","%#{params[:teacher]}%").where("time like ?","%#{params[:time]}%")
				end
				if params[:time].blank?
					@courses = Course.where("name like ?","%#{params[:name]}%").where("teacher like ?","%#{params[:teacher]}%")
				end
			end
			if params[:teacher].blank?
				if params[:time].present?
					@courses = Course.where("name like ?","%#{params[:name]}%").where("time like ?","%#{params[:time]}%")
				end
				if params[:time].blank?
					@courses = Course.where("name like ?","%#{params[:name]}%")
				end
			end
		end
		if params[:name].blank?
			if params[:teacher].present?
				if params[:time].present?
					@courses = Course.where("teacher like ?","%#{params[:teacher]}%").where("time like ?","%#{params[:time]}%")
				end
				if params[:time].blank?
					@courses = Course.where("teacher like ?","%#{params[:teacher]}%")
				end
			end
		end
		if params[:name].blank?
			if params[:teacher].blank?
				if params[:time].present?
					@courses = Course.where("time like ?","%#{params[:time]}%")
				end
			end	
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
