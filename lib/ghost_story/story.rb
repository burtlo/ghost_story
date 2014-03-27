module GhostStory

  class Story
    def initialize(whole_story)
      @whole_story = whole_story
    end

    attr_reader :whole_story

    def read!
      clear_screen
      whole_story.each { |piece| piece.call }
    end

    def clear_screen
      puts "\e[H\e[2J"
    end
  end

end