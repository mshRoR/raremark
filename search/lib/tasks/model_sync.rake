# search/lib/tasks/model_sync.rake
namespace :models_sync do
    desc 'Copy common models and tests from admin apps'
    task models_copy: :environment do
        source_path = "/home/shajed/raremark/admin/"
        dest_path = "/home/shajed/raremark/search"

        # Copy all models & tests
        %x{cp #{source_path}/app/models/*.rb #{dest_path}/app/models/}
        %x{cp #{source_path}/test/models/*_test.rb #{dest_path}/test/models}

        # Fixtures
        %x{cp #{source_path}/test/fixtures/*.yml #{dest_path}/test/fixtures/}

        # Database YML
        %x{cp #{source_path}/config/database.yml #{dest_path}/config/database.yml}
    end
end