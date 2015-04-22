require 'rails_helper'

RSpec.describe "resumes/new", type: :view do
  before(:each) do
    assign(:resume, Resume.new(
      :sentence => "MyString",
      :is_translation => false,
      :owner_id => 1,
      :translator_id => 1,
      :language_id => nil
    ))
  end

  it "renders new resume form" do
    render

    assert_select "form[action=?][method=?]", resumes_path, "post" do

      assert_select "input#resume_sentence[name=?]", "resume[sentence]"

      assert_select "input#resume_is_translation[name=?]", "resume[is_translation]"

      assert_select "input#resume_owner_id[name=?]", "resume[owner_id]"

      assert_select "input#resume_translator_id[name=?]", "resume[translator_id]"

      assert_select "input#resume_language_id[name=?]", "resume[language_id]"
    end
  end
end
