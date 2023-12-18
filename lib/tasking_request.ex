defmodule TaskingRequest do
  defstruct [
    :task_id,
    :priority,
    :originator,
    :task_start_time,
    :task_end_time,
    :collection_params,
    :target_params
  ]
end
