class AddIdeaReferencesToJoins < ActiveRecord::Migration
  def change
    add_reference :joins, :idea, index: true, foreign_key: true
  end
end
