class LoginsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @logins = Login.order(sort_column + ' ' + sort_direction).page params[:page]
    if params[:mac_filter].present?
      @logins = @logins.where("username like '%#{params[:mac_filter]}%'")
    end
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
      redirect_to logins_path, flash: { success: "Успешно добавлено" }
    else
      flash[:alert] = 'Не удалось создать'
      render "new"
    end
  end

  def edit
    @login = Login.find(params[:id])
  end

  def destroy
    @login = Login.find(params[:id])
    @login.destroy
    redirect_back(fallback_location: logins_path)
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

  def sort_column
    Login.column_names.include?(params[:sort_by]) ? params[:sort_by] : 'id'
  end

  def sort_direction
    %w[asc desc].include?(params[:dir]) ? params[:dir] : 'asc'
  end

end
