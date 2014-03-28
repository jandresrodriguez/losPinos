require 'test_helper'

class HabitacionsControllerTest < ActionController::TestCase
  setup do
    @habitacion = habitacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:habitacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create habitacion" do
    assert_difference('Habitacion.count') do
      post :create, habitacion: { comentarios: @habitacion.comentarios, descripcion: @habitacion.descripcion, disponible: @habitacion.disponible, nombre: @habitacion.nombre, nro_camas_matrimoniales: @habitacion.nro_camas_matrimoniales, nro_camas_single: @habitacion.nro_camas_single }
    end

    assert_redirected_to habitacion_path(assigns(:habitacion))
  end

  test "should show habitacion" do
    get :show, id: @habitacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @habitacion
    assert_response :success
  end

  test "should update habitacion" do
    patch :update, id: @habitacion, habitacion: { comentarios: @habitacion.comentarios, descripcion: @habitacion.descripcion, disponible: @habitacion.disponible, nombre: @habitacion.nombre, nro_camas_matrimoniales: @habitacion.nro_camas_matrimoniales, nro_camas_single: @habitacion.nro_camas_single }
    assert_redirected_to habitacion_path(assigns(:habitacion))
  end

  test "should destroy habitacion" do
    assert_difference('Habitacion.count', -1) do
      delete :destroy, id: @habitacion
    end

    assert_redirected_to habitacions_path
  end
end
