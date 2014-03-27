require "kramdown"
require "formatador"
require "pry"

require "dutchman"

require "ghost_story/version"
require "ghost_story/story_builder"
require "ghost_story/story"


module GhostStory

  def self.read_file(story_file)
    read File.read(story_file)
  end

  def self.read(story)
    story = StoryBuilder.build(story)
    story.read!
  end

end
