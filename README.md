# GhostStory

Ghost Story allows you to write a story in markdown. The story can then be
read back to you. A ghost story is both text and automated scripts that will
type out code.

The initial use case is for composing repeatable screencasts. When you set out
to write a screencast you often times compose a script and the code that
accompanies it. There are some inherent problems with this manual method of
telling a story:

- Typing the code is cumbersome and error prone
- Removing errors and mistyping during the editing process is a waste of time
- Editing or updating your screencast later requires you re-create an entire section manually.

## Installation

Add this line to your application's Gemfile:

    gem 'ghost_story'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ghost_story

## Usage

First write the script that you want to execute in markdown.

    # Ruby Classes

    If you are already familar with classes in other languages, you will have
    no time understanding how they are created in Ruby.

    ~~~~
    class Square

      def initialize(height)
        @height = height
      end

      attr_reader :height

      def area
        height * height
      end
    end
    ~~~~

Then with the completed script you run the `ghost_story` binary which will
read the story and then create an interactive version which will show you the
written parts and then type the code between the code fences.

> Some limitation in Kramdown, which is used to generate an object representation
> of the document, works consistently with the `~~~` instead of the three backticks.

```
$ ghost_story tell ruby_classes.md
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ghost_story/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
