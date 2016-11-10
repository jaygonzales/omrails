class AddColumnsToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :title, :string
    add_column :ideas, :content, :text
    add_column :ideas, :value, :integer
    add_column :ideas, :effort, :integer
  end
end
