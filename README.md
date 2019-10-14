# Phonebook

## Example

{:ok, db} = Depo.open(:memory)

Phonebook.init(db)

Phonebook.write_contact(db, "John", "+55599888777444")