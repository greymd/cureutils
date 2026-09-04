# frozen_string_literal: true

require 'cureutils/logic/base_logic'

#
# Class of Pikarin Janken
#
class JankenLogic < BaseLogic
  def initialize
    super
    # Set the sleep time 0
    Rubicure::Girl.sleep_sec = 0
    # 0: win, 1: lose, 2: aiko
    @result_table = [[2, 0, 1, 1],
                     [1, 2, 0, 1],
                     [0, 1, 2, 1],
                     [0, 0, 0, 2]]
    @result_idx = %w[あなたのかち あなたのまけ あいこ]
    @te_idx = %w[グー チョキ パー グッチョッパー]
    @te_hash = Hash[[@te_idx, (0..3).map(&:to_s)].transpose]
    @buf = []
  end

  def puts(input)
    @buf << input
  end

  # Ruby requires the object assigned to $stdout to respond to #write.
  # Rubicure prints with Kernel#puts, so #puts is what collects the message,
  # but #write has to exist for the assignment to be accepted.
  def write(*args)
    args.each { |arg| @buf << arg.to_s }
    args.sum { |arg| arg.to_s.length }
  end

  def janken
    capture_message { Cure.peace.janken }
    @buf[0..1].each do |msg|
      @out.puts msg
    end
    judge
  end

  # Rubicure::Girl#print_by_line writes the message with Kernel#puts, which
  # always goes to $stdout. Rubicure::Girl is a Hash with MethodAccess, so
  # `Cure.peace.io = self` just stored a Hash key and never redirected the
  # output. As a result @buf stayed empty, the hand was printed before the
  # player's input and #generated_te always fell back to 0 (グー).
  # Swapping $stdout keeps the message in @buf without depending on
  # Rubicure's internals.
  def capture_message
    original_stdout = $stdout
    $stdout = self
    yield
  ensure
    $stdout = original_stdout
  end

  def generated_te
    @buf.last =~ /(#{@te_idx.join('|')})/
    @te_hash[Regexp.last_match(1)].to_i
  end

  def input_te
    @out.print('1...グー, 2...チョキ, 3...パー : ')
    # TODO: Check input and raise the error.
    player_te = $stdin.gets
    player_te.to_i - 1
  end

  def judge
    cure_te = generated_te
    player_te = input_te
    result_num = @result_table[player_te][cure_te]
    result = @result_idx[result_num]
    print_results(@te_idx[player_te], @te_idx[cure_te], result)
    result_num
  end

  def print_results(player_te, cure_te, result)
    @out.puts
    @out.puts 'あなた: ' + player_te
    @out.puts 'キュアピース: ' + cure_te
    @out.puts
    @out.puts '[結果]'
    @out.puts result
  end
end
