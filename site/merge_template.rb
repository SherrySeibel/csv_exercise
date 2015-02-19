require_relative("curriculum_maker")

this_directory = File.dirname(__FILE__)
site_directory = File.join(this_directory, "site")
asset_directory = File.join(site_directory, "_assets")
target_directory = File.join(site_directory, "programs")

curriculum_maker = CurriculumMaker.new
content = curriculum_maker.render
puts content
