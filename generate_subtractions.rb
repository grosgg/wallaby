require_relative "exercices/subtraction"
require_relative "document"

questions = Document::TOTAL.times.map { Exercices::Subtraction::generate }

Document::build(title: "Soustractions", questions:)