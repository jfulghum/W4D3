class AddOwerValidation < ActiveRecord::Migration[5.1]
  def change
    change_column_null :cats, :user_id, false
  end
end
