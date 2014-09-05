# Modifies the default commit message before it is set.
#
# Fancies up "Merge," replaces local branch name, and removes 'remote-tracking branch.'
class MergeMessageModifier

  attr_reader :commit_message_file, :repo

  def initialize(filename, repo)
    @commit_message_file = filename
    @repo                = repo
  end

  def self.perform(filename, repo)
    modifier = new filename, repo
    modifier.modify!
  end

  def modify!
    return if message.nil? || message.empty?

    open(commit_message_file, 'w') do |f|
      f.puts message.gsub("Merge", ":part_alternation_mark:erge")
        .gsub(" remote-tracking branch", "")
        .gsub(branch_name, "this fine-ass branch right here")
    end
  end

  private

  def message
    @message ||= open(commit_message_file).read
  end

  def branch_name
    repo.branches.find { |branch| branch.head? }.name
  end
end
