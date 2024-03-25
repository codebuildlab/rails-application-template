class CreateFuzzyStrMatchExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'fuzzystrmatch' unless extension_enabled?('fuzzystrmatch')
  end
end
