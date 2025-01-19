enum RequestState {
  init,
  requested,
  waiting,
  local_completed,
  completed,
  error,
  network_error,
  need_time_to_fix,
}
