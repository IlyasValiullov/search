require 'json'
module FileRepository

  class LanguageRepository
    def all
      file = File.read("#{App.path}/config/languages.json")
      JSON.parse(file, { symbolize_names: true })
    end

  end

end
