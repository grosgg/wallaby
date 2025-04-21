require "time"
require "aws-sdk-s3"
require "prawn"

module Document
  TOTAL = 10
  COLUMNS = 2
  ROWS = TOTAL / COLUMNS

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
          text_box "#{q+1}) #{questions[q][:question]}", at: [5, bounds.top - 15], width: bounds.width - 25
        end
      end

      # Solutions
      formatted_solutions = questions.map.with_index{|q, i| "(#{i+1}) #{q[:solution]}"}.join(', ')
      rotate(180, origin: [bounds.right / 2, 10]) do
        font_size(8) { text_box "#{timestamp.strftime("%d/%m/%Y %T")} #{title} --- #{formatted_solutions}", at: [5, 15], width: bounds.width }
      end
    end
  end

  def self.put(document:, type:)
    key = create_key(type)
    s3 = Aws::S3::Client.new
    s3.put_object({
      body: document.render,
      bucket: ENV["S3_MATHS_EXERCICES_BUCKET"],
      key: key,
    })
    key
  end

  def self.get_recents
    s3 = Aws::S3::Client.new
    response = s3.list_objects_v2({ bucket: ENV["S3_MATHS_EXERCICES_BUCKET"] })
    response.to_h.dig(:contents)&.map do |c|
      key = c.dig(:key)
      time = c.dig(:last_modified)
      {
        key: key,
        label: "#{time.localtime("+09:00").strftime("%m/%d %H:%M:%S")} #{key.split('_').first.capitalize}"
      }
    end || []
  end

  def self.get_counts(recents)
    keys = recents.map{|r| r[:key]}
    {
      tables: keys.map{|k| /tables/ =~ k}.compact.count,
      problems: keys.map{|k| /problèmes/ =~ k}.compact.count,
      additions: keys.map{|k| /additions/ =~ k}.compact.count,
      subtractions: keys.map{|k| /soustractions/ =~ k}.compact.count,
      multiplications: keys.map{|k| /multiplications/ =~ k}.compact.count,
      divisions: keys.map{|k| /divisions/ =~ k}.compact.count,
    }
  end

  def self.create_key(exercice_name)
    "#{exercice_name}_#{Time.now.getlocal("+09:00").strftime("%Y%m%d%H%M%S")}.pdf"
  end
end
