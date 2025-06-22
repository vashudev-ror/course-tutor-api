module Api
  module V1
    class CoursesController < ApplicationController
      def index
        courses = Course.includes(:tutors).page(params[:page]).per(params[:per_page] || 10)

        render json: courses, status: :ok, meta: pagination_meta(courses)
      end

      def create
        course = Course.new(course_params)

        if course.save
          render json: course, status: :created
        else
          render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def pagination_meta(object)
        {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.prev_page,
          total_pages: object.total_pages,
          total_count: object.total_count
        }
      end

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
