# coding: utf-8
require 'spec_helper'
require 'spec_helper'
require 'date'
require 'time'
require 'active_support'
require 'active_support/time'

describe Cureutils do
  it 'has a version number' do
    expect(Cureutils::Version).not_to be nil
  end
end

describe 'pregex2regex' do
  before do
    @precure_names = Precure.all_stars.map(&:precure_name).join('|')
    @precure_names += '|' + Cure.echo[:precure_name]
    @precure_names_ex    = '(?:' + @precure_names + ')'
    @precure_names_ex_br = '(' + @precure_names + ')'
    @human_names = Precure.all_stars.map(&:human_name).join('|')
    @human_names += '|' + Cure.echo[:human_name]
    @human_names_ex = '(?:' + @human_names + ')'
    @human_names_ex_br = '(' + @human_names + ')'
  end

  it 'nothing' do
    input = 'abc'
    result = 'abc'
    cli = Cureutils::CLI.new
    expect(cli.send(:pregex2regex, input)).to eq(result)
  end

  it 'precure_name' do
    input = '[:precure_name:]'
    result = @precure_names_ex
    cli = Cureutils::CLI.new
    expect(cli.send(:pregex2regex, input)).to eq(result)
  end

  it 'precure_name + other regex' do
    cli = Cureutils::CLI.new
    input = '^.*[:precure_name:].*[abc]$'
    result = '^.*' + @precure_names_ex + '.*[abc]$'
    expect(cli.send(:pregex2regex, input, false)).to eq(result)
  end

  it 'precure_name + human_name + other regex' do
    cli = Cureutils::CLI.new
    input = '^.*[:precure_name:].*[:human_name:][abc]$'
    result = '^.*' + @precure_names_ex + '.*' + @human_names_ex + '[abc]$'
    expect(cli.send(:pregex2regex, input, false)).to eq(result)
  end

  it 'precure_name + human_name + other regex without back reference' do
    cli = Cureutils::CLI.new
    input = '^.*[:precure_name:].*[:human_name:][abc]$'
    result = '^.*' + @precure_names_ex_br + '.*' + @human_names_ex_br + '[abc]$'
    expect(cli.send(:pregex2regex, input, true)).to eq(result)
  end
end

describe 'util' do
  it 'str2pregex' do
    cli = Cureutils::CLI.new
    input = 'precure_name'
    result = '[:precure_name:]'
    expect(cli.send(:str2pregex, input)).to eq(result)
  end

  it 'pregex2str' do
    cli = Cureutils::CLI.new
    input = '[:precure_name:]'
    result = 'precure_name'
    expect(cli.send(:pregex2str, input)).to eq(result)
  end

  it 'cure_table - キュアブラック 美墨なぎさ' do
    cli = Cureutils::CLI.new
    input = 'キュアブラック'
    result = '美墨なぎさ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアホワイト 雪城ほのか' do
    cli = Cureutils::CLI.new
    input = 'キュアホワイト'
    result = '雪城ほのか'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  シャイニールミナス 九条ひかり' do
    cli = Cureutils::CLI.new
    input = 'シャイニールミナス'
    result = '九条ひかり'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアブルーム 日向咲' do
    cli = Cureutils::CLI.new
    input = 'キュアブルーム'
    result = '日向咲'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  # TODO: cure bright

  it 'cure_table -  キュアイーグレット 美翔舞' do
    cli = Cureutils::CLI.new
    input = 'キュアイーグレット'
    result = '美翔舞'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  # TODO: cure windy

  it 'cure_table -  キュアドリーム 夢原のぞみ' do
    cli = Cureutils::CLI.new
    input = 'キュアドリーム'
    result = '夢原のぞみ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアルージュ 夏木りん' do
    cli = Cureutils::CLI.new
    input = 'キュアルージュ'
    result = '夏木りん'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアレモネード 春日野うらら' do
    cli = Cureutils::CLI.new
    input = 'キュアレモネード'
    result = '春日野うらら'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアミント 秋元こまち' do
    cli = Cureutils::CLI.new
    input = 'キュアミント'
    result = '秋元こまち'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアアクア 水無月かれん' do
    cli = Cureutils::CLI.new
    input = 'キュアアクア'
    result = '水無月かれん'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  ミルキィローズ 美々野くるみ' do
    cli = Cureutils::CLI.new
    input = 'ミルキィローズ'
    result = '美々野くるみ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアベリー 蒼乃美希' do
    cli = Cureutils::CLI.new
    input = 'キュアベリー'
    result = '蒼乃美希'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアパイン 山吹祈里' do
    cli = Cureutils::CLI.new
    input = 'キュアパイン'
    result = '山吹祈里'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアパッション 東せつな' do
    cli = Cureutils::CLI.new
    input = 'キュアパッション'
    result = '東せつな'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアブロッサム 花咲つぼみ' do
    cli = Cureutils::CLI.new
    input = 'キュアブロッサム'
    result = '花咲つぼみ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアマリン 来海えりか' do
    cli = Cureutils::CLI.new
    input = 'キュアマリン'
    result = '来海えりか'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアサンシャイン 明堂院いつき' do
    cli = Cureutils::CLI.new
    input = 'キュアサンシャイン'
    result = '明堂院いつき'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアムーンライト 月影ゆり' do
    cli = Cureutils::CLI.new
    input = 'キュアムーンライト'
    result = '月影ゆり'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアメロディ 北条響' do
    cli = Cureutils::CLI.new
    input = 'キュアメロディ'
    result = '北条響'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアリズム 南野奏' do
    cli = Cureutils::CLI.new
    input = 'キュアリズム'
    result = '南野奏'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアビート 黒川エレン' do
    cli = Cureutils::CLI.new
    input = 'キュアビート'
    result = '黒川エレン'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアミューズ 調辺アコ' do
    cli = Cureutils::CLI.new
    input = 'キュアミューズ'
    result = '調辺アコ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアハッピー 星空みゆき' do
    cli = Cureutils::CLI.new
    input = 'キュアハッピー'
    result = '星空みゆき'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアサニー 日野あかね' do
    cli = Cureutils::CLI.new
    input = 'キュアサニー'
    result = '日野あかね'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアピース 黄瀬やよい' do
    cli = Cureutils::CLI.new
    input = 'キュアピース'
    result = '黄瀬やよい'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアマーチ 緑川なお' do
    cli = Cureutils::CLI.new
    input = 'キュアマーチ'
    result = '緑川なお'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアビューティ 青木れいか' do
    cli = Cureutils::CLI.new
    input = 'キュアビューティ'
    result = '青木れいか'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアハート 相田マナ' do
    cli = Cureutils::CLI.new
    input = 'キュアハート'
    result = '相田マナ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアダイヤモンド 菱川六花' do
    cli = Cureutils::CLI.new
    input = 'キュアダイヤモンド'
    result = '菱川六花'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアロゼッタ 四葉ありす' do
    cli = Cureutils::CLI.new
    input = 'キュアロゼッタ'
    result = '四葉ありす'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアソード 剣崎真琴' do
    cli = Cureutils::CLI.new
    input = 'キュアソード'
    result = '剣崎真琴'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアエース 円亜久里' do
    cli = Cureutils::CLI.new
    input = 'キュアエース'
    result = '円亜久里'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアラブリー 愛乃めぐみ' do
    cli = Cureutils::CLI.new
    input = 'キュアラブリー'
    result = '愛乃めぐみ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアプリンセス 白雪ひめ(ヒメルダ・ウインドウ・キュアクイーン・オブ・ザ・ブルースカイ)' do
    cli = Cureutils::CLI.new
    input = 'キュアプリンセス'
    result = '白雪ひめ(ヒメルダ・ウインドウ・キュアクイーン・オブ・ザ・ブルースカイ)'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  humanize キュアプリンセス' do
    cli = Cureutils::CLI.new
    input = '白雪ひめ(ヒメルダ・ウインドウ・キュアクイーン・オブ・ザ・ブルースカイ)'
    result = 'キュアプリンセス'
    table = cli.send(:cure_table, :human_name, :precure_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアハニー 大森ゆうこ' do
    cli = Cureutils::CLI.new
    input = 'キュアハニー'
    result = '大森ゆうこ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアフォーチュン 氷川いおな' do
    cli = Cureutils::CLI.new
    input = 'キュアフォーチュン'
    result = '氷川いおな'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアフローラ 春野はるか' do
    cli = Cureutils::CLI.new
    input = 'キュアフローラ'
    result = '春野はるか'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアマーメイド 海藤みなみ' do
    cli = Cureutils::CLI.new
    input = 'キュアマーメイド'
    result = '海藤みなみ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアトゥインクル 天ノ川きらら' do
    cli = Cureutils::CLI.new
    input = 'キュアトゥインクル'
    result = '天ノ川きらら'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアスカーレット 紅城トワ' do
    cli = Cureutils::CLI.new
    input = 'キュアスカーレット'
    result = '紅城トワ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアマジカル 十六夜リコ' do
    cli = Cureutils::CLI.new
    input = 'キュアマジカル'
    result = '十六夜リコ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアミラクル 朝日奈みらい' do
    cli = Cureutils::CLI.new
    input = 'キュアミラクル'
    result = '朝日奈みらい'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end

  it 'cure_table -  キュアエコー 坂上あゆみ' do
    cli = Cureutils::CLI.new
    input = 'キュアエコー'
    result = '坂上あゆみ'
    table = cli.send(:cure_table, :precure_name, :human_name)
    expect(table[input]).to eq(result)
  end
end

describe 'CureDate' do
  it 'CureDate - Empty date' do
    the_day = Date.parse('1970-01-01')
    the_day_event = ''
    expect(CureDateChecker.events(the_day)).to eq(the_day_event)
  end

  it 'CureDate - Birthday' do
    the_day = Date.parse('2004-10-10')
    the_day_event = '美墨なぎさ(キュアブラック)誕生日/ふたりはプリキュア放映期間'
    expect(CureDateChecker.events(the_day)).to eq(the_day_event)
  end

  it 'CureDate - Series date' do
    the_day = Date.parse('2004-10-09')
    the_day_event = 'ふたりはプリキュア放映期間'
    expect(CureDateChecker.events(the_day)).to eq(the_day_event)
  end

  it 'CureDate - First Series date' do
    the_day = Date.parse('2008-02-03')
    the_day_event = 'Yes！ プリキュア5 Go Go！初放映'
    expect(CureDateChecker.events(the_day)).to eq(the_day_event)
  end

  it 'CureDate - Last Series date' do
    the_day = Date.parse('2012-01-29')
    the_day_event = 'スイートプリキュア♪最終回'
    expect(CureDateChecker.events(the_day)).to eq(the_day_event)
  end

  it 'natural_lang2time' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '2016-01-01')
    expect(result).to eq(Time.parse('2016-01-01'))
  end

  it 'natural_lang2time - 6 years ago' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '6 years ago')
    expect(result.strftime('%F')).to eq((Time.now - 6.years).strftime('%F'))
  end

  it 'natural_lang2time - 7 months ago' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '7 months ago')
    expect(result.strftime('%F')).to eq((Time.now - 7.month).strftime('%F'))
  end

  it 'natural_lang2time - 8 weeks ago' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '8 weeks ago')
    expect(result.strftime('%F')).to eq((Time.now - 8.week).strftime('%F'))
  end

  it 'natural_lang2time - 1 day ago' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '1 day ago')
    expect(result.strftime('%F')).to eq((Time.now - 1.day).strftime('%F'))
  end

  it 'natural_lang2time - yesterday' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, 'yesterday')
    expect(result.strftime('%F')).to eq((Time.now - 1.day).strftime('%F'))
  end

  it 'natural_lang2time - 6 years' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '6 years')
    expect(result.strftime('%F')).to eq((Time.now + 6.years).strftime('%F'))
  end

  it 'natural_lang2time - 7 months' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '7 months')
    expect(result.strftime('%F')).to eq((Time.now + 7.month).strftime('%F'))
  end

  it 'natural_lang2time - 8 weeks' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '8 weeks')
    expect(result.strftime('%F')).to eq((Time.now + 8.week).strftime('%F'))
  end

  it 'natural_lang2time - 1 day' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, '1 day')
    expect(result.strftime('%F')).to eq((Time.now + 1.day).strftime('%F'))
  end

  it 'natural_lang2time - tomorrow' do
    cli = Cureutils::CLI.new
    result = cli.send(:natural_lang2time, 'tomorrow')
    expect(result.strftime('%F')).to eq((Time.now + 1.day).strftime('%F'))
  end
end

describe 'Cure Grep' do
  it 'detect input file' do
    cli = Cureutils::CLI.new
    result = cli.send(:input_from, 'README.md')
    expect(result).to be_an_instance_of(File)
  end

  it 'input file is "-"' do
    cli = Cureutils::CLI.new
    result = cli.send(:input_from, '-')
    expect(result).to eq($stdin)
  end

  it 'input file is empty ""' do
    cli = Cureutils::CLI.new
    result = cli.send(:input_from, '')
    expect(result).to eq($stdin)
  end

  it 'input file is nothing' do
    cli = Cureutils::CLI.new
    result = cli.send(:input_from, nil)
    expect(result).to eq($stdin)
  end
end
