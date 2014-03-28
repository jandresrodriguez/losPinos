require 'test_helper'

class ReservasControllerTest < ActionController::TestCase
  setup do
    @reserva = reservas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserva" do
    assert_difference('Reserva.count') do
      post :create, reserva: { abonada: @reserva.abonada, cliente_id: @reserva.cliente_id, comentarios: @reserva.comentarios, fecha_fin_estadia: @reserva.fecha_fin_estadia, fecha_inicio_estadia: @reserva.fecha_inicio_estadia, fehca_creacion: @reserva.fehca_creacion, forma_de_pago: @reserva.forma_de_pago, habitacion_id: @reserva.habitacion_id, moneda: @reserva.moneda, monto: @reserva.monto, tipo_reserva_id: @reserva.tipo_reserva_id }
    end

    assert_redirected_to reserva_path(assigns(:reserva))
  end

  test "should show reserva" do
    get :show, id: @reserva
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserva
    assert_response :success
  end

  test "should update reserva" do
    patch :update, id: @reserva, reserva: { abonada: @reserva.abonada, cliente_id: @reserva.cliente_id, comentarios: @reserva.comentarios, fecha_fin_estadia: @reserva.fecha_fin_estadia, fecha_inicio_estadia: @reserva.fecha_inicio_estadia, fehca_creacion: @reserva.fehca_creacion, forma_de_pago: @reserva.forma_de_pago, habitacion_id: @reserva.habitacion_id, moneda: @reserva.moneda, monto: @reserva.monto, tipo_reserva_id: @reserva.tipo_reserva_id }
    assert_redirected_to reserva_path(assigns(:reserva))
  end

  test "should destroy reserva" do
    assert_difference('Reserva.count', -1) do
      delete :destroy, id: @reserva
    end

    assert_redirected_to reservas_path
  end
end
