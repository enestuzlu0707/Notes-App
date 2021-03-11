class ChangeNotePriorityToEnum < ActiveRecord::Migration[5.1]
  def up
    execute <<-DDL
      CREATE TYPE note_priorities AS ENUM (
        'low', 'medium', 'high'
      );
      ALTER TABLE notes
        ALTER COLUMN priority TYPE note_priorities
        USING priority::note_priorities;
    DDL
  end

  def down 
    change_column :notes, :priority, :string
    
    execute <<-DDL
      DROP TYPE note_priorities;
    DDL
  end
end
