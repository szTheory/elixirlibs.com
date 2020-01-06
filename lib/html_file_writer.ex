defmodule HtmlFileWriter do
  @output_path "build/index.html"

  def write! do
    File.write!(@output_path, html())
  end

  defp html do
    Markdown.Builder.build()
    |> DomBuilder.build()
  end
end