require "sinatra"
require_relative "exercices/addition"
require_relative "exercices/subtraction"
require_relative "exercices/multiplication"
require_relative "exercices/division"
require_relative "document"

get '/' do
  @recents = Document::get_recents
  erb :index
end

get '/about' do
  erb :about
end

get '/additions' do
  questions = Document::TOTAL.times.map { Exercices::Addition::generate }
  doc = Document::build(title: "Additions", questions: questions)
  Document::put(document: doc, type: "additions")
  redirect(uri("/"))
end

get '/soustractions' do
  questions = Document::TOTAL.times.map { Exercices::Subtraction::generate }
  doc = Document::build(title: "Soustractions", questions: questions)
  Document::put(document: doc, type: "soustractions")
  redirect(uri("/"))
end

get '/multiplications' do
  questions = Document::TOTAL.times.map { Exercices::Multiplication::generate }
  doc = Document::build(title: "Multiplications", questions: questions)
  Document::put(document: doc, type: "multiplications")
  redirect(uri("/"))
end

get '/divisions' do
  questions = Document::TOTAL.times.map { Exercices::Division::generate }
  doc = Document::build(title: "Divisions", questions: questions)
  Document::put(document: doc, type: "divisions")
  redirect(uri("/"))
end
