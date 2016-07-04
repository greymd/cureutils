# coding: utf-8
#
# Class of Pikarin Janken
#
class CureJankenManager
  def initialize
    # Set the sleep time 0
    Rubicure::Girl.sleep_sec = 0
    # 0: win, 1: lose, 2: aiko
    @result_table = [[2, 0, 1, 1],
                     [1, 2, 0, 1],
                     [0, 1, 2, 1],
                     [0, 0, 0, 2]]
    @result_idx = %w(あなたのかち あなたのまけ あいこ)
    @te_idx = %w(グー チョキ パー グッチョッパー)
    @te_hash = Hash[[@te_idx, (0..3).map(&:to_s)].transpose]
    @buf = []
    @out = $stdout
  end

  attr_writer :io

  def source_output(output = $stdout)
    @out = output
  end

  def puts(input)
    @buf << input
  end

  def janken
    Cure.peace.io = self
    Cure.peace.janken
    @buf[0..1].each do |msg|
      @out.puts msg
    end
    judge
  end

  def generated_te
    @buf.last =~ /(#{@te_idx.join('|')})/
    @te_hash[Regexp.last_match(1)].to_i
  end

  def input_te
    @out.print("1...グー, 2...チョキ, 3...パー : ")
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
