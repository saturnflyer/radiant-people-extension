namespace :radiant do
  namespace :extensions do
    namespace :people do
      
      desc "Runs the migration of the People extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PeopleExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PeopleExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the People to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from PeopleExtension"
        Dir[PeopleExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PeopleExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
