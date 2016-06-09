require 'test_helper'

class EnthusiasmServiceTest < ActiveSupport::TestCase
  test "it sets text_content" do
    page_text = 'I like tuttles!'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(page_text, enthusiasm.text_content)
  end

  test "it counts instances of Fabio" do
    page_text = 'Fabio is the greatest fabio of all the FabiOs'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(3, enthusiasm.name_count('Fabio'))
  end

  test "it collects known enthusiastic words" do
    page_text = 'Wow wow wow like omg'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(4, enthusiasm.usage_of_known_enthusiastic_words)
  end

  test "it does not partially match known enthusiastic words" do
    skip
    page_text = 'Wowasdfeawowasdfe'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(0, enthusiasm.usage_of_known_enthusiastic_words)
  end

  test "it counts how many words are in all caps" do
    skip
    page_text = 'email goes to webmaster - NOT to FABIO!'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(2, enthusiasm.capslock_count)
  end

  test "it handles capslock edge cases" do
    skip
    page_text = 'A cat ate my homework'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(0, enthusiasm.capslock_count)
  end

  test "it counts sentences ending in exclamation points" do
    skip
    page_text = 'WOW! The fans are into these!!!'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(2, enthusiasm.exclamatory_sentences)
  end

  test "it counts instances of multiple exclamation points" do
    skip
    page_text = 'WOW! The fans are into these!!!'
    params = { text: page_text }
    enthusiasm = EnthusiasmService.new(params)
    assert_equal(1, enthusiasm.instances_multiple_exclamation_points)
  end
end
