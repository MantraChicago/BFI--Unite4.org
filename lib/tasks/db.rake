namespace :db do
  desc "Annotates our models with the db schema"
  task :annotate do
    `bundle exec annotate --position=after`
  end
end
