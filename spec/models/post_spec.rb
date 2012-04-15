require 'spec_helper'

describe Post do

  describe 'validation' do

    it 'should fail if title is empty' do
      post = Post.new

      post.should_not be_valid
      post.errors[:title].should =~ ["can't be blank"]
    end

    it 'should fail if content is empty' do
      post = Post.new

      post.should_not be_valid
      post.errors[:content].should =~ ["can't be blank"]
    end

  end

end
