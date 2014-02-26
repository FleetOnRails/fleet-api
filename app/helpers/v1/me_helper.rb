module V1
  module MeHelper
    def build_avatar(data, extension)
      tempfile = Tempfile.new ['upload', extension]
      tempfile.binmode
      tempfile.write(Base64.decode64(data))
      tempfile
    end
  end
end