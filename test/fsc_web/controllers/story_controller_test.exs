defmodule FscWeb.StoryControllerTest do
  use FscWeb.ConnCase

  import Fsc.FakestoriesFixtures

  alias Fsc.Fakestories.Story

  @create_attrs %{
    author: [],
    body: "some body",
    title: "some title",
    url: "some url"
  }
  @update_attrs %{
    author: [],
    body: "some updated body",
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{author: nil, body: nil, title: nil, url: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stories", %{conn: conn} do
      conn = get(conn, Routes.story_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create story" do
    test "renders story when data is valid", %{conn: conn} do
      conn = post(conn, Routes.story_path(conn, :create), story: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.story_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author" => [],
               "body" => "some body",
               "title" => "some title",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.story_path(conn, :create), story: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update story" do
    setup [:create_story]

    test "renders story when data is valid", %{conn: conn, story: %Story{id: id} = story} do
      conn = put(conn, Routes.story_path(conn, :update, story), story: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.story_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author" => [],
               "body" => "some updated body",
               "title" => "some updated title",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, story: story} do
      conn = put(conn, Routes.story_path(conn, :update, story), story: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete story" do
    setup [:create_story]

    test "deletes chosen story", %{conn: conn, story: story} do
      conn = delete(conn, Routes.story_path(conn, :delete, story))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.story_path(conn, :show, story))
      end
    end
  end

  defp create_story(_) do
    story = story_fixture()
    %{story: story}
  end
end
