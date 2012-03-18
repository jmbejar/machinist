module Machinist
  module Generators #:nodoc:
    class ModelGenerator < Rails::Generators::NamedBase #:nodoc:
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      class_option :test_framework, :type => :string, :aliases => "-t", :desc => "Test framework to use Machinist with"

      def create_blueprint
        append_file blueprints_path, "\n#{class_name}.blueprint do\n  # Attributes here\nend\n"
      end

      protected

      def blueprints_path
        options[:test_framework] == :rspec ? "spec/support/blueprints.rb" : "test/blueprints.rb"
      end
    end
  end
end

