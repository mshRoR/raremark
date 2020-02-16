# search/lib/tasks/model_sync.rake
namespace :models_sync do
    desc 'Copy common models and tests from admin apps'
    task models_copy: :environment do
        source_path = "#{File.expand_path('../admin/')}"
        dest_path = "#{File.expand_path('../search/')}"

        # Copy all models & tests
        %x{cp #{source_path}/app/models/*.rb #{dest_path}/app/models/}
        %x{cp #{source_path}/spec/models/*_spec.rb #{dest_path}/spec/models}

        # Factories
        %x{cp #{source_path}/spec/factories/*.rb #{dest_path}/spec/factories/}

        # Database YML
        %x{cp #{source_path}/config/database.yml #{dest_path}/config/database.yml}
    end
end