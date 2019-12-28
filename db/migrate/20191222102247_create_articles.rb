class CreateArticles < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE article_source AS ENUM ('blog', 'facebook', 'tweet', 'other');
    SQL

    create_table :articles do |t|
      t.string :name, null: false
      t.text :content, default: ''
      t.integer :story_id, null: false

      t.timestamps

      t.index :name
      t.index :story_id
    end

    add_column :articles, :source, :article_source
    add_index :articles, :source

    add_foreign_key :articles, :stories
  end

  def down
    drop_table :articles

    execute <<-SQL
      DROP TYPE article_source;
    SQL
  end
end
