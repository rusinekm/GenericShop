class AddAttachmentPhotoToMerchandises < ActiveRecord::Migration
  def self.up
    change_table :merchandises do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :merchandises, :photo
  end
end
