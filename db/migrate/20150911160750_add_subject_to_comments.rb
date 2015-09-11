class AddSubjectToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :subject, polymorphic: true, index: true
  end
end
