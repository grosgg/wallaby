require_relative "exercices/division"
require_relative "document"

questions = Document::TOTAL.times.map { Exercices::Division::generate }

Document::build(title: "Divisions", questions:)