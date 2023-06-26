require "sinatra"
require_relative "exercices/addition"
require_relative "exercices/subtraction"
require_relative "exercices/multiplication"
require_relative "exercices/division"
require_relative "document"

get '/' do
  erb :index
end

get '/additions' do
  content_type 'application/pdf'
  questions = Document::TOTAL.times.map { Exercices::Addition::generate }
  Document::build(title: "Additions", questions:).render
end

get '/soustractions' do
  content_type 'application/pdf'
  questions = Document::TOTAL.times.map { Exercices::Subtraction::generate }
  Document::build(title: "Soustractions", questions:).render
end

get '/multiplications' do
  content_type 'application/pdf'
  questions = Document::TOTAL.times.map { Exercices::Multiplication::generate }
  Document::build(title: "Multiplications", questions:).render
end

get '/divisions' do
  content_type 'application/pdf'
  questions = Document::TOTAL.times.map { Exercices::Division::generate }
  Document::build(title: "Divisions", questions:).render
end
