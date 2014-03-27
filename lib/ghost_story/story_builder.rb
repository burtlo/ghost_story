module GhostStory

  class StoryBuilder

    def initialize(options)
      @options = options || {}
    end

    attr_reader :options

    #
    # @returns [Story] a story object is something that can be executed to tell
    #   the story created by the builder.
    #
    def build(story)
      kram = Kramdown::Document.new(story)

      whole_story = build_story(kram.root)

      Story.new(whole_story)
    end

    private

    #
    # @returns [Array<lambda>] an array of executable objects which
    #   will either display text to the screen or drive the editor to
    #   type in the desired code.
    #
    def build_story(node_with_children)
      node_with_children.children.map { |node| build_chapter(node) }
    end

    #
    # Building a chapter creates and returns a delayed block of code for the
    # particular node. It is packaged like this so that each chapter can be
    # placed into an array of all the chapters that need to be executed. Ensuring
    # that they execute in the correct order.
    #
    # @returns [lambda] the code that needs to be written or the text that needs
    #   to be displayed to the reader.
    def build_chapter(node)
      if node_contains_code?(node)
        build_code_chapter(node)
      else
        lambda { Formatador.display build_standard_chapter(node) }
      end
    end

    #
    # Currently a node that identifies as a codeblock is any node using the
    # three "~~~" syntax. Previously, I was using the more conventional three
    # backticks "```" but those are converted to codespans. This is a limitation
    # of using Kramdown.
    #
    def node_contains_code?(node)
      node.type == :codeblock
    end

    #
    # Nodes identified as a code chapter will first ask for input from the person
    # running the story and then it will execute the story.
    #
    def build_code_chapter(node)
      code = node.value
      lambda { ask_to_continue ; Dutchman.write(to: application, text: code, speed: :fast, humanize: true) }
    end

    #
    # The application to which to write the code.
    #
    def application
      options[:application] || default_application
    end

    #
    # This default value is not kosher!
    #
    def default_application
      "Sublime Text"
    end

    #
    # Prompts the person running the story to press a key to continue with
    # with the story. This allows them to read the human parts and continue
    # with the typed parts as necessary.
    #
    def ask_to_continue
      Formatador.display_line "\n\n*** [bold]Press ENTER to type CODE[/] ***"
      STDIN.gets
    end

    #
    # A non-code portion of the story simply needs to be collected up and
    # a string needs to be created from it. This method is called recursively
    # to child elements to create the entire string to be displayed. There
    # are some simple rules for headers to make them a particular color.
    #
    def build_standard_chapter(node)

      story_so_far = ""

      story_so_far += "\n#{header_display_color}" if node.type == :header
      story_so_far += node.value if node.type == :text

      if not node.children.empty?
        node.children.each do |child|
          story_so_far += build_standard_chapter(child).to_s
        end
      end

      story_so_far += "[/]\n" if node.type == :header

      story_so_far
    end

    def header_display_color
      "[green]"
    end

  end

end