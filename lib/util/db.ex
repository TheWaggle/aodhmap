defmodule Db do

  def query(sql) do
    case Ecto.Adapters.SQL.query(Aodhmap.Repo, sql, [] ) do
      {:ok, res} -> res
      {:error, _res} -> "SQL ERROR"
    end
  end

  def columns_rows(res) do
    Enum.map(res.rows, fn row -> to_map(res.columns, row) end )
  end

  defp to_map(columns, row) do
    List.zip([columns, row])
    |> Enum.into(%{})
  end

end
