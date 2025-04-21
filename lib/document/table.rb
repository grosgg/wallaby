module Document::Table
  extend Document

  TOTAL = 80
  COLUMNS = 4
  ROWS = 20

  def self.build(title:, questions:)
    Prawn::Fonts::AFM.hide_m17n_warning = true
    Prawn::Document.new do
      # stroke_axis

      # Timestamp
      timestamp =  Time.now.localtime("+09:00")
      font_size(8) { text timestamp.strftime("Généré le %d/%m/%Y à %T"), align: :right }

      # Title
      font_size(25) { text title, align: :center }

      # Exercises
      for q in 0..(TOTAL-1) do
        bounding_box([(q%COLUMNS) * bounds.right / COLUMNS, 660 - (q/COLUMNS) * 660 / ROWS + 20], width: bounds.right / COLUMNS, height: 660 / ROWS) do
          transparent(0.5) { stroke_bounds }
          text_box "#{questions[q][:question]}", at: [5, bounds.top - 15], width: bounds.width - 25
        end
      end
    end
  end
end