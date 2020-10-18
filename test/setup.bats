
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load '../libs/helpers'

setup_script="bin/setup"

@test ".have_git returns true if git found and executable" {
  #shellcheck source=../bin/setup
  . ${setup_script}
  run have_git
  assert_success
}

@test ".have_git returns false if git not found or executable" {
  #shellcheck source=../bin/setup
  . ${setup_script}
  # shellcheck disable=2030,2031
  export GITLOC="stub-git-not-executable"
  run have_git
  assert_failure
}

@test ".run_main calls have_git" {
  #shellcheck source=../bin/setup
  . ${setup_script}
  function have_git() { echo "have_git called"; }
  export -f have_git
  run run_main
  assert_success
  assert_output -p "have_git called"
}

@test ".run_main bails if git is not available" {
  #shellcheck source=../bin/setup
  . ${setup_script}
  # shellcheck disable=2030,2031
  export GITLOC="stub-git-not-executable"
  run run_main
  assert_failure
  assert_output -p "Git not found or executable"
}
