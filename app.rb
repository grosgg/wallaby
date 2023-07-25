require "sinatra"
Dir["lib/**/*.rb"].each {|file| require_relative file }

get '/' do
  @recents = Document::get_recents
  erb :index
end

get '/about' do
  erb :about
end

get '/additions' do
  questions = Document::TOTAL.times.map { Exercises::Operations::Addition.generate }
  doc = Document::build(title: "Additions", questions: questions)
  Document::put(document: doc, type: "additions")
  redirect(uri("/"))
end

get '/soustractions' do
  questions = Document::TOTAL.times.map { Exercises::Operations::Subtraction.generate }
  doc = Document::build(title: "Soustractions", questions: questions)
  Document::put(document: doc, type: "soustractions")
  redirect(uri("/"))
end

get '/multiplications' do
  questions = Document::TOTAL.times.map { Exercises::Operations::Multiplication.generate }
  doc = Document::build(title: "Multiplications", questions: questions)
  Document::put(document: doc, type: "multiplications")
  redirect(uri("/"))
end

get '/divisions' do
  questions = Document::TOTAL.times.map { Exercises::Operations::Division.generate }
  doc = Document::build(title: "Divisions", questions: questions)
  Document::put(document: doc, type: "divisions")
  redirect(uri("/"))
end

get '/problems' do
  questions = Document::TOTAL.times.map do
    Kernel.const_get("Exercises::Problems::Problem#{%w{01 02 03 04 05}.sample}").generate
  end
  doc = Document::build(title: "Problèmes", questions: questions)
  Document::put(document: doc, type: "problems")
  redirect(uri("/"))
end
