#!/bin/bash
TEST_DIR=`dirname $0`
BIN_DIR="${TEST_DIR}/../bin"

setUp(){
  cd $BIN_DIR 2> /dev/null
}

tearDown(){
  [ -e tmpfile ] && rm tmpfile
}

test_version(){
    result=`bundle exec cure version`
    echo "${result}" | grep -E '^Cureutils [\.0-9]+$'
    assertEquals 0 $?
}

test_girls(){
    result=`bundle exec cure girls`
    echo "${result}" | grep "美墨なぎさ"
    assertEquals 0 $?
    echo "${result}" | grep "雪城ほのか"
    assertEquals 0 $?
    echo "${result}" | grep "九条ひかり"
    assertEquals 0 $?
    echo "${result}" | grep "日向咲"
    assertEquals 0 $?
    echo "${result}" | grep "美翔舞"
    assertEquals 0 $?
    echo "${result}" | grep "夢原のぞみ"
    assertEquals 0 $?
    echo "${result}" | grep "夏木りん"
    assertEquals 0 $?
    echo "${result}" | grep "春日野うらら"
    assertEquals 0 $?
    echo "${result}" | grep "秋元こまち"
    assertEquals 0 $?
    echo "${result}" | grep "水無月かれん"
    assertEquals 0 $?
    echo "${result}" | grep "美々野くるみ"
    assertEquals 0 $?
    echo "${result}" | grep "桃園ラブ"
    assertEquals 0 $?
    echo "${result}" | grep "蒼乃美希"
    assertEquals 0 $?
    echo "${result}" | grep "山吹祈里"
    assertEquals 0 $?
    echo "${result}" | grep "東せつな"
    assertEquals 0 $?
    echo "${result}" | grep "花咲つぼみ"
    assertEquals 0 $?
    echo "${result}" | grep "来海えりか"
    assertEquals 0 $?
    echo "${result}" | grep "明堂院いつき"
    assertEquals 0 $?
    echo "${result}" | grep "月影ゆり"
    assertEquals 0 $?
    echo "${result}" | grep "北条響"
    assertEquals 0 $?
    echo "${result}" | grep "南野奏"
    assertEquals 0 $?
    echo "${result}" | grep "黒川エレン"
    assertEquals 0 $?
    echo "${result}" | grep "調辺アコ"
    assertEquals 0 $?
    echo "${result}" | grep "星空みゆき"
    assertEquals 0 $?
    echo "${result}" | grep "日野あかね"
    assertEquals 0 $?
    echo "${result}" | grep "黄瀬やよい"
    assertEquals 0 $?
    echo "${result}" | grep "緑川なお"
    assertEquals 0 $?
    echo "${result}" | grep "青木れいか"
    assertEquals 0 $?
    echo "${result}" | grep "相田マナ"
    assertEquals 0 $?
    echo "${result}" | grep "菱川六花"
    assertEquals 0 $?
    echo "${result}" | grep "四葉ありす"
    assertEquals 0 $?
    echo "${result}" | grep "剣崎真琴"
    assertEquals 0 $?
    echo "${result}" | grep "円亜久里"
    assertEquals 0 $?
    echo "${result}" | grep "愛乃めぐみ"
    assertEquals 0 $?
    echo "${result}" | grep "白雪ひめ"
    assertEquals 0 $?
    echo "${result}" | grep "大森ゆうこ"
    assertEquals 0 $?
    echo "${result}" | grep "氷川いおな"
    assertEquals 0 $?
    echo "${result}" | grep "春野はるか"
    assertEquals 0 $?
    echo "${result}" | grep "海藤みなみ"
    assertEquals 0 $?
    echo "${result}" | grep "天ノ川きらら"
    assertEquals 0 $?
    echo "${result}" | grep "紅城トワ"
    assertEquals 0 $?
    echo "${result}" | grep "朝日奈みらい"
    assertEquals 0 $?
    echo "${result}" | grep "十六夜リコ"
    assertEquals 0 $?
    echo "${result}" | grep "花海ことは"
    assertEquals 0 $?
    echo "${result}" | grep "宇佐美いちか"
    assertEquals 0 $?
    echo "${result}" | grep "有栖川ひまり"
    assertEquals 0 $?
    echo "${result}" | grep "立神あおい"
    assertEquals 0 $?
    echo "${result}" | grep "琴爪ゆかり"
    assertEquals 0 $?
    echo "${result}" | grep "剣城あきら"
    assertEquals 0 $?
}

test_girls_full(){
    result=`bundle exec cure girls -fm`
    echo "${result}" | grep "美墨なぎさ"
    assertEquals 0 $?
    echo "${result}" | grep "雪城ほのか"
    assertEquals 0 $?
    echo "${result}" | grep "九条ひかり"
    assertEquals 0 $?
    echo "${result}" | grep "日向咲"
    assertEquals 0 $?
    echo "${result}" | grep "美翔舞"
    assertEquals 0 $?
    echo "${result}" | grep "夢原のぞみ"
    assertEquals 0 $?
    echo "${result}" | grep "夏木りん"
    assertEquals 0 $?
    echo "${result}" | grep "春日野うらら"
    assertEquals 0 $?
    echo "${result}" | grep "秋元こまち"
    assertEquals 0 $?
    echo "${result}" | grep "水無月かれん"
    assertEquals 0 $?
    echo "${result}" | grep "美々野くるみ"
    assertEquals 0 $?
    echo "${result}" | grep "桃園ラブ"
    assertEquals 0 $?
    echo "${result}" | grep "蒼乃美希"
    assertEquals 0 $?
    echo "${result}" | grep "山吹祈里"
    assertEquals 0 $?
    echo "${result}" | grep "東せつな"
    assertEquals 0 $?
    echo "${result}" | grep "花咲つぼみ"
    assertEquals 0 $?
    echo "${result}" | grep "来海えりか"
    assertEquals 0 $?
    echo "${result}" | grep "明堂院いつき"
    assertEquals 0 $?
    echo "${result}" | grep "月影ゆり"
    assertEquals 0 $?
    echo "${result}" | grep "北条響"
    assertEquals 0 $?
    echo "${result}" | grep "南野奏"
    assertEquals 0 $?
    echo "${result}" | grep "黒川エレン"
    assertEquals 0 $?
    echo "${result}" | grep "調辺アコ"
    assertEquals 0 $?
    echo "${result}" | grep "星空みゆき"
    assertEquals 0 $?
    echo "${result}" | grep "日野あかね"
    assertEquals 0 $?
    echo "${result}" | grep "黄瀬やよい"
    assertEquals 0 $?
    echo "${result}" | grep "緑川なお"
    assertEquals 0 $?
    echo "${result}" | grep "青木れいか"
    assertEquals 0 $?
    echo "${result}" | grep "相田マナ"
    assertEquals 0 $?
    echo "${result}" | grep "菱川六花"
    assertEquals 0 $?
    echo "${result}" | grep "四葉ありす"
    assertEquals 0 $?
    echo "${result}" | grep "剣崎真琴"
    assertEquals 0 $?
    echo "${result}" | grep "円亜久里"
    assertEquals 0 $?
    echo "${result}" | grep "愛乃めぐみ"
    assertEquals 0 $?
    echo "${result}" | grep "ヒメルダ・ウインドウ・キュアクイーン・オブ・ザ・ブルースカイ"
    assertEquals 0 $?
    echo "${result}" | grep "大森ゆうこ"
    assertEquals 0 $?
    echo "${result}" | grep "氷川いおな"
    assertEquals 0 $?
    echo "${result}" | grep "春野はるか"
    assertEquals 0 $?
    echo "${result}" | grep "海藤みなみ"
    assertEquals 0 $?
    echo "${result}" | grep "天ノ川きらら"
    assertEquals 0 $?
    echo "${result}" | grep "プリンセス・ホープ・ディライト・トワ"
    assertEquals 0 $?
    echo "${result}" | grep "朝日奈みらい"
    assertEquals 0 $?
    echo "${result}" | grep "十六夜リコ"
    assertEquals 0 $?
    echo "${result}" | grep "花海ことは"
    assertEquals 0 $?
    echo "${result}" | grep "宇佐美いちか"
    assertEquals 0 $?
    echo "${result}" | grep "有栖川ひまり"
    assertEquals 0 $?
    echo "${result}" | grep "立神あおい"
    assertEquals 0 $?
    echo "${result}" | grep "琴爪ゆかり"
    assertEquals 0 $?
    echo "${result}" | grep "剣城あきら"
    assertEquals 0 $?
    echo "${result}" | grep "坂上あゆみ"
    assertEquals 0 $?
}

test_precures () {
    result=`bundle exec cure precures`
    echo "${result}" | grep "キュアブラック"
    assertEquals 0 $?
    echo "${result}" | grep "キュアホワイト"
    assertEquals 0 $?
    echo "${result}" | grep "シャイニールミナス"
    assertEquals 0 $?
    echo "${result}" | grep "キュアブルーム"
    assertEquals 0 $?
    echo "${result}" | grep "キュアイーグレット"
    assertEquals 0 $?
    echo "${result}" | grep "キュアドリーム"
    assertEquals 0 $?
    echo "${result}" | grep "キュアルージュ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアレモネード"
    assertEquals 0 $?
    echo "${result}" | grep "キュアミント"
    assertEquals 0 $?
    echo "${result}" | grep "キュアアクア"
    assertEquals 0 $?
    echo "${result}" | grep "ミルキィローズ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアピーチ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアベリー"
    assertEquals 0 $?
    echo "${result}" | grep "キュアパイン"
    assertEquals 0 $?
    echo "${result}" | grep "キュアパッション"
    assertEquals 0 $?
    echo "${result}" | grep "キュアブロッサム"
    assertEquals 0 $?
    echo "${result}" | grep "キュアマリン"
    assertEquals 0 $?
    echo "${result}" | grep "キュアサンシャイン"
    assertEquals 0 $?
    echo "${result}" | grep "キュアムーンライト"
    assertEquals 0 $?
    echo "${result}" | grep "キュアメロディ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアリズム"
    assertEquals 0 $?
    echo "${result}" | grep "キュアビート"
    assertEquals 0 $?
    echo "${result}" | grep "キュアミューズ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアハッピー"
    assertEquals 0 $?
    echo "${result}" | grep "キュアサニー"
    assertEquals 0 $?
    echo "${result}" | grep "キュアピース"
    assertEquals 0 $?
    echo "${result}" | grep "キュアマーチ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアビューティ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアハート"
    assertEquals 0 $?
    echo "${result}" | grep "キュアダイヤモンド"
    assertEquals 0 $?
    echo "${result}" | grep "キュアロゼッタ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアソード"
    assertEquals 0 $?
    echo "${result}" | grep "キュアエース"
    assertEquals 0 $?
    echo "${result}" | grep "キュアラブリー"
    assertEquals 0 $?
    echo "${result}" | grep "キュアプリンセス"
    assertEquals 0 $?
    echo "${result}" | grep "キュアハニー"
    assertEquals 0 $?
    echo "${result}" | grep "キュアフォーチュン"
    assertEquals 0 $?
    echo "${result}" | grep "キュアフローラ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアマーメイド"
    assertEquals 0 $?
    echo "${result}" | grep "キュアトゥインクル"
    assertEquals 0 $?
    echo "${result}" | grep "キュアスカーレット"
    assertEquals 0 $?
    echo "${result}" | grep "キュアミラクル"
    assertEquals 0 $?
    echo "${result}" | grep "キュアマジカル"
    assertEquals 0 $?
    echo "${result}" | grep "キュアフェリーチェ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアホイップ"
    assertEquals 0 $?
    echo "${result}" | grep "キュアカスタード"
    assertEquals 0 $?
    echo "${result}" | grep "キュアジェラート"
    assertEquals 0 $?
    echo "${result}" | grep "キュアマカロン"
    assertEquals 0 $?
    echo "${result}" | grep "キュアショコラ"
    assertEquals 0 $?
}

test_date() {
  echo "cure date -- default"
  result=`bundle exec cure date`
  expected_regex="$(perl -MPOSIX -e 'print POSIX::strftime "%Y-%m-%d", localtime(time);') ..:..:.. ?.*"
  echo "${result}" | grep -E "$expected_regex"
  assertEquals 0 $?

  echo "cure date -- -d option: 3 years ago"
  result=`bundle exec cure date -d '3 years ago'`
  expected_regex="$(perl -MPOSIX -e 'print POSIX::strftime "%Y-%m-%d", localtime(time - 31536000 * 3 - 86400);') ..:..:.. ?.*"
  echo "${result}" | grep -E "$expected_regex"
  assertEquals 0 $?

  echo "cure date -- +format: YYYY@MM@DD"
  result=`bundle exec cure date '+%Y@%m@%d %H:%M:%S @P'`
  expected_regex="$(perl -MPOSIX -e 'print POSIX::strftime "%Y@%m@%d", localtime(time);') ..:..:.. ?.*"
  echo "${result}" | grep -E "$expected_regex"
  assertEquals 0 $?

  echo "cure date -- -d option and +format: YYYY@MM@DD 37 days ago"
  result=`bundle exec cure date -d '37 days ago' '+%Y@%m@%d %H:%M:%S @P'`
  expected_regex="$(perl -MPOSIX -e 'print POSIX::strftime "%Y@%m@%d", localtime(time - 86400 * 37);') ..:..:.. ?.*"
  echo "${result}" | grep -E "$expected_regex"
  assertEquals 0 $?

  echo "cure date -- -d option and -f option"
  echo 2010{01..12}{01..31} | xargs -n 1 | bundle exec cure date -d '2015-01-01' -f - +%F:@P
  assertEquals 1 $?

  echo "cure date -- Load file with -f option"
  local _datefile="${SHUNIT_TMPDIR}/cure_date_test"
  echo 2010{01..12}{01..31} | xargs -n 1 > "$_datefile"
  result=`bundle exec cure date -f $_datefile`
  assertEquals 365 "$(echo "${result}" | grep -c .)"

  echo "cure date -- Load stdin with -f option"
  # Any precure are not broadcasted within this term.
  assertEquals "2011-01-31 
2011-02-01 
2011-02-02 
2011-02-03 
2011-02-04 
2011-02-05 " "$(echo 2011{01..12}{01..31} | xargs -n 1 | bundle exec cure date -f - "+%F @P" | awk NF==1)"

  echo "cure date -- Multiple precures were appered."
  assertEquals "2016-02-07 キュアミラクル登場日/キュアマジカル登場日/魔法つかいプリキュア！初放映" "$(bundle exec cure date -d '2016-02-07' '+%F @P')"
}

test_echo() {
  echo "cure echo -- default"
  result=`bundle exec cure echo -q`
  expected="みんなの思いを守るために
心をひとつに！
思いよ届け！キュアエコー！"
  assertEquals "$expected" "$result"

  echo "cure echo -- attack"
  result=`bundle exec cure echo -aq`
  expected="みんなの思いを守るために
心をひとつに！
思いよ届け！キュアエコー！
世界に響け、みんなの思い！
プリキュア・ハートフルエコー！"
  assertEquals "$expected" "$result"

  echo "cure echo -- another precure"
  result=`bundle exec cure echo -qp happy`
  expected="(レディ？)
プリキュア・スマイルチャージ！
(ゴー！ゴー！レッツ・ゴー！ハッピー！！)
キラキラ輝く未来の光！ キュアハッピー！
5つの光が導く未来！
輝け！スマイルプリキュア！"
  assertEquals "$expected" "$result"

  echo "cure echo -- another precure + attack"
  result=`bundle exec cure echo -qap mint`
  expected="プリキュア！メタモルフォーゼ！
安らぎの緑の大地、キュアミント！
希望の力と未来の光！
華麗に羽ばたく5つの心！
Yes！プリキュア5！
大地を揺るがす乙女の怒り、受けてみなさい！
プリキュア！エメラルド・ソーサー！"
  assertEquals "$expected" "$result"

  echo "cure echo -- Maho girls precure"
  result=`bundle exec cure echo -qp magical`
  expected="キュアップ・ラパパ！　ダイヤ！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
  assertEquals "$expected" "$result"

  echo "cure echo -- with style option(ruby)"
  result=`bundle exec cure echo -qp magical -s ruby`
  expected="キュアップ・ラパパ！　ルビー！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
  assertEquals "$expected" "$result"

  echo "cure echo -- with style option(diamond)"
  result=`bundle exec cure echo -qp magical -s diamond`
  expected="キュアップ・ラパパ！　ダイヤ！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
  assertEquals "$expected" "$result"

  result=`bundle exec cure echo -qap cure_miracle -s topaz`
  expected="キュアップ・ラパパ！　トパーズ！
ミラクル・マジカル・ジュエリーレ！
ふたりの奇跡！キュアミラクル！
魔法つかいプリキュア！！
リンクルステッキ！
トパーズ！金色の希望よ私達の手に！
フルフルリンクル！
プリキュア・トパーズ・エスペランサ！"
  assertEquals "$expected" "$result"

  result=`bundle exec cure echo -qp magical -s sapphire`
  expected="キュアップ・ラパパ！　サファイア！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！"
  assertEquals "$expected" "$result"

  result=`bundle exec cure echo -qap cure_felice -s emerald`
  expected="キュアップ・ラパパ！エメラルド！
フェリーチェ・ファンファン・フラワーレ！
あまねく生命に祝福を！キュアフェリーチェ！
フラワーエコーワンド！
エメラルド！
キュアー・アップ！
プリキュア！エメラルド・リンカネーション！"
  assertEquals "$expected" "$result"

  result=`bundle exec cure echo -qp cure_macaroon`
  expected="キュアラモード・デコレーション！
マカロン！
美しさとときめきを！
レッツ・ラ・まぜまぜ！
キュアマカロン！できあがり！"
  assertEquals "$expected" "$result"

  echo "cure echo -- non-existing precure"
  result=`bundle exec cure echo -qp grepon`
  assertEquals "1" "$?"
}

test_grep() {
  echo "cure grep -- default"
  result=`echo キュア{レッド,ピンク,ホワイト,ブルー,ブラック} 東せつな | xargs -n 1 |  bundle exec cure grep`
  expected="キュアホワイト
キュアブラック"
  assertEquals "$expected" "$result"

  echo "cure grep -- -E option"
  result=`echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。 | xargs -n 1 |  bundle exec cure grep '^私は[:precure_name:]です'`
  expected="私はキュアホワイトです。
私はキュアブラックです。"
  assertEquals "$expected" "$result"

  echo "cure grep -- with -o option"
  result=`echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。 | xargs -n 1 |  bundle exec cure grep -o '私は[:precure_name:]で'`
  expected="私はキュアホワイトで
私はキュアブラックで"
  assertEquals "$expected" "$result"

  echo "cure grep -- with -o and -E options"
  result=`echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。 | xargs -n 1 |  bundle exec cure grep -oE '^私は.{3}'`
  expected="私はキュア
私はキュア
私はキュア
私はキュア
私はキュア"
  assertEquals "$expected" "$result"

  # TODO: Support default filter with input file.
  echo "cure grep -- default with file"
  echo キュア{レッド,ピンク,ホワイト,ブルー,ブラック} 東せつな | xargs -n 1 > tmpfile
  result=`bundle exec cure grep '[:precure_name:]' tmpfile`
  expected="キュアホワイト
キュアブラック"
  assertEquals "$expected" "$result"

  echo "cure grep --  No such file error."
  bundle exec cure grep '[:precure_name:]' nonExistTmpfile
  assertEquals 2 "$?"

  echo "cure grep -- -E option with file"
  echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。| xargs -n 1 > tmpfile
  result=`bundle exec cure grep '^私は[:precure_name:]です' tmpfile`
  expected="私はキュアホワイトです。
私はキュアブラックです。"
  assertEquals "$expected" "$result"

  echo "cure grep -- with -o option with file"
  echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。| xargs -n 1 > tmpfile
  result=`bundle exec cure grep -o '私は[:precure_name:]で' tmpfile`
  expected="私はキュアホワイトで
私はキュアブラックで"
  assertEquals "$expected" "$result"

  echo "cure grep -- with -o and -E options with file"
  echo 私はキュア{レッド,ピンク,ホワイト,ブルー,ブラック}です。| xargs -n 1 > tmpfile
  result=`bundle exec cure grep -oE '^私は.{3}' tmpfile`
  expected="私はキュア
私はキュア
私はキュア
私はキュア
私はキュア"
  assertEquals "$expected" "$result"

  echo "cure grep -- no matches"
  echo 私はキュア{foo,bar,hoge}です。| xargs -n 1 > tmpfile
  result=`cat tmpfile | bundle exec cure grep`
  assertEquals "1" "$?"
}

test_humanize() {
  result=`bundle exec cure precures -m | bundle exec cure humanize`
  echo "${result}" | grep "美墨なぎさ"
  assertEquals 0 $?
  echo "${result}" | grep "雪城ほのか"
  assertEquals 0 $?
  echo "${result}" | grep "九条ひかり"
  assertEquals 0 $?
  echo "${result}" | grep "日向咲"
  assertEquals 0 $?
  echo "${result}" | grep "美翔舞"
  assertEquals 0 $?
  echo "${result}" | grep "夢原のぞみ"
  assertEquals 0 $?
  echo "${result}" | grep "夏木りん"
  assertEquals 0 $?
  echo "${result}" | grep "春日野うらら"
  assertEquals 0 $?
  echo "${result}" | grep "秋元こまち"
  assertEquals 0 $?
  echo "${result}" | grep "水無月かれん"
  assertEquals 0 $?
  echo "${result}" | grep "美々野くるみ"
  assertEquals 0 $?
  echo "${result}" | grep "桃園ラブ"
  assertEquals 0 $?
  echo "${result}" | grep "蒼乃美希"
  assertEquals 0 $?
  echo "${result}" | grep "山吹祈里"
  assertEquals 0 $?
  echo "${result}" | grep "東せつな"
  assertEquals 0 $?
  echo "${result}" | grep "花咲つぼみ"
  assertEquals 0 $?
  echo "${result}" | grep "来海えりか"
  assertEquals 0 $?
  echo "${result}" | grep "明堂院いつき"
  assertEquals 0 $?
  echo "${result}" | grep "月影ゆり"
  assertEquals 0 $?
  echo "${result}" | grep "北条響"
  assertEquals 0 $?
  echo "${result}" | grep "南野奏"
  assertEquals 0 $?
  echo "${result}" | grep "黒川エレン"
  assertEquals 0 $?
  echo "${result}" | grep "調辺アコ"
  assertEquals 0 $?
  echo "${result}" | grep "星空みゆき"
  assertEquals 0 $?
  echo "${result}" | grep "日野あかね"
  assertEquals 0 $?
  echo "${result}" | grep "黄瀬やよい"
  assertEquals 0 $?
  echo "${result}" | grep "緑川なお"
  assertEquals 0 $?
  echo "${result}" | grep "青木れいか"
  assertEquals 0 $?
  echo "${result}" | grep "相田マナ"
  assertEquals 0 $?
  echo "${result}" | grep "菱川六花"
  assertEquals 0 $?
  echo "${result}" | grep "四葉ありす"
  assertEquals 0 $?
  echo "${result}" | grep "剣崎真琴"
  assertEquals 0 $?
  echo "${result}" | grep "円亜久里"
  assertEquals 0 $?
  echo "${result}" | grep "愛乃めぐみ"
  assertEquals 0 $?
  echo "${result}" | grep "白雪ひめ"
  assertEquals 0 $?
  echo "${result}" | grep "大森ゆうこ"
  assertEquals 0 $?
  echo "${result}" | grep "氷川いおな"
  assertEquals 0 $?
  echo "${result}" | grep "春野はるか"
  assertEquals 0 $?
  echo "${result}" | grep "海藤みなみ"
  assertEquals 0 $?
  echo "${result}" | grep "天ノ川きらら"
  assertEquals 0 $?
  echo "${result}" | grep "紅城トワ"
  assertEquals 0 $?
  echo "${result}" | grep "朝日奈みらい"
  assertEquals 0 $?
  echo "${result}" | grep "十六夜リコ"
  assertEquals 0 $?
  echo "${result}" | grep "花海ことは"
  assertEquals 0 $?
  echo "${result}" | grep "宇佐美いちか"
  assertEquals 0 $?
  echo "${result}" | grep "有栖川ひまり"
  assertEquals 0 $?
  echo "${result}" | grep "立神あおい"
  assertEquals 0 $?
  echo "${result}" | grep "琴爪ゆかり"
  assertEquals 0 $?
  echo "${result}" | grep "剣城あきら"
  assertEquals 0 $?
  echo "${result}" | grep "坂上あゆみ"
  assertEquals 0 $?
}

test_transform() {
  result=`bundle exec cure girls -m | bundle exec cure transform`
  echo "${result}" | grep "キュアブラック"
  assertEquals 0 $?
  echo "${result}" | grep "キュアホワイト"
  assertEquals 0 $?
  echo "${result}" | grep "シャイニールミナス"
  assertEquals 0 $?
  echo "${result}" | grep "キュアブルーム"
  assertEquals 0 $?
  echo "${result}" | grep "キュアイーグレット"
  assertEquals 0 $?
  echo "${result}" | grep "キュアドリーム"
  assertEquals 0 $?
  echo "${result}" | grep "キュアルージュ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアレモネード"
  assertEquals 0 $?
  echo "${result}" | grep "キュアミント"
  assertEquals 0 $?
  echo "${result}" | grep "キュアアクア"
  assertEquals 0 $?
  echo "${result}" | grep "ミルキィローズ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアピーチ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアベリー"
  assertEquals 0 $?
  echo "${result}" | grep "キュアパイン"
  assertEquals 0 $?
  echo "${result}" | grep "キュアパッション"
  assertEquals 0 $?
  echo "${result}" | grep "キュアブロッサム"
  assertEquals 0 $?
  echo "${result}" | grep "キュアマリン"
  assertEquals 0 $?
  echo "${result}" | grep "キュアサンシャイン"
  assertEquals 0 $?
  echo "${result}" | grep "キュアムーンライト"
  assertEquals 0 $?
  echo "${result}" | grep "キュアメロディ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアリズム"
  assertEquals 0 $?
  echo "${result}" | grep "キュアビート"
  assertEquals 0 $?
  echo "${result}" | grep "キュアミューズ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアハッピー"
  assertEquals 0 $?
  echo "${result}" | grep "キュアサニー"
  assertEquals 0 $?
  echo "${result}" | grep "キュアピース"
  assertEquals 0 $?
  echo "${result}" | grep "キュアマーチ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアビューティ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアハート"
  assertEquals 0 $?
  echo "${result}" | grep "キュアダイヤモンド"
  assertEquals 0 $?
  echo "${result}" | grep "キュアロゼッタ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアソード"
  assertEquals 0 $?
  echo "${result}" | grep "キュアエース"
  assertEquals 0 $?
  echo "${result}" | grep "キュアラブリー"
  assertEquals 0 $?
  echo "${result}" | grep "キュアプリンセス"
  assertEquals 0 $?
  echo "${result}" | grep "キュアハニー"
  assertEquals 0 $?
  echo "${result}" | grep "キュアフォーチュン"
  assertEquals 0 $?
  echo "${result}" | grep "キュアフローラ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアマーメイド"
  assertEquals 0 $?
  echo "${result}" | grep "キュアトゥインクル"
  assertEquals 0 $?
  echo "${result}" | grep "キュアスカーレット"
  assertEquals 0 $?
  echo "${result}" | grep "キュアミラクル"
  assertEquals 0 $?
  echo "${result}" | grep "キュアマジカル"
  assertEquals 0 $?
  echo "${result}" | grep "キュアフェリーチェ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアホイップ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアカスタード"
  assertEquals 0 $?
  echo "${result}" | grep "キュアジェラート"
  assertEquals 0 $?
  echo "${result}" | grep "キュアマカロン"
  assertEquals 0 $?
  echo "${result}" | grep "キュアショコラ"
  assertEquals 0 $?
  echo "${result}" | grep "キュアエコー"
  assertEquals 0 $?
}

test_janken() {
  # Win
  result=`echo 0 | bundle exec cure janken`
  assertEquals 0 $?

  # Something
  result=`echo 1 | bundle exec cure janken`
  echo $? | grep -E '^(0|1|2)$' > /dev/null
  assertEquals 0 $?
}

test_tr() {
  result=`bundle exec cure girls -m | bundle exec cure tr '[:human_name:]' '[:cast_name:]'`
  echo "${result}" | grep "本名陽子"
  assertEquals 0 $?
  echo "${result}" | grep "ゆかな"
  assertEquals 0 $?
  echo "${result}" | grep "田中理恵"
  assertEquals 0 $?
  echo "${result}" | grep "樹元オリエ"
  assertEquals 0 $?
  echo "${result}" | grep "榎本温子"
  assertEquals 0 $?
  echo "${result}" | grep "三瓶由布子"
  assertEquals 0 $?
  echo "${result}" | grep "竹内順子"
  assertEquals 0 $?
  echo "${result}" | grep "伊瀬茉莉也"
  assertEquals 0 $?
  echo "${result}" | grep "永野愛"
  assertEquals 0 $?
  echo "${result}" | grep "前田愛"
  assertEquals 0 $?
  echo "${result}" | grep "仙台エリ"
  assertEquals 0 $?
  echo "${result}" | grep "沖佳苗"
  assertEquals 0 $?
  echo "${result}" | grep "喜多村英梨"
  assertEquals 0 $?
  echo "${result}" | grep "中川亜紀子"
  assertEquals 0 $?
  echo "${result}" | grep "小松由佳"
  assertEquals 0 $?
  echo "${result}" | grep "水樹奈々"
  assertEquals 0 $?
  echo "${result}" | grep "水沢史絵"
  assertEquals 0 $?
  echo "${result}" | grep "桑島法子"
  assertEquals 0 $?
  echo "${result}" | grep "久川綾"
  assertEquals 0 $?
  echo "${result}" | grep "小清水亜美"
  assertEquals 0 $?
  echo "${result}" | grep "折笠富美子"
  assertEquals 0 $?
  echo "${result}" | grep "豊口めぐみ"
  assertEquals 0 $?
  echo "${result}" | grep "大久保瑠美"
  assertEquals 0 $?
  echo "${result}" | grep "福圓美里"
  assertEquals 0 $?
  echo "${result}" | grep "田野アサミ"
  assertEquals 0 $?
  echo "${result}" | grep "金元寿子"
  assertEquals 0 $?
  echo "${result}" | grep "井上麻里奈"
  assertEquals 0 $?
  echo "${result}" | grep "西村ちなみ"
  assertEquals 0 $?
  echo "${result}" | grep "生天目仁美"
  assertEquals 0 $?
  echo "${result}" | grep "寿美菜子"
  assertEquals 0 $?
  echo "${result}" | grep "渕上舞"
  assertEquals 0 $?
  echo "${result}" | grep "宮本佳那子"
  assertEquals 0 $?
  echo "${result}" | grep "釘宮理恵"
  assertEquals 0 $?
  echo "${result}" | grep "中島愛"
  assertEquals 0 $?
  echo "${result}" | grep "潘めぐみ"
  assertEquals 0 $?
  echo "${result}" | grep "北川里奈"
  assertEquals 0 $?
  echo "${result}" | grep "戸松遥"
  assertEquals 0 $?
  echo "${result}" | grep "嶋村侑"
  assertEquals 0 $?
  echo "${result}" | grep "浅野真澄"
  assertEquals 0 $?
  echo "${result}" | grep "山村響"
  assertEquals 0 $?
  echo "${result}" | grep "沢城みゆき"
  assertEquals 0 $?
  echo "${result}" | grep "高橋李依"
  assertEquals 0 $?
  echo "${result}" | grep "堀江由衣"
  assertEquals 0 $?
  echo "${result}" | grep "早見沙織"
  assertEquals 0 $?
  echo "${result}" | grep "美山加恋"
  assertEquals 0 $?
  echo "${result}" | grep "福原遥"
  assertEquals 0 $?
  echo "${result}" | grep "村中知"
  assertEquals 0 $?
  echo "${result}" | grep "藤田咲"
  assertEquals 0 $?
  echo "${result}" | grep "森なな子"
  assertEquals 0 $?
  echo "${result}" | grep "能登麻美子"
  assertEquals 0 $?
}

. ${TEST_DIR}/shunit2/src/shunit2
