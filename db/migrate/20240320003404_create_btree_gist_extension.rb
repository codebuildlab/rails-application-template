class CreateBtreeGistExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'btree_gist' unless extension_enabled?('btree_gist')
  end
end
