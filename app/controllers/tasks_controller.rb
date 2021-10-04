class TasksController < ApplicationController
  def index
    @tasks = Task.all #allメソッドでtasksテーブルの全ての情報を取得する
  end
  
  #新規登録
  def new
        @task = Task.new #views/index.html.erbのnew_taskのリンク
  end
  
  #DBに新規登録
  def create
      @task = Task.new(params.require(:task).permit(:name, :email, :age, :introduction))
      if @task.save
        flash[:notice] = "ユーザーを新規登録しました"
        redirect_to :tasks
      else
        render "new"
      end
  end
  
  #showアクション（読み取り）
  def show
      @task = Task.find(params[:id])
  end
  
  #editアクション（編集）
  def edit
    @task = Task.find(params[:id])
  end
  
  #updateアクション（編集）
    def update
      @task = Task.find(params[:id])
      if @task.update(params.require(:task).permit(:name, :email, :age, :introduction))
        flash[:notice] = "スケジュール情報を更新しました"
        redirect_to :tasks
      else
        render "edit"
      end
    end
  
  
#削除のアクション
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :tasks
  end
  
end
