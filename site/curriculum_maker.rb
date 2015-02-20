require "erb"
require "csv"

class CurriculumMaker
  include ERB::Util

  attr_reader :course_data, :template

  def initialize
    @course_data = []
    @template = "Template missing"
  end

  def add_template(file_path)
    @template = File.read(file_path)
  end

  def add_course_data(file_path)
    courses = CSV.read(file_path)
    header = courses.shift
    @course_data << { header: header, courses: courses }
  end

  def render
    ERB.new(@template).result(binding)
  end
end
