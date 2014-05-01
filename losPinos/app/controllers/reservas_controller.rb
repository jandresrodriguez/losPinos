class ReservasController < ApplicationController
  layout "reservas"

  before_action :set_reserva, only: [:show, :edit, :update, :destroy]

  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.all
  end

  # Display reservas with cliente, habitacion
  def display
    @reservas = Reserva.all
    render json: @reservas, include: [:cliente, :habitacion]
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
    @reserva.build_cliente
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)
    # Seteo el resto de los parametros
    @reserva.fehca_creacion = Time.now

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to reservas_url, notice: 'Reserva was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reserva }
      else
        format.html { render action: 'new' }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    respond_to do |format|
      
      if @reserva.update(reserva_params)
        format.html { redirect_to reservas_url, notice: 'Reserva was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url }
      format.json { head :no_content }
    end
  end

  def confirmar
    @reserva = Reserva.find(params[:reserva_id])
    @reserva.confirmada = true
    @reserva.save


    # render :nothing => true
    # Vuelve al index
    redirect_to reservas_url, notice: 'La reserva fue confirmada.'
  end

  def addclient
    puts params.inspect
    @reserva = Reserva.find(params[:reserva_id])

  end

  def addacompaniante
    puts params.inspect
    @reserva = Reserva.find(params[:reserva_id])
    params[:reserva][:clientes].each do |acompaniante|
      if !acompaniante.nil? && !acompaniante.empty?
        @reserva.clientes << Cliente.find(acompaniante)
      end
    end
    redirect_to reservas_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:reserva).permit( :fehca_creacion, :fecha_inicio_estadia, :fecha_fin_estadia, :monto, :moneda, :abonada, 
        :forma_de_pago, :tipo_reserva_id, :cliente_id, :habitacion_id, :comentarios, clientes_attributes: [:id, :name],
        cliente_attributes: [:nombre, :apellido, :fecha_nac, :nacionalidad, :documento, :documento_tipo, :comentarios, :email])
    end
end
