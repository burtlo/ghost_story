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

    desc "tell STORYFILE APPLICATION",
      "Tell the story contained in the file"
    def tell(story_file,application=nil)
      # TODO: find out of the file is real!
      # TODO: Seems Thor has an options hash, so this is probabyly a bad name
      options = { application: application }
      GhostStory.read_file(story_file,options)
    end

    desc "help", "This commoand"
    def help
      say banner
      print_table self.class.printable_tasks, indent: 4
    end

  end
end
