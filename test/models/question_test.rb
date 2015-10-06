require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    # This code is not idiomatically correct.
    @question = Question.new(question: "Lorem ipsum", answer: "Lorem ipsum")
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "question should be present" do
    @question.question = "    "
    assert_not @question.valid?
  end

  test "question should not be nil" do
    @question.question = nil
    assert_not @question.valid?
  end

  test "answer should be present" do
    @question.answer = "       "
    assert_not @question.valid?
  end

  test "answer should not be nil" do
    @question.answer = nil
    assert_not @question.valid?
  end
end