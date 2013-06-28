require 'spec_helper'

describe Hangman do
  context 'validation' do
    let(:solution) { '  def something#this is a methodend  ' }
    let(:puzzle)   { '  df something#this is a methodend ' }

    it 'should fail if the puzzle has more characters than the solution' do
      bad_puzzle = "bad#{solution} more"
      Hangman.new(solution: solution, puzzle: bad_puzzle).should have(1).error_on(:solution)
    end

    it 'should not fail for valid puzzles' do
      Hangman.new(solution: solution, puzzle: puzzle).should have(0).error_on(:solution)
    end

    it 'should fail if the puzzle has different characters than the solution' do
      bad_solution = puzzle.tr "e", 'a'
      Hangman.new(solution: bad_solution, puzzle: puzzle).should have(1).error_on(:solution)
    end

    it 'should fail if any hangman blanks represent invalid characters' do
      bad_solution = solution.tr 'e', '£'
      bad_puzzle = bad_solution.tr '£', ''
      Hangman.new(solution: bad_solution, puzzle: bad_puzzle).should have(1).error_on(:solution)
    end

    it 'handles quotes' do
      Hangman.new(solution: %Q{"'}, puzzle:'').diffs.should == [["-", 0, '"'], ["-", 1, "'"]]
      other_solution = solution.tr 'e', '"'
      other_puzzle = other_solution.tr '"', ''
      Hangman.new(solution: other_solution, puzzle: other_puzzle).should have(0).error_on(:solution)
    end
  end
end
