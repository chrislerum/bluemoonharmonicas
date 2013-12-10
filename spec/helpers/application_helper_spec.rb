require 'spec_helper'

describe ApplicationHelper do

  describe '#markdown_and_replace' do 
    before :each do
      @snippet = FactoryGirl.create(:snippet, text: 'example')
    end
    context 'with markdown' do
      it "interprets markdown" do
        # not thorough at all; we're just testing to make sure markdown is working.
        markdown_and_replace("test").should eq("<p>test</p>\n")
      end
    end

    context 'with snippet coding' do
      it "inserts the snippet text" do
        markdown_and_replace("test :#{@snippet.shortcut}: excellent").should eq("<p>test example excellent</p>\n")
      end

      it "inserts nothing if the snippet doesn't exist" do
        markdown_and_replace("test :not_a_snippet: excellent").should eq("<p>test  excellent</p>\n")
      end
    end
  end

end
