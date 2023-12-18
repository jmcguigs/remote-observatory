defmodule HorizonsClient do
  @base_url "https://ssd.jpl.nasa.gov/api/horizons.api"


  @doc """
  Get ephemerides for an object from JPL Horizons.
  """
  def get_latest_ephemeris(object_id) do
    current_time = DateTime.utc_now() |> DateTime.to_naive()

    url = "#{@base_url}?format=json&COMMAND='#{object_id}'&OBJ_DATA='NO'&MAKE_EPHEM='YES'&EPHEM_TYPE='ELEMENTS'&CENTER='ssb'&TLIST='#{current_time}'&QUANTITIES='1,9,20,23,24,29'"

    case HTTPoison.get(url) do
      {:ok, %{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %{status_code: status_code, body: body}} ->
        {:error, "Request failed with status code #{status_code}: #{body}"}
      {:error, error} ->
        {:error, "Request failed: #{inspect(error)}"}
    end
  end
end
