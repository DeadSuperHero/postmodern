defmodule Postmodern.AccountsTest do
  use Postmodern.DataCase

  alias Postmodern.Accounts

  describe "profiles" do
    alias Postmodern.Accounts.Profile

    @valid_attrs %{avatar: "some avatar", description: "some description", display_name: "some display_name", username: "some username"}
    @update_attrs %{avatar: "some updated avatar", description: "some updated description", display_name: "some updated display_name", username: "some updated username"}
    @invalid_attrs %{avatar: nil, description: nil, display_name: nil, username: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Accounts.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Accounts.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Accounts.create_profile(@valid_attrs)
      assert profile.avatar == "some avatar"
      assert profile.description == "some description"
      assert profile.display_name == "some display_name"
      assert profile.username == "some username"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, profile} = Accounts.update_profile(profile, @update_attrs)
      assert %Profile{} = profile
      assert profile.avatar == "some updated avatar"
      assert profile.description == "some updated description"
      assert profile.display_name == "some updated display_name"
      assert profile.username == "some updated username"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_profile(profile, @invalid_attrs)
      assert profile == Accounts.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Accounts.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Accounts.change_profile(profile)
    end
  end
end
