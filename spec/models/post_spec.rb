require 'spec_helper'

describe Post do

  describe 'validation' do

    it 'should not be valid when title is empty' do
      @post = Post.new
      @post.should_not be_valid
    end

  end

end
