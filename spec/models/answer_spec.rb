require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!( title: 'Question Title', body: 'Question Body', resolved: false) }
  let(:answer) { Answer.create!(question: question, body: 'Answer Body') }

  describe "attributes" do
    it "should have the proper attributes" do
      expect(answer).to have_attributes(question: question, body: 'Answer Body')
    end
  end
end
