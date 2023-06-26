require "prawn"

module Document
  TOTAL = 8
  COLUMNS = 2
  ROWS = TOTAL / COLUMNS

  def self.build(title:, questions:)
    Prawn::Fonts::AFM.hide_m17n_warning = true
    Prawn::Document.new do
      # stroke_axis

      # Timestamp
      timestamp =  Time.now
      font_size(8) { text timestamp.strftime("Généré le %d/%m/%Y à %T"), align: :right }

      # Title
      font_size(25) { text title, align: :center }

      # Exercices
      for q in 0..(TOTAL-1) do
        bounding_box([(q%2) * bounds.right / COLUMNS, 660 - (q/2) * 660 / ROWS + 20], width: bounds.right / COLUMNS, height: 660 / ROWS) do
          transparent(0.5) { stroke_bounds }
          draw_text "#{q+1}) #{questions[q][:question]}", at: [5, bounds.top - 15]
        end
      end

      # Solutions
      formatted_solutions = questions.map.with_index{|q, i| "(#{i+1}) #{q[:solution]}"}.join(', ')
      rotate(180, origin: [bounds.right / 2, 10]) do
        font_size(8) { draw_text "#{timestamp.strftime("%d/%m/%Y %T")} --- #{formatted_solutions}", at: [5, 15] }
      end
    end

  end
end
