defmodule Fsc.FakestoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fsc.Fakestories` context.
  """

  @doc """
  Generate a story.
  """
  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        author: [],
        body: "some body",
        title: "some title",
        url: "some url"
      })
      |> Fsc.Fakestories.create_story()

    story
  end
end
