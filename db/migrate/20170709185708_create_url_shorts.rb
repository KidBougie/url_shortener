class CreateUrlShorts < ActiveRecord::Migration[5.1]
  def change
    create_table :url_shorts do |t|
      t.string :original_url
      t.string :short_url

      t.timestamps
    end
  end
end
