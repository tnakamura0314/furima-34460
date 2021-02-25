FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end

    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    last_name             { person.last.kanji}
    first_name            { person.first.kanji}
    last_name_kana        { person.last.katakana}
    first_name_kana       { person.first.katakana}
    birthday              {Faker::Date.birthday}
  end
end
