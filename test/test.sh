#!/bin/bash
TEST_DIR=`dirname $0`
BIN_DIR="${TEST_DIR}/../bin"

setUp(){
  cd $BIN_DIR 2> /dev/null
}

test_girls(){
  result=`bundle exec cure girls`
  echo "${result}" | grep "美墨なぎさ"
  assertEquals $? 0
  echo "${result}" | grep "雪城ほのか"
  assertEquals $? 0
  echo "${result}" | grep "九条ひかり"
  assertEquals $? 0
  echo "${result}" | grep "日向咲"
  assertEquals $? 0
  echo "${result}" | grep "美翔舞"
  assertEquals $? 0
  echo "${result}" | grep "夢原のぞみ"
  assertEquals $? 0
  echo "${result}" | grep "夏木りん"
  assertEquals $? 0
  echo "${result}" | grep "春日野うらら"
  assertEquals $? 0
  echo "${result}" | grep "秋元こまち"
  assertEquals $? 0
  echo "${result}" | grep "水無月かれん"
  assertEquals $? 0
  echo "${result}" | grep "美々野くるみ"
  assertEquals $? 0
  echo "${result}" | grep "桃園ラブ"
  assertEquals $? 0
  echo "${result}" | grep "蒼乃美希"
  assertEquals $? 0
  echo "${result}" | grep "山吹祈里"
  assertEquals $? 0
  echo "${result}" | grep "東せつな"
  assertEquals $? 0
  echo "${result}" | grep "花咲つぼみ"
  assertEquals $? 0
  echo "${result}" | grep "来海えりか"
  assertEquals $? 0
  echo "${result}" | grep "明堂院いつき"
  assertEquals $? 0
  echo "${result}" | grep "月影ゆり"
  assertEquals $? 0
  echo "${result}" | grep "北条響"
  assertEquals $? 0
  echo "${result}" | grep "南野奏"
  assertEquals $? 0
  echo "${result}" | grep "黒川エレン"
  assertEquals $? 0
  echo "${result}" | grep "調辺アコ"
  assertEquals $? 0
  echo "${result}" | grep "星空みゆき"
  assertEquals $? 0
  echo "${result}" | grep "日野あかね"
  assertEquals $? 0
  echo "${result}" | grep "黄瀬やよい"
  assertEquals $? 0
  echo "${result}" | grep "緑川なお"
  assertEquals $? 0
  echo "${result}" | grep "青木れいか"
  assertEquals $? 0
  echo "${result}" | grep "相田マナ"
  assertEquals $? 0
  echo "${result}" | grep "菱川六花"
  assertEquals $? 0
  echo "${result}" | grep "四葉ありす"
  assertEquals $? 0
  echo "${result}" | grep "剣崎真琴"
  assertEquals $? 0
  echo "${result}" | grep "円亜久里"
  assertEquals $? 0
  echo "${result}" | grep "愛乃めぐみ"
  assertEquals $? 0
  echo "${result}" | grep "白雪ひめ"
  assertEquals $? 0
  echo "${result}" | grep "大森ゆうこ"
  assertEquals $? 0
  echo "${result}" | grep "氷川いおな"
  assertEquals $? 0
  echo "${result}" | grep "春野はるか"
  assertEquals $? 0
  echo "${result}" | grep "海藤みなみ"
  assertEquals $? 0
  echo "${result}" | grep "天ノ川きらら"
  assertEquals $? 0
  echo "${result}" | grep "紅城トワ"
  assertEquals $? 0
  echo "${result}" | grep "朝日奈みらい"
  assertEquals $? 0
  echo "${result}" | grep "十六夜リコ"
  assertEquals $? 0
  echo "${result}" | grep "坂上あゆみ"
  assertEquals $? 0
}

. ${TEST_DIR}/shunit2/src/shunit2
