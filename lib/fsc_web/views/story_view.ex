defmodule FscWeb.StoryView do
  use FscWeb, :view
  alias FscWeb.StoryView

  def render("index.json", %{stories: stories}) do
    %{data: render_many(stories, StoryView, "story.json")}
  end

  def render("show.json", %{story: story}) do
    %{data: render_one(story, StoryView, "story.json")}
  end

  def render("story.json", %{story: story}) do
    %{
      id: story.id,
      title: story.title,
      url: story.url,
      body: story.body,
      author: story.author
    }
  end
end
