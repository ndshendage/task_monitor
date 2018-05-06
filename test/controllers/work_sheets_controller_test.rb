require 'test_helper'

class WorkSheetsControllerTest < ActionController::TestCase
  setup do
    @work_sheet = work_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_sheet" do
    assert_difference('WorkSheet.count') do
      post :create, work_sheet: { attachment: @work_sheet.attachment, project_name: @work_sheet.project_name, work_details: @work_sheet.work_details, worked_hours: @work_sheet.worked_hours }
    end

    assert_redirected_to work_sheet_path(assigns(:work_sheet))
  end

  test "should show work_sheet" do
    get :show, id: @work_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_sheet
    assert_response :success
  end

  test "should update work_sheet" do
    patch :update, id: @work_sheet, work_sheet: { attachment: @work_sheet.attachment, project_name: @work_sheet.project_name, work_details: @work_sheet.work_details, worked_hours: @work_sheet.worked_hours }
    assert_redirected_to work_sheet_path(assigns(:work_sheet))
  end

  test "should destroy work_sheet" do
    assert_difference('WorkSheet.count', -1) do
      delete :destroy, id: @work_sheet
    end

    assert_redirected_to work_sheets_path
  end
end
