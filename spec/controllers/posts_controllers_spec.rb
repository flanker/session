require 'spec_helper'

describe PostsController do

  describe 'create post' do

    before(:each) do
      post :create, :post => {:title => 'my title', :content => 'my content'}
      @post = Post.first
    end

    it 'should save post' do
      @post.title.should === 'my title'
      @post.content.should === 'my content'
    end

    it 'should redirect to post detail page' do
      response.status.should === 302
      response.should redirect_to(post_path(@post))
    end

    describe 'delete post' do

      before(:each) do
        post :destroy, :id => @post.id
      end

      it 'should not be found' do
        Post.count.should === 0
      end

    end

  end

end
