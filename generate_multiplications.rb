require_relative "exercices/multiplication"
require_relative "document"

questions = Document::TOTAL.times.map { Exercices::Multiplication::generate }

Document::build(title: "Multiplications", questions:)