t = Time.current

def dispTime
  Time.current.strftime("%H:%M:%S")
end

puts "start seed managers. [#{dispTime}]"

Manager.create!(
  email: '1@gmail.com',
  password: 'bcbc1212',
  last_sign_in_at: t.since(4.minute),
  confirmation_sent_at: t,
  confirmed_at: t.since(3.minute)
)

puts "finished seed managers. [#{dispTime}]"
