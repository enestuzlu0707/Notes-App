class AddFullTextIndexesToNotes < ActiveRecord::Migration[5.1]
  def up
    execute "
      CREATE INDEX idx_notes_title_fulltext ON notes USING gin(to_tsvector('english', title));
      CREATE INDEX idx_notes_content_fulltext  ON notes USING gin(to_tsvector('english', content));
    "
  end

  def down 
    execute "
      DROP INDEX idx_notes_title_fulltext;
      DROP INDEX idx_notes_content_fulltext;
    "
  end
end
