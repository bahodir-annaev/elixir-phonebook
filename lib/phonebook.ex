defmodule Phonebook do
  @moduledoc """
  Documentation for Phonebook.
  """
  def init(db) do
    Depo.transact(db, fn ->
      Depo.write(db, "CREATE TABLE contacts (name Varchar, phone Varchar)")

      Depo.teach(db, %{
        new_contact: "INSERT INTO contacts VALUES(?1,?2)",

        contacts: "SELECT * from contacts",

        get_contact: "SELECT name, phone FROM contacts WHERE name = ?1 LIMIT 1",
      })

      Depo.write(db, :new_contact, ["Anna", "+998975553344"])
    end)
  end

  def write_contact(db, name, phone) do
    Depo.write(db, :new_contact, [name, phone])
  end

  def get_contact(db, name) do
    Depo.read(db, :get_contact, name)
  end

  def get_all_contacts(db) do
    Depo.read(db, :contacts)
  end
end
