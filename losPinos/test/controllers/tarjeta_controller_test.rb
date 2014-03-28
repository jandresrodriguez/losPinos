require 'test_helper'

class TarjetaControllerTest < ActionController::TestCase
  setup do
    @tarjetum = tarjeta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tarjeta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarjetum" do
    assert_difference('Tarjetum.count') do
      post :create, tarjetum: { comentarios: @tarjetum.comentarios, habilitada: @tarjetum.habilitada, nombre: @tarjetum.nombre }
    end

    assert_redirected_to tarjetum_path(assigns(:tarjetum))
  end

  test "should show tarjetum" do
    get :show, id: @tarjetum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tarjetum
    assert_response :success
  end

  test "should update tarjetum" do
    patch :update, id: @tarjetum, tarjetum: { comentarios: @tarjetum.comentarios, habilitada: @tarjetum.habilitada, nombre: @tarjetum.nombre }
    assert_redirected_to tarjetum_path(assigns(:tarjetum))
  end

  test "should destroy tarjetum" do
    assert_difference('Tarjetum.count', -1) do
      delete :destroy, id: @tarjetum
    end

    assert_redirected_to tarjeta_path
  end
end
