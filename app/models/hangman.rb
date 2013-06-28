class Hangman < ActiveRecord::Base
POSSIBLE_HANGMAN_CHARS=' '..'~'

validate do |hangman|
    hangman.must_not_allow_additions_to_the_puzzle
    hangman.must_only_allow_simple_characters
  end

  def diffs
    Diff.new(solution, puzzle).diffs.flatten(1)
  end

  def must_not_allow_additions_to_the_puzzle
    errors.add(:solution, "Characters added to solution") if diffs.any?{|d| d.first == "+"}
  end

  def must_only_allow_simple_characters
    errors.add(:solution,"Hangman blanks must be valid characters") unless diffs.all?{|d| POSSIBLE_HANGMAN_CHARS.include?(d.third)}
  end
end
