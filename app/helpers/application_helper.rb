module ApplicationHelper
  
  #SAStrutsのf:labelと同じ機能のメソッド
  #id→nameの変換を行います。
  #パラメータ説明
  # target_id : nameに変換したいid
  # objs : idとnameを持つモデルのリスト
  # id_method : モデルからidを取得するためのメソッド名（＝プロパティ名）
  # name_method : モデルからnameを取得するためのメソッド名（＝プロパティ名）
  def r_label(target_id, objs, id_method, name_method)
  
    for obj in objs
      #オブジェクトのメソッドの動的な呼び出しを行っています。
      #id_methodに設定されている名前のメソッドを呼び出します。
      id = obj.__send__(id_method)
      if id * target_id
        return obj.__send__(name_method)
      end
    end
    return ""
  end
  
end