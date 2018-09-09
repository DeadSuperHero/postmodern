defmodule PostmodernWeb.DashboardControllerTest do
  use PostmodernWeb.ConnCase

  alias Postmodern.Stream

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:dashboard) do
    {:ok, dashboard} = Stream.create_dashboard(@create_attrs)
    dashboard
  end

  describe "index" do
    test "lists all dashboards", %{conn: conn} do
      conn = get conn, dashboard_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Dashboards"
    end
  end

  describe "new dashboard" do
    test "renders form", %{conn: conn} do
      conn = get conn, dashboard_path(conn, :new)
      assert html_response(conn, 200) =~ "New Dashboard"
    end
  end

  describe "create dashboard" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, dashboard_path(conn, :create), dashboard: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == dashboard_path(conn, :show, id)

      conn = get conn, dashboard_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Dashboard"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, dashboard_path(conn, :create), dashboard: @invalid_attrs
      assert html_response(conn, 200) =~ "New Dashboard"
    end
  end

  describe "edit dashboard" do
    setup [:create_dashboard]

    test "renders form for editing chosen dashboard", %{conn: conn, dashboard: dashboard} do
      conn = get conn, dashboard_path(conn, :edit, dashboard)
      assert html_response(conn, 200) =~ "Edit Dashboard"
    end
  end

  describe "update dashboard" do
    setup [:create_dashboard]

    test "redirects when data is valid", %{conn: conn, dashboard: dashboard} do
      conn = put conn, dashboard_path(conn, :update, dashboard), dashboard: @update_attrs
      assert redirected_to(conn) == dashboard_path(conn, :show, dashboard)

      conn = get conn, dashboard_path(conn, :show, dashboard)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, dashboard: dashboard} do
      conn = put conn, dashboard_path(conn, :update, dashboard), dashboard: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Dashboard"
    end
  end

  describe "delete dashboard" do
    setup [:create_dashboard]

    test "deletes chosen dashboard", %{conn: conn, dashboard: dashboard} do
      conn = delete conn, dashboard_path(conn, :delete, dashboard)
      assert redirected_to(conn) == dashboard_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, dashboard_path(conn, :show, dashboard)
      end
    end
  end

  defp create_dashboard(_) do
    dashboard = fixture(:dashboard)
    {:ok, dashboard: dashboard}
  end
end
