require 'spec_helper'

describe UsersController, :type => :controller do
	describe 'get index' do
	    before :each do
	      @fake_users = [double('user1'), double('user2')]
	    end
	    
	    it 'should call the model method that retrieves all Users' do
	      User.should_receive(:all).once.and_return(@fake_users)
	      get :index
	    end
	    
	    describe 'after valid search' do
	      before :each do
		User.stub(:all).and_return(@fake_users)
		get :index
	      end
	      
	      it 'should select the index template for rendering' do
		response.should render_template('index')
	      end
	      
	      it 'should make the users results available to that template' do
		assigns(:users).should == @fake_users
	      end
	    end
	end
	
	describe 'show user' do
	    before :each do
	      @fake_user = FactoryGirl.create(:user)
	    end
	    
	    it 'should call the model method that retrieves the User for that id' do
	      User.should_receive(:find).once.and_return(@fake_user)
	      get :show, id: @fake_user.id
	    end
	    
	    describe 'after valid search' do
	      before :each do
		User.stub(:find).and_return(@fake_user)
		get :show, id: @fake_user.id
	      end
	      
	      it 'should select the show template for rendering' do
		response.should render_template('show')
	      end
	      
	      it 'should make the user result available to that template' do
		assigns(:user).should == @fake_user
	      end
	    end
	end
	
	describe 'new user page' do
	      before :each do
		get :new
	      end
	      
	      it 'should select the new template for rendering' do
		response.should render_template('new')
	      end
	end
	
	describe 'edit user page' do
	    before :each do
	      @fake_user = FactoryGirl.create(:user)
	    end
	    
	    it 'should call the model method that retrieves the User for that id' do
	      User.should_receive(:find).once.and_return(@fake_user)
	      get :edit, id: @fake_user.id
	    end
	    
	    describe 'after valid search' do
	      before :each do
		User.stub(:find).and_return(@fake_user)
		get :edit, id: @fake_user.id
	      end
	      
	      it 'should select the edit template for rendering' do
		response.should render_template('edit')
	      end
	      
	      it 'should make the user result available to that template' do
		assigns(:user).should == @fake_user
	      end
	    end
	end
	
	describe 'create a user' do
	    before :each do
	      @fake_user = FactoryGirl.create(:user)
	      @fake_user_attr = @fake_user.attributes
	    end
	    
	    it 'should call the model method that creates a new User for the attributes and then save it to the database' do
	      User.should_receive(:new).once.and_return(@fake_user)
	      @fake_user.should_receive(:save).once.and_return(@fake_user)
	      post :create, user: @fake_user_attr
	    end
	    
	    describe 'after valid save' do
	      before :each do
	        User.stub(:new).and_return(@fake_user)
		@fake_user.stub(:save).and_return(@fake_user)
		post :create, user: @fake_user_attr
	      end
	      
	      it 'should select the show user template for rendering' do
		response.should render_template('show')
	      end
	      
	      it 'should make the user result available to that template' do
		assigns(:user).should == @fake_user
	      end
	    end
	end
	
	describe 'update a user' do
	    before :each do
	      @fake_user = FactoryGirl.create(:user)
	      @fake_user_attr = @fake_user.attributes
	      @fake_user.firstname = 'updated'
	      @fake_user_upd_attr = @fake_user.attributes
	    end
	    
	    it 'should call the model method that retrieves the User for that id and update its attributes' do
	      User.should_receive(:find).once.and_return(@fake_user)
	      @fake_user.should_receive(:update_attributes).once.and_return(@fake_user)
	      put :update, id: @fake_user.id, user: @fake_user_upd_attr
	    end
	    
	    describe 'after valid update' do
	      before :each do
	        User.stub(:find).and_return(@fake_user)
		@fake_user.stub(:update_attributes).and_return(@fake_user)
		put :update, id: @fake_user.id, user: @fake_user_upd_attr
	      end
	      
	      it 'should select the show user template for rendering' do
		response.should render_template('show')
	      end
	      
	      it 'should make the user result available to that template' do
		assigns(:user).should == @fake_user
	      end
	    end
	end
	
	describe 'delete a user' do
	    before :each do
	      @fake_user = FactoryGirl.create(:user)
	    end
	    
	    it 'should call the model method that retrieves the User for that id and delete it from the database' do
	      User.should_receive(:find).once.and_return(@fake_user)
	      @fake_user.should_receive(:destroy).once
	      delete :destroy, id: @fake_user.id
	    end
	    
	    describe 'after valid deletion' do
	      before :each do
	        User.stub(:find).and_return(@fake_user)
		@fake_user.stub(:destroy)
		delete :destroy, id: @fake_user.id
	      end
	      
	      it 'should select the show user template for rendering' do
		response.should render_template('index')
	      end
	    end
	end
end
