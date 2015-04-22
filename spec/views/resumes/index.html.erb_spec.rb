require 'rails_helper'

RSpec.describe "resumes/index", type: :view do
  before(:each) do
    assign(:resumes, [
      Resume.create!(
        :sentence => "Sentence",
        :is_translation => false,
        :owner_id => 1,
        :translator_id => 2,
        :language => nil
      ),
      Resume.create!(
        :sentence => "Sentence",
        :is_translation => false,
        :owner_id => 1,
        :translator_id => 2,
        :language => nil
      )
    ])
  end

  it "renders a list of resumes" do
    render
    assert_select "tr>td", :text => "Sentence".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
