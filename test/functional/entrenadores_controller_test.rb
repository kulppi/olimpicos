require 'test_helper'

class EntrenadoresControllerTest < ActionController::TestCase
  setup do
    @entrenadore = entrenadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrenadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrenadore" do
    assert_difference('Entrenadore.count') do
      post :create, entrenadore: { apellido: @entrenadore.apellido, delegacion_id: @entrenadore.delegacion_id, edad: @entrenadore.edad, fecha_nacimiento: @entrenadore.fecha_nacimiento, nacionalidad: @entrenadore.nacionalidad, nombre: @entrenadore.nombre, tipo_sexo_id: @entrenadore.tipo_sexo_id }
    end

    assert_redirected_to entrenadore_path(assigns(:entrenadore))
  end

  test "should show entrenadore" do
    get :show, id: @entrenadore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entrenadore
    assert_response :success
  end

  test "should update entrenadore" do
    put :update, id: @entrenadore, entrenadore: { apellido: @entrenadore.apellido, delegacion_id: @entrenadore.delegacion_id, edad: @entrenadore.edad, fecha_nacimiento: @entrenadore.fecha_nacimiento, nacionalidad: @entrenadore.nacionalidad, nombre: @entrenadore.nombre, tipo_sexo_id: @entrenadore.tipo_sexo_id }
    assert_redirected_to entrenadore_path(assigns(:entrenadore))
  end

  test "should destroy entrenadore" do
    assert_difference('Entrenadore.count', -1) do
      delete :destroy, id: @entrenadore
    end

    assert_redirected_to entrenadores_path
  end
end
