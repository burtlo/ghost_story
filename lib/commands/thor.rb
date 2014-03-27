require 'thor'
# require 'thor/group'

module GhostStory

  class Thor < Thor

    no_tasks do

      def banner
        """
********************************************************************************
Ghost Story BOOO!
-------------------------------------------------------------------------------"""
      end

    end

    desc "tell STORYFILE",
      "Tell the story contained in the file"
    def tell(story_file)
      # TODO: find out of the file is real!
      GhostStory.read_file(story_file)
    end

    desc "help", "This commoand"
    def help
      say banner
      print_table self.class.printable_tasks, indent: 4
    end

  end
end
