# coding: utf-8
#
# Wrapper class of Pikarin Janken
#
class JankenContoller
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
    @io = $stdout
  end

  attr_writer :io

  def puts(input)
    @buf << input
  end

  def janken
    Cure.peace.io = self
    Cure.peace.janken
    @buf[0..1].each do |msg|
      @io.puts msg
    end
    judge
  end

  def generate_te
    @buf.last =~ /(#{@te_idx.join('|')})/
    @te_hash[Regexp.last_match(1)]
  end

  def input_te
    @io.print("0...グー, 1...チョキ, 2...パー : ")
    player_te = $stdin.gets
    player_te
  end

  def judge
    cure_te = generate_te
    player_te = input_te
    result_num = @result_table[player_te.to_i][cure_te.to_i]
    result = @result_idx[result_num]
    print_results(@te_idx[player_te.to_i], @te_idx[cure_te.to_i], result)
    result_num
  end

  def print_results(player_te, cure_te, result)
    @io.puts
    @io.puts 'あなた: ' + player_te
    @io.puts 'キュアピース: ' + cure_te
    @io.puts
    @io.puts '[結果]'
    @io.puts result
  end
end
