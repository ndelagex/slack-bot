class User < ApplicationRecord
  has_many :sent_transaction, :class_name => 'Transaction', :foreign_key => 'from_id'
  has_many :received_transaction, :class_name => 'Transaction', :foreign_key => 'to_id'
end
