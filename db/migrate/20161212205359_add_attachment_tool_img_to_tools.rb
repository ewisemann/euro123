class AddAttachmentToolImgToTools < ActiveRecord::Migration
  def self.up
    change_table :tools do |t|
      t.attachment :tool_img
    end
  end

  def self.down
    remove_attachment :tools, :tool_img
  end
end
