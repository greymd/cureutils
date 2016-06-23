#!/bin/bash
TEST_DIR=`dirname $0`
BIN_DIR="${TEST_DIR}/../bin"

setUp(){
    cd $BIN_DIR 2> /dev/null
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
    echo "${result}" | grep "キュアブライト"
    assertEquals 0 $?
    echo "${result}" | grep "キュアウィンディ"
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
    echo "${result}" | grep "キュアエコー"
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
}

test_humanize() {
  result=`bundle exec cure precures | bundle exec cure humanize`
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
  echo "${result}" | grep "坂上あゆみ"
  assertEquals 0 $?
}

test_transform() {
  result=`bundle exec cure girls | bundle exec cure transform`
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
#   echo "${result}" | grep "キュアブライト"
#   assertEquals 0 $?
#   echo "${result}" | grep "キュアウィンディ"
#   assertEquals 0 $?
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
  echo "${result}" | grep "キュアエコー"
  assertEquals 0 $?
}

# test_janken() {
#   result=`bundle exec cure janken`
# }

# test_tr() {
#   result=`bundle exec cure tr`
# }

. ${TEST_DIR}/shunit2/src/shunit2
