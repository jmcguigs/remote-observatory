defmodule HorizonsClient do
  @base_url "https://ssd.jpl.nasa.gov/api/horizons.api"

  def get_ephemerides(object_id, start_date, end_date) do
    #url = "#{@base_url}?format=text&COMMAND='#{object_id}'&START_TIME='#{start_date}'&STOP_TIME='#{end_date}'"
    url = "#{@base_url}?format=json&COMMAND='#{object_id}'&OBJ_DATA='NO'&MAKE_EPHEM='YES'&EPHEM_TYPE='ELEMENTS'&CENTER='ssb'&START_TIME='#{start_date}'&STOP_TIME='#{end_date}'&STEP_SIZE='1%20d'"
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
