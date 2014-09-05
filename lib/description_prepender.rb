# Prepends the branch description to each commit message, after the commit message has been set.
#
# Add Branch description with git branch --edit-description branch-name
class DescriptionPrepender

  attr_reader :commit_message_file, :repo

  def initialize(filename, repo)
    @commit_message_file = filename
    @repo                = repo
  end

  def self.perform(filename, repo)
    prepender = new filename, repo
    prepender.prepend!
  end

  # Public: If a branch description exists, constructs a new commit message from the description
  #         and the set message, and writes the message to the `commit_message_file`.
  def prepend!
    return if description.empty?

    message = open(commit_message_file).read
    open(commit_message_file, 'w') do |f|
      f.puts "#{description} #{message}"
    end
  end

  private

  # Private: Extracts the branch description for the current branch from the repo config.
  def description
    @description ||= repo.
      config["branch.#{repo.branches.find { |branch| branch.head? }.name}.description"].
      gsub(/\n/,"")
  end
end
