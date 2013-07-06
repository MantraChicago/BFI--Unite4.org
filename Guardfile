# A sample Guardfile
# More info at https://github.com/guard/guard#readme

options = {
  :all_after_pass => true,     # run all specs after changed specs pass, default: false
  :all_on_start => true,       # run all the specs at startup, default: false
  :keep_failed => true,
  :cli => "--color --format nested"
}

guard :rspec, options do
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb"] }
end



