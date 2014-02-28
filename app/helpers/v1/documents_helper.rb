module V1
  module DocumentsHelper
    def build_document(data, extension)
      tempfile = Tempfile.new ['upload', extension]
      tempfile.binmode
      tempfile.write(Base64.decode64(data))
      tempfile
    end
  end
end
