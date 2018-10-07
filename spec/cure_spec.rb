require 'rspec'
require 'time'
require 'English'
require 'tempfile'

describe 'version' do
  it 'show version' do
    expect(`bundle exec ./bin/cure version`).to match '^Cureutils [\.0-9]+$'
  end
end

describe 'girls' do # rubocop:disable Metrics/BlockLength
  it 'show girls' do # rubocop:disable Metrics/BlockLength
    result = `bundle exec ./bin/cure girls`
    expect(result).to include '美墨なぎさ'
    expect(result).to include '雪城ほのか'
    expect(result).to include '九条ひかり'
    expect(result).to include '日向咲'
    expect(result).to include '美翔舞'
    expect(result).to include '夢原のぞみ'
    expect(result).to include '夏木りん'
    expect(result).to include '春日野うらら'
    expect(result).to include '秋元こまち'
    expect(result).to include '水無月かれん'
    expect(result).to include '美々野くるみ'
    expect(result).to include '桃園ラブ'
    expect(result).to include '蒼乃美希'
    expect(result).to include '山吹祈里'
    expect(result).to include '東せつな'
    expect(result).to include '花咲つぼみ'
    expect(result).to include '来海えりか'
    expect(result).to include '明堂院いつき'
    expect(result).to include '月影ゆり'
    expect(result).to include '北条響'
    expect(result).to include '南野奏'
    expect(result).to include '黒川エレン'
    expect(result).to include '調辺アコ'
    expect(result).to include '星空みゆき'
    expect(result).to include '日野あかね'
    expect(result).to include '黄瀬やよい'
    expect(result).to include '緑川なお'
    expect(result).to include '青木れいか'
    expect(result).to include '相田マナ'
    expect(result).to include '菱川六花'
    expect(result).to include '四葉ありす'
    expect(result).to include '剣崎真琴'
    expect(result).to include '円亜久里'
    expect(result).to include '愛乃めぐみ'
    expect(result).to include '白雪ひめ'
    expect(result).to include '大森ゆうこ'
    expect(result).to include '氷川いおな'
    expect(result).to include '春野はるか'
    expect(result).to include '海藤みなみ'
    expect(result).to include '天ノ川きらら'
    expect(result).to include '紅城トワ'
    expect(result).to include '朝日奈みらい'
    expect(result).to include '十六夜リコ'
    expect(result).to include '花海ことは'
    expect(result).to include '宇佐美いちか'
    expect(result).to include '有栖川ひまり'
    expect(result).to include '立神あおい'
    expect(result).to include '琴爪ゆかり'
    expect(result).to include '剣城あきら'
    expect(result).to include 'キラ星シエル'
    expect(result).to include '野乃はな'
    expect(result).to include '薬師寺さあや'
    expect(result).to include '輝木ほまれ'
    expect(result).to include '愛崎えみる'
    expect(result).to include 'ルールー・アムール'
  end

  it 'show girls full' do # rubocop:disable Metrics/BlockLength
    result = `bundle exec ./bin/cure girls -fm`
    expect(result).to include '美墨なぎさ'
    expect(result).to include '雪城ほのか'
    expect(result).to include '九条ひかり'
    expect(result).to include '日向咲'
    expect(result).to include '美翔舞'
    expect(result).to include '夢原のぞみ'
    expect(result).to include '夏木りん'
    expect(result).to include '春日野うらら'
    expect(result).to include '秋元こまち'
    expect(result).to include '水無月かれん'
    expect(result).to include '美々野くるみ'
    expect(result).to include '桃園ラブ'
    expect(result).to include '蒼乃美希'
    expect(result).to include '山吹祈里'
    expect(result).to include '東せつな'
    expect(result).to include '花咲つぼみ'
    expect(result).to include '来海えりか'
    expect(result).to include '明堂院いつき'
    expect(result).to include '月影ゆり'
    expect(result).to include '北条響'
    expect(result).to include '南野奏'
    expect(result).to include '黒川エレン'
    expect(result).to include '調辺アコ'
    expect(result).to include '星空みゆき'
    expect(result).to include '日野あかね'
    expect(result).to include '黄瀬やよい'
    expect(result).to include '緑川なお'
    expect(result).to include '青木れいか'
    expect(result).to include '相田マナ'
    expect(result).to include '菱川六花'
    expect(result).to include '四葉ありす'
    expect(result).to include '剣崎真琴'
    expect(result).to include '円亜久里'
    expect(result).to include '愛乃めぐみ'
    expect(result).to include 'ヒメルダ・ウインドウ・キュアクイーン・オブ・ザ・ブルースカイ'
    expect(result).to include '大森ゆうこ'
    expect(result).to include '氷川いおな'
    expect(result).to include '春野はるか'
    expect(result).to include '海藤みなみ'
    expect(result).to include '天ノ川きらら'
    expect(result).to include 'プリンセス・ホープ・ディライト・トワ'
    expect(result).to include '朝日奈みらい'
    expect(result).to include '十六夜リコ'
    expect(result).to include '花海ことは'
    expect(result).to include '宇佐美いちか'
    expect(result).to include '有栖川ひまり'
    expect(result).to include '立神あおい'
    expect(result).to include '琴爪ゆかり'
    expect(result).to include '剣城あきら'
    expect(result).to include '野乃はな'
    expect(result).to include '薬師寺さあや'
    expect(result).to include '輝木ほまれ'
    expect(result).to include '愛崎えみる'
    expect(result).to include 'ルールー・アムール'
    expect(result).to include '坂上あゆみ'
  end
end

describe 'precures' do # rubocop:disable Metrics/BlockLength
  it 'show precures' do # rubocop:disable Metrics/BlockLength
    result = `bundle exec ./bin/cure precures`
    expect(result).to include 'キュアブラック'
    expect(result).to include 'キュアホワイト'
    expect(result).to include 'シャイニールミナス'
    expect(result).to include 'キュアブルーム'
    expect(result).to include 'キュアイーグレット'
    expect(result).to include 'キュアドリーム'
    expect(result).to include 'キュアルージュ'
    expect(result).to include 'キュアレモネード'
    expect(result).to include 'キュアミント'
    expect(result).to include 'キュアアクア'
    expect(result).to include 'ミルキィローズ'
    expect(result).to include 'キュアピーチ'
    expect(result).to include 'キュアベリー'
    expect(result).to include 'キュアパイン'
    expect(result).to include 'キュアパッション'
    expect(result).to include 'キュアブロッサム'
    expect(result).to include 'キュアマリン'
    expect(result).to include 'キュアサンシャイン'
    expect(result).to include 'キュアムーンライト'
    expect(result).to include 'キュアメロディ'
    expect(result).to include 'キュアリズム'
    expect(result).to include 'キュアビート'
    expect(result).to include 'キュアミューズ'
    expect(result).to include 'キュアハッピー'
    expect(result).to include 'キュアサニー'
    expect(result).to include 'キュアピース'
    expect(result).to include 'キュアマーチ'
    expect(result).to include 'キュアビューティ'
    expect(result).to include 'キュアハート'
    expect(result).to include 'キュアダイヤモンド'
    expect(result).to include 'キュアロゼッタ'
    expect(result).to include 'キュアソード'
    expect(result).to include 'キュアエース'
    expect(result).to include 'キュアラブリー'
    expect(result).to include 'キュアプリンセス'
    expect(result).to include 'キュアハニー'
    expect(result).to include 'キュアフォーチュン'
    expect(result).to include 'キュアフローラ'
    expect(result).to include 'キュアマーメイド'
    expect(result).to include 'キュアトゥインクル'
    expect(result).to include 'キュアスカーレット'
    expect(result).to include 'キュアミラクル'
    expect(result).to include 'キュアマジカル'
    expect(result).to include 'キュアフェリーチェ'
    expect(result).to include 'キュアホイップ'
    expect(result).to include 'キュアカスタード'
    expect(result).to include 'キュアジェラート'
    expect(result).to include 'キュアマカロン'
    expect(result).to include 'キュアショコラ'
    expect(result).to include 'キュアパルフェ'
    expect(result).to include 'キュアエール'
    expect(result).to include 'キュアアンジュ'
    expect(result).to include 'キュアエトワール'
    expect(result).to include 'キュアマシェリ'
    expect(result).to include 'キュアアムール'
  end
end

describe 'date' do # rubocop:disable Metrics/BlockLength
  it 'default' do
    t = Time.now
    result = `bundle exec ./bin/cure date`
    expect(result).to match t.strftime('%Y-%m-%d') + ' ..:..:.. ?.*'
  end

  it '-d option: 3 years ago' do
    t = Time.at(Time.now.to_i - 31_536_000 * 3 - 86_400)
    result = `bundle exec ./bin/cure date -d '3 years ago'`
    expect(result).to match t.strftime('%Y-%m-%d') + ' ..:..:.. ?.*'
  end

  it '+format: YYYY@MM@DD' do
    t = Time.now
    result = `bundle exec ./bin/cure date '+%Y@%m@%d %H:%M:%S @P'`
    expect(result).to match t.strftime('%Y@%m@%d') + ' ..:..:.. ?.*'
  end

  it '-d option and +format: YYYY@MM@DD 37 days ago' do
    t = Time.at(Time.now.to_i - 86_400 * 37)
    result = `bundle exec ./bin/cure date -d '37 days ago' '+%Y@%m@%d %H:%M:%S @P'` # rubocop:disable Metrics/LineLength
    expect(result).to match t.strftime('%Y@%m@%d') + ' ..:..:.. ?.*'
  end

  it '-d option and -f option' do
    cmd = "bundle exec ./bin/cure date -d '2015-01-01' -f - +%F:@P"
    system("bash -c 'echo 2010{01..12}{01..31}' | xargs -n 1 | #{cmd}")
    expect($CHILD_STATUS.exitstatus).to eq 1
  end

  it 'Load file with -f option' do
    begin
      file = Tempfile.new('cure_date_test')
      (1..12).each do |m|
        (1..31).each do |d|
          file.puts(format('2010%02d%02d', m, d))
        end
      end
      file.rewind
      result = `bundle exec ./bin/cure date -f #{file.path}`
      expect(result.lines.count).to eq 365
    ensure
      file.close
      file.unlink
    end
  end

  it 'Load stdin with -f option' do
    begin
      file = Tempfile.new('cure_date_test')
      (1..12).each do |m|
        (1..31).each do |d|
          file.puts(format('2011%02d%02d', m, d))
        end
      end
      file.rewind
      result = `cat #{file.path} | bundle exec ./bin/cure date -f - "+%F @P" | awk NF==1 | tr -d ' ' | xargs` # rubocop:disable Metrics/LineLength
      expected = '2011-01-31 2011-02-01 2011-02-02 2011-02-03 2011-02-04 2011-02-05' # rubocop:disable Metrics/LineLength
      expect(result.chomp).to eq expected
    ensure
      file.close
      file.unlink
    end
  end

  it 'Multiple precures are appeared' do
    result = `bundle exec ./bin/cure date -d '2016-02-07' '+%F @P'`
    expect(result.chomp).to eq '2016-02-07 キュアミラクル登場日/キュアマジカル登場日/魔法つかいプリキュア！初放映'
  end
end

describe 'echo' do # rubocop:disable Metrics/BlockLength
  it 'default' do
    result = `bundle exec ./bin/cure echo -q`
    expected = "みんなの思いを守るために
心をひとつに！
思いよ届け！キュアエコー！"
    expect(result.chomp).to eq expected
  end

  it 'attack' do
    result = `bundle exec ./bin/cure echo -aq`
    expected = "みんなの思いを守るために
心をひとつに！
思いよ届け！キュアエコー！
世界に響け、みんなの思い！
プリキュア・ハートフルエコー！"
    expect(result.chomp).to eq expected
  end

  it 'another precure' do
    result = `bundle exec ./bin/cure echo -qp happy`
    expected = "(レディ？)
プリキュア・スマイルチャージ！
(ゴー！ゴー！レッツ・ゴー！ハッピー！！)
キラキラ輝く未来の光！ キュアハッピー！
5つの光が導く未来！
輝け！スマイルプリキュア！"
    expect(result.chomp).to eq expected
  end

  it 'another precure + attack' do
    result = `bundle exec ./bin/cure echo -qap mint`
    expected = "プリキュア！メタモルフォーゼ！
安らぎの緑の大地、キュアミント！
希望の力と未来の光！
華麗に羽ばたく5つの心！
Yes！プリキュア5！
大地を揺るがす乙女の怒り、受けてみなさい！
プリキュア！エメラルド・ソーサー！"
    expect(result.chomp).to eq expected
  end

  it 'Maho girls precure' do
    result = `bundle exec ./bin/cure echo -qp magical`
    expected = "キュアップ・ラパパ！　ダイヤ！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
    expect(result.chomp).to eq expected
  end

  it 'with style option(ruby)' do
    result = `bundle exec ./bin/cure echo -qp magical -s ruby`
    expected = "キュアップ・ラパパ！　ルビー！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
    expect(result.chomp).to eq expected
  end

  it 'with style option(diamond)' do
    result = `bundle exec ./bin/cure echo -qp magical -s diamond`
    expected = "キュアップ・ラパパ！　ダイヤ！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
    expect(result.chomp).to eq expected
  end

  it 'with style option(topas)' do
    result = `bundle exec ./bin/cure echo -qap cure_miracle -s topaz`
    expected = "キュアップ・ラパパ！　トパーズ！
ミラクル・マジカル・ジュエリーレ！
ふたりの奇跡！キュアミラクル！
魔法つかいプリキュア！！
リンクルステッキ！
トパーズ！金色の希望よ私達の手に！
フルフルリンクル！
プリキュア・トパーズ・エスペランサ！"
    expect(result.chomp).to eq expected
  end

  it 'with style option(saphire)' do
    result = `bundle exec ./bin/cure echo -qp magical -s sapphire`
    expected = "キュアップ・ラパパ！　サファイア！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
    expect(result.chomp).to eq expected
  end

  it 'with style option(emerald)' do
    result = `bundle exec ./bin/cure echo -qap cure_felice -s emerald`
    expected = "キュアップ・ラパパ！エメラルド！
フェリーチェ・ファンファン・フラワーレ！
あまねく生命に祝福を！キュアフェリーチェ！
フラワーエコーワンド！
エメラルド！
キュアー・アップ！
プリキュア！エメラルド・リンカネーション！"
    expect(result.chomp).to eq expected
  end

  it 'non-existing precure' do
    system('bundle exec ./bin/cure echo -qp grepo')
    expect($CHILD_STATUS.exitstatus).to eq 1
  end
end

describe 'grep' do # rubocop:disable Metrics/BlockLength
  it 'default' do
    result = `bash -c 'echo キュア{レッド,ピンク,ホワイト,ブルー,ブラック} 東せつな' | xargs -n 1 |  bundle exec ./bin/cure grep` # rubocop:disable Metrics/LineLength
    expected = "キュアホワイト
キュアブラック"
    expect(result.chomp).to eq expected
  end

  it '-E option' do
    result = `bash -c 'echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。' | xargs -n 1 |  bundle exec ./bin/cure grep '^私は[:precure_name:]です'` # rubocop:disable Metrics/LineLength
    expected = "私はキュアホワイトです。
私はキュアブラックです。"
    expect(result.chomp).to eq expected
  end

  it 'with -o option' do
    result = `bash -c 'echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。' | xargs -n 1 |  bundle exec ./bin/cure grep -o '私は[:precure_name:]で'` # rubocop:disable Metrics/LineLength
    expected = "私はキュアホワイトで
私はキュアブラックで"
    expect(result.chomp).to eq expected
  end

  it 'with -o and -E options' do
    result = `bash -c 'echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。' | xargs -n 1 |  bundle exec ./bin/cure grep -oE '^私は.{3}'` # rubocop:disable Metrics/LineLength
    expected = "私はキュア
私はキュア
私はキュア
私はキュア
私はキュア"
    expect(result.chomp).to eq expected
  end

  it 'default with file' do
    begin
      file = Tempfile.new('cure_grep_test')
      %w[レッド ピンク ホワイト ブルー ブラック].each do |v|
        file.puts("キュア#{v}")
      end
      file.puts('東せつな')
      file.rewind
      result = `bundle exec ./bin/cure grep '[:precure_name:]' #{file.path}`
      expected = "キュアホワイト
キュアブラック"
      expect(result.chomp).to eq expected
    ensure
      file.close
      file.unlink
    end
  end

  it ' No such file error.' do
    system("bundle exec ./bin/cure grep '[:precure_name:]' nonExistTmpfile")
    expect($CHILD_STATUS.exitstatus).to eq 2
  end

  it '-E option with file' do
    begin
      file = Tempfile.new('cure_grep_test')
      %w[レッド ピンク ホワイト ブルー ブラック].each do |v|
        file.puts("私はキュア#{v}です。")
      end
      file.rewind
      result = `bundle exec ./bin/cure grep '^私は[:precure_name:]です' #{file.path}` # rubocop:disable Metrics/LineLength
      expected = "私はキュアホワイトです。
私はキュアブラックです。"
      expect(result.chomp).to eq expected
    ensure
      file.close
      file.unlink
    end
  end

  it 'with -o option with file' do
    begin
      file = Tempfile.new('cure_grep_test')
      %w[レッド ピンク ホワイト ブルー ブラック].each do |v|
        file.puts("私はキュア#{v}です。")
      end
      file.rewind
      result = `bundle exec ./bin/cure grep -o '私は[:precure_name:]で' #{file.path}` # rubocop:disable Metrics/LineLength
      expected = "私はキュアホワイトで
私はキュアブラックで"
      expect(result.chomp).to eq expected
    ensure
      file.close
      file.unlink
    end
  end

  it 'with -o and -E options with file' do
    begin
      file = Tempfile.new('cure_grep_test')
      %w[レッド ピンク ホワイト ブルー ブラック].each do |v|
        file.puts("私はキュア#{v}です。")
      end
      file.rewind
      result = `bundle exec ./bin/cure grep -oE '^私は.{3}' #{file.path}`
      expected = "私はキュア
私はキュア
私はキュア
私はキュア
私はキュア"
      expect(result.chomp).to eq expected
    ensure
      file.close
      file.unlink
    end
  end

  it 'no matches' do
    begin
      file = Tempfile.new('cure_grep_test')
      %w[foo bar hoge].each do |v|
        file.puts("私はキュア#{v}です。")
      end
      file.rewind
      system("cat #{file.path} | bundle exec ./bin/cure grep")
      expect($CHILD_STATUS.exitstatus).to eq 1
    ensure
      file.close
      file.unlink
    end
  end
end

describe 'humanize' do # rubocop:disable Metrics/BlockLength
  it 'transform precures to girls' do # rubocop:disable Metrics/BlockLength
    result = `bundle exec ./cure precures -m | bundle exec ./cure humanize`
    expect(result).to include '美墨なぎさ'
    expect(result).to include '雪城ほのか'
    expect(result).to include '九条ひかり'
    expect(result).to include '日向咲'
    expect(result).to include '美翔舞'
    expect(result).to include '夢原のぞみ'
    expect(result).to include '夏木りん'
    expect(result).to include '春日野うらら'
    expect(result).to include '秋元こまち'
    expect(result).to include '水無月かれん'
    expect(result).to include '美々野くるみ'
    expect(result).to include '桃園ラブ'
    expect(result).to include '蒼乃美希'
    expect(result).to include '山吹祈里'
    expect(result).to include '東せつな'
    expect(result).to include '花咲つぼみ'
    expect(result).to include '来海えりか'
    expect(result).to include '明堂院いつき'
    expect(result).to include '月影ゆり'
    expect(result).to include '北条響'
    expect(result).to include '南野奏'
    expect(result).to include '黒川エレン'
    expect(result).to include '調辺アコ'
    expect(result).to include '星空みゆき'
    expect(result).to include '日野あかね'
    expect(result).to include '黄瀬やよい'
    expect(result).to include '緑川なお'
    expect(result).to include '青木れいか'
    expect(result).to include '相田マナ'
    expect(result).to include '菱川六花'
    expect(result).to include '四葉ありす'
    expect(result).to include '剣崎真琴'
    expect(result).to include '円亜久里'
    expect(result).to include '愛乃めぐみ'
    expect(result).to include '白雪ひめ'
    expect(result).to include '大森ゆうこ'
    expect(result).to include '氷川いおな'
    expect(result).to include '春野はるか'
    expect(result).to include '海藤みなみ'
    expect(result).to include '天ノ川きらら'
    expect(result).to include '紅城トワ'
    expect(result).to include '朝日奈みらい'
    expect(result).to include '十六夜リコ'
    expect(result).to include '花海ことは'
    expect(result).to include '宇佐美いちか'
    expect(result).to include '有栖川ひまり'
    expect(result).to include '立神あおい'
    expect(result).to include '琴爪ゆかり'
    expect(result).to include '剣城あきら'
    expect(result).to include 'キラ星シエル'
    expect(result).to include '野乃はな'
    expect(result).to include '薬師寺さあや'
    expect(result).to include '輝木ほまれ'
    expect(result).to include '愛崎えみる'
    expect(result).to include 'ルールー・アムール'
    expect(result).to include '坂上あゆみ'
  end
end

describe 'transform' do # rubocop:disable Metrics/BlockLength
  it 'transform girls to precures' do # rubocop:disable Metrics/BlockLength
    result = `bundle exec ./cure girls -m | bundle exec ./cure transform`
    expect(result).to include 'キュアブラック'
    expect(result).to include 'キュアホワイト'
    expect(result).to include 'シャイニールミナス'
    expect(result).to include 'キュアブルーム'
    expect(result).to include 'キュアイーグレット'
    expect(result).to include 'キュアドリーム'
    expect(result).to include 'キュアルージュ'
    expect(result).to include 'キュアレモネード'
    expect(result).to include 'キュアミント'
    expect(result).to include 'キュアアクア'
    expect(result).to include 'ミルキィローズ'
    expect(result).to include 'キュアピーチ'
    expect(result).to include 'キュアベリー'
    expect(result).to include 'キュアパイン'
    expect(result).to include 'キュアパッション'
    expect(result).to include 'キュアブロッサム'
    expect(result).to include 'キュアマリン'
    expect(result).to include 'キュアサンシャイン'
    expect(result).to include 'キュアムーンライト'
    expect(result).to include 'キュアメロディ'
    expect(result).to include 'キュアリズム'
    expect(result).to include 'キュアビート'
    expect(result).to include 'キュアミューズ'
    expect(result).to include 'キュアハッピー'
    expect(result).to include 'キュアサニー'
    expect(result).to include 'キュアピース'
    expect(result).to include 'キュアマーチ'
    expect(result).to include 'キュアビューティ'
    expect(result).to include 'キュアハート'
    expect(result).to include 'キュアダイヤモンド'
    expect(result).to include 'キュアロゼッタ'
    expect(result).to include 'キュアソード'
    expect(result).to include 'キュアエース'
    expect(result).to include 'キュアラブリー'
    expect(result).to include 'キュアプリンセス'
    expect(result).to include 'キュアハニー'
    expect(result).to include 'キュアフォーチュン'
    expect(result).to include 'キュアフローラ'
    expect(result).to include 'キュアマーメイド'
    expect(result).to include 'キュアトゥインクル'
    expect(result).to include 'キュアスカーレット'
    expect(result).to include 'キュアミラクル'
    expect(result).to include 'キュアマジカル'
    expect(result).to include 'キュアフェリーチェ'
    expect(result).to include 'キュアホイップ'
    expect(result).to include 'キュアカスタード'
    expect(result).to include 'キュアジェラート'
    expect(result).to include 'キュアマカロン'
    expect(result).to include 'キュアショコラ'
    expect(result).to include 'キュアパルフェ'
    expect(result).to include 'キュアエール'
    expect(result).to include 'キュアアンジュ'
    expect(result).to include 'キュアエトワール'
    expect(result).to include 'キュアマシェリ'
    expect(result).to include 'キュアアムール'
    expect(result).to include 'キュアエコー'
  end
end
