defmodule Postmodern.StreamTest do
  use Postmodern.DataCase

  alias Postmodern.Stream

  describe "dashboards" do
    alias Postmodern.Stream.Dashboard

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def dashboard_fixture(attrs \\ %{}) do
      {:ok, dashboard} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stream.create_dashboard()

      dashboard
    end

    test "list_dashboards/0 returns all dashboards" do
      dashboard = dashboard_fixture()
      assert Stream.list_dashboards() == [dashboard]
    end

    test "get_dashboard!/1 returns the dashboard with given id" do
      dashboard = dashboard_fixture()
      assert Stream.get_dashboard!(dashboard.id) == dashboard
    end

    test "create_dashboard/1 with valid data creates a dashboard" do
      assert {:ok, %Dashboard{} = dashboard} = Stream.create_dashboard(@valid_attrs)
    end

    test "create_dashboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stream.create_dashboard(@invalid_attrs)
    end

    test "update_dashboard/2 with valid data updates the dashboard" do
      dashboard = dashboard_fixture()
      assert {:ok, dashboard} = Stream.update_dashboard(dashboard, @update_attrs)
      assert %Dashboard{} = dashboard
    end

    test "update_dashboard/2 with invalid data returns error changeset" do
      dashboard = dashboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Stream.update_dashboard(dashboard, @invalid_attrs)
      assert dashboard == Stream.get_dashboard!(dashboard.id)
    end

    test "delete_dashboard/1 deletes the dashboard" do
      dashboard = dashboard_fixture()
      assert {:ok, %Dashboard{}} = Stream.delete_dashboard(dashboard)
      assert_raise Ecto.NoResultsError, fn -> Stream.get_dashboard!(dashboard.id) end
    end

    test "change_dashboard/1 returns a dashboard changeset" do
      dashboard = dashboard_fixture()
      assert %Ecto.Changeset{} = Stream.change_dashboard(dashboard)
    end
  end
end
