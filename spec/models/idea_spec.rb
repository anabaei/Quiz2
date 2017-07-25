require 'rails_helper'

RSpec.describe Idea, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

	describe 'New action test' do
	     it 'Check for title present' do
	      # GIVEN: a campaign in the base with a title and a new Campaign object
	      #        instantiated with the same title
	      newIdea = Idea.create({ title: 'abc', des: 'hello' })
	      newIdea.title = ' '
	      newIdea.valid?
	      expect(newIdea.errors).to have_key(:title)
          end

          it 'Check for  description present' do
	      # GIVEN: a campaign in the base with a title and a new Campaign object
	      #        instantiated with the same title
	      newIdea = Idea.create({ title: 'abc', des: 'hello' })
	      newIdea.des = ' '
	      newIdea.valid?
	      expect(newIdea.errors).to have_key(:des)
          end  
    end

     

end
