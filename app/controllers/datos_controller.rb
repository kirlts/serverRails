class DatosController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_dato, only: [:show, :update, :destroy]

  def index
    @datos = Dato.all
    render json: @datos
  end

  def show
    render json: @dato
  end

  def create
    @dato = Dato.new(dato_params)

    if @dato.save
      render json: @dato, status: :created
    else
      render json: @dato.errors, status: :unprocessable_entity
    end
  end

  def update
    if @dato.update(dato_params)
      render json: @dato
    else
      render json: @dato.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dato.destroy
    head :no_content
  end

  private

  def set_dato
    @dato = Dato.find(params[:id])
  end

  def dato_params
    params.require(:dato).permit(:nombre, :descripcion)
  end
end
