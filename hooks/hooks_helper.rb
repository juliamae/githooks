require "rugged"
require "gemoji"

require File.expand_path('../../lib/description_prepender', __FILE__)
require File.expand_path('../../lib/merge_message_modifier', __FILE__)
require File.expand_path('../../lib/emoji_descriptor', __FILE__)

# Finds the name of the current branch for repo.
#
# Returns a String.
def branch_name(repo)
  repo.branches.find { |branch| branch.head? }.name
end
