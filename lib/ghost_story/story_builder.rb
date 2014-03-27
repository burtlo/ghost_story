module GhostStory

  class StoryBuilder

    def self.build(story)
      kram = Kramdown::Document.new(story)

      binding.pry
      whole_story = [ clear_screen ] + build_story(kram.root)

      Story.new(whole_story)
    end

    def self.build_story(node_with_children)
      node_with_children.children.map do |node|
        build_chapter(node)
      end
    end

    def self.build_chapter(node)
      if node_contains_code?(node)
        build_code_chapter(node)
      else
        lambda { Formatador.display build_standard_chapter(node) }
      end
    end

    def self.node_contains_code?(node)
      node.type == :codeblock
    end

    def self.build_code_chapter(node)
      code = node.value

      lambda { ask_for_input ; Dutchman.write(to: "Sublime Text", text: code, speed: :fast, humanize: true) }
    end

    def self.clear_screen
      lambda { puts "\e[H\e[2J" }
    end

    def self.ask_for_input
      Formatador.display_line "\n*** [bold]Press ENTER to type CODE[/] ***\n"
      STDIN.gets
    end

    def self.build_standard_chapter(node)

      story_so_far = ""

      story_so_far += "\n[green]" if node.type == :header
      story_so_far += node.value if node.type == :text

      if not node.children.empty?
        node.children.each do |child|
          story_so_far += build_standard_chapter(child).to_s
        end
      end

      story_so_far += "[/]\n" if node.type == :header

      story_so_far
    end

  end

end