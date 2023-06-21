require_relative "exercices/addition"
require_relative "document"

questions = Document::TOTAL.times.map { Exercices::Addition::generate }

Document::build(title: "Additions", questions:)