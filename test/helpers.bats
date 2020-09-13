#!/usr/bin/env ./test/libs/bats/bin/bats
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load '../libs/helpers'

@test ".is_executable returns false if not executable" {
  run is_executable mock-not-executable
  assert_failure
}

@test ".is_executable returns true if executable" {
  run is_executable true
  assert_success
}

@test ".is_directory returns false if not a directory" {
  run is_directory true
  assert_failure
}

@test ".is_directory returns true if not a directory" {
  run is_directory "${PWD}"
  assert_success
}
