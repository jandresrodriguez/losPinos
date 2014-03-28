require 'test_helper'

class TipoReservasControllerTest < ActionController::TestCase
  setup do
    @tipo_reserva = tipo_reservas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_reservas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_reserva" do
    assert_difference('TipoReserva.count') do
      post :create, tipo_reserva: { comentarios: @tipo_reserva.comentarios, habilitada: @tipo_reserva.habilitada, nombre: @tipo_reserva.nombre }
    end

    assert_redirected_to tipo_reserva_path(assigns(:tipo_reserva))
  end

  test "should show tipo_reserva" do
    get :show, id: @tipo_reserva
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_reserva
    assert_response :success
  end

  test "should update tipo_reserva" do
    patch :update, id: @tipo_reserva, tipo_reserva: { comentarios: @tipo_reserva.comentarios, habilitada: @tipo_reserva.habilitada, nombre: @tipo_reserva.nombre }
    assert_redirected_to tipo_reserva_path(assigns(:tipo_reserva))
  end

  test "should destroy tipo_reserva" do
    assert_difference('TipoReserva.count', -1) do
      delete :destroy, id: @tipo_reserva
    end

    assert_redirected_to tipo_reservas_path
  end
end
