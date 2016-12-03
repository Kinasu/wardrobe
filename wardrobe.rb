class Wardrobe

  def open_files
    path_data_files = File.dirname(__FILE__) + '/data/'
    files = Dir.entries(path_data_files)

    @clothes = []

    for file in files
      if !File.directory?(file)
        file_data = File.new(path_data_files + file, 'r:UTF-8')

        file_lines = file_data.readlines
        file_data.close

        @clothes << [file_lines[0], file_lines[1], file_lines[2]]
      end
    end
  end

  def clear
    @clothes.flatten!
    @clothes.map! {|s| s.gsub("\n", "")}
  end

  def clothes
    @clothes
  end
end
