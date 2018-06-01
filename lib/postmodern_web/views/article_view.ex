defmodule PostmodernWeb.ArticleView do
  use PostmodernWeb, :view

  def markdown(body) do
    body
    |> Earmark.to_html
    |> raw
  end

end
