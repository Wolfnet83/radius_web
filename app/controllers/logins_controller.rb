class LoginsController < ApplicationController
  def index
    @logins = Login.page params[:page]
  end

  def new
    @login = Login.new
  end

  def create
    @login = Login.new(permitted_params)
    @login.username.upcase!
    @login.write_attribute('attribute', "Cleartext-Password")
    @login.op = ':='
    if @login.valid?
      @login.save
      redirect_to logins_path, notice: "Добавлено"
    else
      # flash[:alert] = 'Неудача'
      render "new"
    end
  end

  def edit
    @login = Login.find(params[:id])
  end

  def destroy
    @login = Login.find(params[:id])
    @login.destroy
    redirect_to logins_path
  end

  def update
    @login = Login.find(params[:id])
    if @login.update_attributes(permitted_params)
      redirect_to logins_path, notice: 'Updated'
    else
      render "edit"
    end
  end

  private
  def permitted_params
    params[:login].permit(:username, :given_name, :description, :comment)
  end
end
