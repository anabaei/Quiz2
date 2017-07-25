require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

let(:user)     { FactoryGirl.create(:user) }
  describe '#new' do
      it 'redirects to the sign in page' do
        get :new
        expect(response).to render_template(:new)
      end
    
   end 

   describe '#create' do

          def valid_post
             post :create, params: { idea: FactoryGirl.attributes_for(:idea) }
          end
     
      context 'with signed in user' do
          before do
             request.session[:user_id] = user.id
          end

         it 'checks post is created?' do
            count_before = Idea.count
            valid_post
            count_after = Idea.count
            expect(count_after).to eq(count_before + 1)
         end

          it 'associates the created idea with the signed in user' do
            valid_post
            expect(Idea.last.user).to eq(user)
          end

       end 

       context 'with not signed in user' do
         it 'no authority so can not create an idea' do
            valid_post
            expect(response).to redirect_to(ideas_path)
         end

         context 'with invalid attributes' do
          before do
            idea = FactoryGirl.attributes_for(:idea)
            idea[:title] = ''
            post :create, params: { idea: idea }
          end
          it 'doesn\'t create a idea in the database' do
          expect(Idea.count).to eq(0)
          end
      
          it 'renders new template' do
            expect(response).to redirect_to(new_idea_path)
          end
         end 
       end      
   end 
end
