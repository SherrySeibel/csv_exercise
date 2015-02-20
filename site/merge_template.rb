require_relative("curriculum_maker")

this_directory = File.dirname(__FILE__)
site_directory = File.join(this_directory, "site")
assets_directory = File.join(site_directory, "_assets")
target_directory = File.join(site_directory, "programs")

semester_files = ["first_semester.csv", "second_semester.csv"]
template_file = "graphic_design.html.erb"
target_file = "graphic-design.htm"

curriculum_maker = CurriculumMaker.new

template_path = File.join(assets_directory, template_file)
curriculum_maker.add_template(template_path)

semester_files.each do |semester_file|
  semester_path = File.join(assets_dir, semester_file)
  curriculum_maker.add_course_data(semester_path)
end

content = curriculum_maker.render
# puts content

output_path =  File.join(target_directory, target_file)
File.open(output_path, "w+") do |file|
  file.write(content)
end
