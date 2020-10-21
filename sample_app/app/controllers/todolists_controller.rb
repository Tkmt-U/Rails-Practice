class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)# データを新規登録するためのインスタンス
    list.save# データをDBに保存するためのsaveメソッド
    redirect_to todolist_path(list.id)# トップ画面へリダイレクト
  end

  def index
    puts "作成したキー #{ENV['SECRET_KEY']}"
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #レコードを取得
    list.destroy #レコードを削除
    redirect_to todolists_path #一覧へ
  end

  private # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
