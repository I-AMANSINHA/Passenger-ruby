# config.ru
app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/plain'}, ["Hello from Passenger running inside Docker!"]]
end

run app

