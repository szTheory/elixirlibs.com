defmodule ListItemHtmlParser do
  alias Markdown.Section.BaseListItems
  alias Markdown.Section.ListItemTransformer

  @doc """
  Get a hash representation of the category parsed from HTML row
  """
  def hash_from_list_item_html(html) do
    list = base_list_items(html)
    category_name = category_name(list)
    entries = transform_base_list(list, category_name)

    %{name: category_name, entries: entries}
  end

  defp base_list_items(html) do
    BaseListItems.base_list_items(html)
  end

  defp category_name(base_list_items) do
    base_list_items
    |> List.first()
    |> Map.get(:name)
  end

  defp transform_base_list(list, category_name) do
    list
    |> ListItemTransformer.transform_base_list(category_name)
  end
end