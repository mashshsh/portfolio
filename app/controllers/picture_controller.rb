class PictureController < ApplicationController
 
  #一覧画面表示
  def index
    @departments = Department.find(:all)
    @employees = Employee.find(:all)
    render :action => 'index.html.erb'
  end
  
  #編集画面表示
  def edit
    @departments = Department.find(:all)
    @employee = Employee.find(params[:id])
    render :action => 'edit.html.erb'
  end
  
  #編集内容確認画面表示
  def confirm
    @department_name = Department.find(params[:employee][:department_id]).name
    @employee = Employee.new(params[:employee])
    #idはコピーされないので、個別にコピーします。
    @employee.id = params[:employee][:id]
    
    #バリデーションチェック
    if @employee.valid?
      render :action => 'confirm.html.erb'
    else
      #エラー
      @departments = Department.find(:all)
      render :action => 'edit.html.erb'
    end
  end
  
  #編集内容確認画面→編集画面に戻る
  def backToEdit
    @departments = Department.find(:all)
    @employee = Employee.new(params[:employee])
    #idはコピーされないので、個別にコピーします。
    @employee.id = params[:employee][:id]
    render :action => 'edit.html.erb'
  end
  
  #更新処理
  def store
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      flash[:notice] = 'DenpyoMeisai was successfully updated.'
      index
    else
      #エラー
      confirm
    end
  end
  
end