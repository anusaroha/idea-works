class AddIdeaReferencesToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :idea, index: true, foreign_key: true
  end
end
