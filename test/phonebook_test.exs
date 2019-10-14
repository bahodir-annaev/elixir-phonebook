defmodule PhonebookTest do
  use ExUnit.Case
  doctest Phonebook

  test "greets the world" do
    assert Phonebook.hello() == :world
  end
end
