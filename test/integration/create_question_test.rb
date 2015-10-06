require 'test_helper'

class CreateQuestionTest < ActionDispatch::IntegrationTest
  
  test "invalid question creation" do
    get new_question_path
    assert_no_difference 'Question.count' do
      post questions_path, question: { question:  "", answer: "" }
    end
    assert_template 'questions/new'
  end

  test "valid question creation" do
    get new_question_path
    assert_difference 'Question.count', 1 do
      post_via_redirect questions_path, question: { question:  "Lorem ipsum", answer: "Lorem ipsum" }
    end
    assert_template 'questions/show'
  end
end
