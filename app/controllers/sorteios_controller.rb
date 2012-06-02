# encoding: UTF-8
class SorteiosController < ApplicationController

  # GET /sortear
  def sortear
    @sorteio = Sorteio.find(params[:id])
    @sorteio.sortear
    redirect_to sorteio_path(@sorteio_id), notice: 'Sorteio realizado.'
  end

  # GET /sorteios
  # GET /sorteios.json
  def index
    @sorteios = Sorteio.all
  end

  # GET /sorteios/1
  # GET /sorteios/1.json
  def show
    @sorteio = Sorteio.find(params[:id])
  end

  # GET /sorteios/new
  # GET /sorteios/new.json
  def new
    @sorteio = Sorteio.new
  end

  # GET /sorteios/1/edit
  def edit
    @sorteio = Sorteio.find(params[:id])
  end

  # POST /sorteios
  # POST /sorteios.json
  def create
    @sorteio = Sorteio.new(params[:sorteio])
    if @sorteio.save
      redirect_to @sorteio, notice: 'Sorteio criado.'
    else
      render action: "new"
    end
  end

  # PUT /sorteios/1
  # PUT /sorteios/1.json
  def update
    @sorteio = Sorteio.find(params[:id])
    if @sorteio.update_attributes(params[:sorteio])
      redirect_to @sorteio, notice: 'Sorteio atualizado.'
    else
      render action: "edit"
    end
  end

  # DELETE /sorteios/1
  # DELETE /sorteios/1.json
  def destroy
    @sorteio = Sorteio.find(params[:id])
    @sorteio.destroy
    redirect_to sorteios_url, notice: 'Sorteio removido.'
  end
end
