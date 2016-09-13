class Like < ApplicationRecord
  include Obfuscate

  belongs_to :post

  # 加密
  def encrypt_id
    encrypt self.id
  end

  # 解密
  def decrypt_id
    decrypt self.id
  end
end
