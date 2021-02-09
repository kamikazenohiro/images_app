class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_message, only: [:edit, :update, :destroy]

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      redirect_to new_message_path, flash:{miss: '投稿するには画像を選択してください'}
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @message.user_id
      @message.destroy
    end
    redirect_to root_path
  end

  private
  def message_params
    params.require(:message).permit(:content, images: []).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end