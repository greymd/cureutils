# coding: utf-8

# Singleton class for cure echo
class CureEchoManager
  module EchoMode
    TRANSFORM = 1
    ATTACK = 2
  end

  def initialize
    @in  = $stdin
    @out = $stdout
    @err = $stderr
    @cure_name = 'echo'
    @message_mode = EchoMode::TRANSFORM
  end

  def source_output(source = $stdout)
    @out = source
  end

  def source_input(source = $stdin)
    @in = source
  end

  def source_err(source = $stderr)
    @err = source
  end

  def precure(cure_name = false)
    @cure_name = cure_name || 'echo'
  end

  def msg_transform(flag = true)
    @message_mode = EchoMode::TRANSFORM if flag
  end

  def msg_attack(flag = false)
    @message_mode = EchoMode::ATTACK if flag
  end

  def nosleep(flag = true)
    Rubicure::Girl.sleep_sec = 1
    Rubicure::Girl.sleep_sec = 0 if flag
  end

  def print_results
    return 1 unless existing_precure?
    if @message_mode == EchoMode::TRANSFORM
      Cure.send(@cure_name.to_sym).transform!
    elsif @message_mode == EchoMode::ATTACK
      Cure.send(@cure_name.to_sym).transform!
      Cure.send(@cure_name.to_sym).attack!
    end
    0
  end

  private

  def existing_precure?
    found_precure = Rubicure::Girl.config.find do |k, _v|
      k == @cure_name.to_sym
    end
    if found_precure
      true
    else
      @err.puts "No such precure #{@cure_name}"
      false
    end
  end
end
