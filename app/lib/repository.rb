require "#{File.dirname(__FILE__)}/file_repository/language_repository"

class Repository
  def self.register(type, repo)
    repositories[type] = repo
  end

  def self.repositories
    @repositories ||= {}
  end

  def self.for(type)
    repositories[type]
  end
end
