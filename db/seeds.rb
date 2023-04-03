# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#Rake.application["db:fixtures:load"].invoke
User.transaction do
  User.create!(
    [
      {
        id: 1,
        name: "Noah Wiebe",
        email: "noah@gmail.com",
        password: "Boomer72_1998",
        api_keys: [ApiKey.new(id: "51b1b21c-eed5-4e4f-8918-fe448b7f3c29")]
      },
      {
        id: 2,
        name: "New user",
        email: "noah+2@gmail.com",
        password: "Boomer72_1998",
        api_keys: [ApiKey.new(id: "51b1b21c-eed5-4e4f-8918-fe448b7f3c30")]
      }
    ]
  )
  GuestUser.create!(id: 1, name: "Julia Lercara")
  Calendar.create!(
    [
      { id: 1, title: "Noah's Personal Calendar", user_id: 1 },
      { id: 2, title: "Noah's Work Calendar", user_id: 1 }
    ]
  )

  EventGroup.create!(
    [{ id: 1, title: "Wedding" }, { id: 2, title: "Planning Meetings" }]
  )
  Event.create!(
    [
      {
        id: 1,
        title: "N + J Wedding Rehearsal",
        datetime: "2023-08-11 14:00:00",
        event_group_id: 1
      },
      {
        id: 2,
        title: "N + J Wedding",
        datetime: "2023-08-13 14:00:00",
        event_group_id: 1
      },
      {
        id: 3,
        title: "N Promotion",
        datetime: "2023-06-13 14:00:00",
        event_group_id: 2
      }
    ]
  )

  Participant.create!(
    [
      {
        id: 1,
        event_id: 1,
        calendar_id: 1,
        participatable_id: 1,
        participatable_type: "User",
        access_level: Participant::OWNER,
        role: "Groom"
      },
      {
        id: 2,
        event_id: 1,
        participatable_id: 1,
        participatable_type: "GuestUser",
        role: "Bride"
      }
    ]
  )
  EventSchedule.create!(
    [{ id: 1, frequency: "weekly", initial_datetime: "2023-09-11 12:00:00" }]
  )
end
