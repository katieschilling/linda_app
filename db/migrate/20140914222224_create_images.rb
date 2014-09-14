class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.belongs_to :gallery
    	t.string     :title
    	t.string     :date
    	t.text       :description
    	t.timestamps
    end
  end
end
