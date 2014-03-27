require "kramdown"
require "formatador"
require "pry"

require "dutchman"

require "ghost_story/version"
require "ghost_story/story_builder"
require "ghost_story/story"


module GhostStory

  def self.read_file(story_file,options = {})
    read File.read(story_file), options
  end

  def self.read(story,options = {})
    story_builder = StoryBuilder.new(options)
    story = story_builder.build(story)
    story.read!
  end

end
