require 'test_helper'

class RegistroRecordsControllerTest < ActionController::TestCase
  setup do
    @registro_record = registro_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registro_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registro_record" do
    assert_difference('RegistroRecord.count') do
      post :create, registro_record: { deporte_id: @registro_record.deporte_id, disciplina_id: @registro_record.disciplina_id, evento_id: @registro_record.evento_id, jugador_id: @registro_record.jugador_id, marca: @registro_record.marca }
    end

    assert_redirected_to registro_record_path(assigns(:registro_record))
  end

  test "should show registro_record" do
    get :show, id: @registro_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registro_record
    assert_response :success
  end

  test "should update registro_record" do
    put :update, id: @registro_record, registro_record: { deporte_id: @registro_record.deporte_id, disciplina_id: @registro_record.disciplina_id, evento_id: @registro_record.evento_id, jugador_id: @registro_record.jugador_id, marca: @registro_record.marca }
    assert_redirected_to registro_record_path(assigns(:registro_record))
  end

  test "should destroy registro_record" do
    assert_difference('RegistroRecord.count', -1) do
      delete :destroy, id: @registro_record
    end

    assert_redirected_to registro_records_path
  end
end
