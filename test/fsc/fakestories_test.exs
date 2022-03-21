defmodule Fsc.FakestoriesTest do
  use Fsc.DataCase

  alias Fsc.Fakestories

  describe "stories" do
    alias Fsc.Fakestories.Story

    import Fsc.FakestoriesFixtures

    @invalid_attrs %{author: nil, body: nil, title: nil, url: nil}

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Fakestories.list_stories() == [story]
    end

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Fakestories.get_story!(story.id) == story
    end

    test "create_story/1 with valid data creates a story" do
      valid_attrs = %{author: [], body: "some body", title: "some title", url: "some url"}

      assert {:ok, %Story{} = story} = Fakestories.create_story(valid_attrs)
      assert story.author == []
      assert story.body == "some body"
      assert story.title == "some title"
      assert story.url == "some url"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fakestories.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      update_attrs = %{author: [], body: "some updated body", title: "some updated title", url: "some updated url"}

      assert {:ok, %Story{} = story} = Fakestories.update_story(story, update_attrs)
      assert story.author == []
      assert story.body == "some updated body"
      assert story.title == "some updated title"
      assert story.url == "some updated url"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Fakestories.update_story(story, @invalid_attrs)
      assert story == Fakestories.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Fakestories.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Fakestories.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Fakestories.change_story(story)
    end
  end
end
