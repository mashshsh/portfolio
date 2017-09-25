class Picture < ActiveRecord::Base
  
  validates_presence_of :name, :salary, :message => "を入力して下さい"
  
  #バリデーションエラーメッセージ内のプロパティ名を日本語にマッピングします。
  class << self
    HUMANIZED_ATTRIBUTE_KEY_NAMES = {
      "name" => "氏名",
      "salary" => "給与額"
    }
  
    def human_attribute_name(attribute_key_name)
      HUMANIZED_ATTRIBUTE_KEY_NAMES[attribute_key_name] || super
    end
    
  end
end