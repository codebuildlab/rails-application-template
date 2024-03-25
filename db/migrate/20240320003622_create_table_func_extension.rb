class CreateTableFuncExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'tablefunc' unless extension_enabled?('tablefunc')
  end
end
