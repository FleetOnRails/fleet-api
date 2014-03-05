module V1
  module DocumentsHelper
    def build_media(data, extension)
      tempfile = Tempfile.new ['upload', extension]
      tempfile.binmode
      tempfile.write(Base64.decode64(data))
      tempfile
    end
  end
end
