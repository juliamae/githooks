# If there is no description set for the current branch, choose
# a random GitHub emoji code to use as the description.
#
# This can always be overwritten with `git branch --edit-description branch-name`
class EmojiDescriptor

  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def self.perform(repo)
    descriptor = new repo
    descriptor.set_description!
  end

  def set_description!
    return unless set_description?

    repo.config["branch.#{branch_name}.description"] = ":#{random_emoji}:"
    puts "Set description for branch #{branch_name} to '#{description}'"
  end

  private

  # Private: Current description for the current branch.
  #
  # Returns a String or nil if one doesn't exist.
  def description
    repo.config["branch.#{branch_name}.description"]
  end

  # Private: Determines if we should set the branch description.
  #
  # Returns a Boolean.
  def set_description?
    description.nil? || description.empty?
  end

  def random_emoji
    emoji_name = Emoji.names[(rand * Emoji.names.length).to_i]
  end

  def branch_name
    @branch_name ||= repo.branches.find { |branch| branch.head? }.name
  end
end
