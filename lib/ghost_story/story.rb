module GhostStory

  class Story
    def initialize(whole_story)
      @whole_story = whole_story
    end

    attr_reader :whole_story

    def read!
      whole_story.each { |piece| piece.call }
    end
  end

end