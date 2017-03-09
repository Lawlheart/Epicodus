class MergeWorkersIntoUsers < ActiveRecord::Migration[5.0]
  def change
    # This will merge any pre-existing workers into the user class
    execute "
      INSERT INTO users(email, encrypted_password, sign_in_count, created_at, updated_at, worker)
      SELECT email, encrypted_password, sign_in_count, created_at, updated_at, TRUE FROM workers;
    "
  end
end
