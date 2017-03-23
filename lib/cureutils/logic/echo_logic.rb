# coding: utf-8
require 'cureutils/logic/base_logic'

# Singleton class for cure echo
class EchoLogic < BaseLogic
  module EchoMode
    TRANSFORM = 1
    ATTACK = 2
  end

  def initialize
    super
    @cure_name = 'echo'
    @message_mode = EchoMode::TRANSFORM
    @style_priority = []
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

  def style(style)
    @style_priority << style.to_sym if style
  end

  def print_results
    return 1 unless existing_precure?
    precure = Cure.send(@cure_name.to_sym)
    if @message_mode == EchoMode::TRANSFORM
      precure = original_transform(precure)
    elsif @message_mode == EchoMode::ATTACK
      precure = original_transform(precure)
      precure.attack!
    end
    0
  end

  private

  def original_transform(precure)
    return precure.transform! unless precure.respond_to?(:transform_styles)
    chosen_style = @style_priority.find do |s|
      precure.transform_styles.include?(s)
    end
    if chosen_style
      precure.transform! chosen_style
    else
      default_style, _entity = precure.transform_styles.first
      precure.transform! default_style
    end
  end

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
