module Api
  module V1
    class CoursesController < ApplicationController
      def create
        course = Course.new(course_params)

        if course.save
          render json: course, status: :created
        else
          render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def course_params
        params.require(:course).permit(
          :title,
          :description,
          tutors_attributes: [:first_name, :last_name, :email]
        )
      end
    end
  end
end
