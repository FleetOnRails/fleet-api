class Document < ActiveRecord::Base
  belongs_to :documentable, polymorphic: true

  validates_presence_of :title
  validates_presence_of :file
  validates_presence_of :data

  before_save :process_file

  private

  REGEX = /\Adata:[a-zA-Z\-]*\/[a-zA-Z\-]*;base64,(.*)\z/

  def process_file
    accepted_formats = %w(.txt .pdf .doc .docx .jpg .jpeg .gif .png)
    if file.present? && data.present?
      if accepted_formats.include? File.extname(file)
        prepend_mime unless data.match(REGEX)
      else
        errors[:base] << 'File type is not allowed'
        false
      end
    end
  end

  def prepend_mime
    mime = MIME::Types.type_for(file).first.content_type
    data.prepend("data:#{mime};base64,")
  end
end
