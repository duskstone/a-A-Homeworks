class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      #1 prereqs of Auth 
      # email/session_token ALWAYS unique and indexed
      t.string :email, null: false, index: {unique: true} # add_index :users, :email, unique: true
      t.string :password_digest, null: false  
      t.string :session_token, null: false, index: {unique: true} # add_index :users, :session_token, unique: true
      
      #password_digest/session_token always a string (cookies)

      t.timestamps
    end
  end
end
