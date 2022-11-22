class StudentsController < ApplicationController

  def index
    if params[:name] 
      students = Student.all.filter do |t|
        t.first_name.downcase.include?(params[:name]) || t.last_name.downcase.include?(params[:name])
        end

      render json: students

    else
      students = Student.all
      render json: students
    end

  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
