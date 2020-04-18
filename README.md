<h1 align="center">
  <img src="https://raw.githubusercontent.com/wiki/greymd/cureutils/logo/cureutils_logo.png" />
  <h4 align="center">Useful command line tool for Japanese battle heroine Pretty Cure (Precure).</h2>
</h1>

<p align="center">
  <a href=https://badge.fury.io/rb/cureutils><img src="https://badge.fury.io/rb/cureutils.svg" alt="Gem Version" /></a>
  <a href=https://github.com/greymd/cureutils/actions?query=workflow%3Atest><img src="https://github.com/greymd/cureutils/workflows/test/badge.svg?branch=master" alt="Build Status" /></a>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/wiki/greymd/cureutils/animation/cure_echo_demo.gif" alt="Introduction Git Animation" />
</p>


## Requirements

* ruby >= 2.2.2
  + more: [.travis.yml](./.travis.yml)

## Installation

Install:

```
$ gem install cureutils

# for 2.2
$ gem install 'backport_dig'
```


After that, `cure` command is available.

    $ cure

# Usage

```
$ cure help
Commands:
  cure date [OPTIONS] [+FORMAT]  # Display date, time and Precure related events.
  cure echo [OPTIONS] PATTERN    # Print messages of Precure.
  cure girls [OPTIONS]           # Print girls' name.
  cure grep [OPTIONS] PATTERN    # Print lines matching a pattern.
  cure help [COMMAND]            # Describe available commands or one specific command
  cure humanize                  # Change precure_name to human_name.
  cure janken                    # Let's play "Pikarin Janken" !
  cure precures [OPTIONS]        # Print Precure names.
  cure tr PATTERN REPLACE        # Translate Precure related parameters.
  cure transform                 # Change human_name to precure_name.
  cure version                   # Output the version number.
```

## `cure date`
Display date, time and Precure related events.

```
cure date [OPTIONS] [+FORMAT]
```

```sh
$ cure date
2016-06-17 21:28:42 魔法つかいプリキュア！放映期間
```

### Output format

| Format specifier | Description             | Example                        |
| ---              | ---                     | ---                            |
| %Y               | Year                    | 2016                           |
| %m               | Month                   | 12                             |
| %d               | Date                    | 31                             |
| @P               | Precure related events. | 魔法つかいプリキュア！放映期間 |

And other general date formats are usable.

### Options

| Option | Description                                                               |
| ------ | ---------                                                                 |
| -d     | cure date -d STRING: display time described by STRING                     |
| -f     | cure date -f DATEFILE: Load each line of DATEFILE as STRING of -d option. |

```sh
$ cure date -d '3 years ago' '+%Y/%m @P'
2013/06 ドキドキ！プリキュア放映期間
```

Standard input can be loaded by giving `-` as DATEFILE.

```sh
$ echo 2016{01..12}{01..31}| xargs -n 1 | cure date -f - '+%F @P' 2>/dev/null | grep 誕生日 | head
2016-01-07 宇佐美いちか(キュアホイップ)誕生日/Go!プリンセスプリキュア放映期間
2016-04-04 雪城ほのか(キュアホワイト)誕生日/魔法つかいプリキュア！放映期間
2016-04-10 春野はるか(キュアフローラ)誕生日/魔法つかいプリキュア！放映期間
2016-04-16 有栖川ひまり(キュアカスタード)誕生日/魔法つかいプリキュア！放映期間
2016-05-28 四葉ありす(キュアロゼッタ)誕生日/魔法つかいプリキュア！放映期間
2016-06-11 琴爪ゆかり(キュアマカロン)誕生日/魔法つかいプリキュア！放映期間
2016-06-12 朝日奈みらい(キュアミラクル)誕生日/魔法つかいプリキュア！放映期間
2016-07-20 海藤みなみ(キュアマーメイド)誕生日/魔法つかいプリキュア！放映期間
2016-08-04 相田マナ(キュアハート)誕生日/魔法つかいプリキュア！放映期間
2016-08-07 日向咲(キュアブルーム)誕生日/魔法つかいプリキュア！放映期間
```

## `cure echo`
Print messages of Precure.

```
cure echo [OPTIONS] PATTERN
```

```sh
$ cure echo
みんなの思いを守るために
心をひとつに！
思いよ届け！キュアエコー！

$ cure echo -p happy
(レディ？)
プリキュア・スマイルチャージ！
(ゴー！ゴー！レッツ・ゴー！ハッピー！！)
キラキラ輝く未来の光！ キュアハッピー！
5つの光が導く未来！
輝け！スマイルプリキュア！

# Choose style for MAHO GIRLS PRECURE!
$ cure echo -p cure_magical -s ruby
キュアップ・ラパパ！　ルビー！
ミラクル・マジカル・ジュエリーレ！
ふたりの魔法！キュアマジカル！
魔法つかいプリキュア！！
```

### Options

| Option | Description                         |
| ------ | -----------                         |
| -a     | Print attack message.               |
| -q     | Print messages immediately.         |
| -p     | Print the given PRECURE's message.  |
| -s     | Choose style of the transformation. |


## `cure girls`
Print girls' name.

```sh
$ cure girls
美墨なぎさ
雪城ほのか
九条ひかり
日向咲
美翔舞
夢原のぞみ
夏木りん
春日野うらら
秋元こまち
水無月かれん
...
```

| Option | Description                                   |
| ------ | -----------                                   |
| -f     | Show girl's full name if it exists.           |
| -m     | Include who have only appeared in the movies. |



## `cure grep`
Print lines matching a pattern.

```
cure grep [OPTIONS] PATTERN
```

```sh
$ echo キュア{レッド,ピンク,ブラック,ブルー,ホワイト}"\n" | cure grep
 キュアブラック
 キュアホワイト

$ echo "こんにちは、 私はキュアレモネードです。" | cure grep '私は[:precure_name:]です。'
こんにちは、 私はキュアレモネードです。
```

### Options

| Option | Description                                                                                         |
| ------ | -----------                                                                                         |
| -E     | Interpret PATTERN as an extended regular expression.                                                |
| -o     | Print only the matched (non-empty) parts of a matching line, with each such part on a separate out. |


### Folloing "Precure bracket expression"can be used.

| Expression       | Description                       |
| ----------       | --------------                    |
| [:cast_name:]    | Voice actor name.                 |
| [:color:]        | Name of the color of the Precure. |
| [:girl_name:]    | Girl name.                        |
| [:human_name:]   | Real name before transforming.    |
| [:precure_name:] | Precure name.                     |


## `cure tr`
Translate Precure related parameters.

```sh
$ echo 相田マナ | cure tr '[:human_name:]' '[:cast_name:]'
生天目仁美
```

### Folloing "Precure bracket expression" are available.

| Expression       | Description                       |
| ----------       | --------------                    |
| [:cast_name:]    | Voice actor name.                 |
| [:color:]        | Name of the color of the Precure. |
| [:girl_name:]    | Girl name.                        |
| [:human_name:]   | Real name before transforming.    |
| [:precure_name:] | Precure name.                     |


## `cure transform`
Change human_name to precure_name

```sh
$ echo '私の名前は十六夜リコです。' | cure transform
私の名前はキュアマジカルです。
```

## `cure humanize`
Change precure_name to human_name.

```sh
$ echo キュア{ハート,エース} | cure humanize
相田マナ 円亜久里
```

## `cure janken`
Let's play "Pikarin Janken" !

```sh
$ cure janken
ピカピカピカリン
ジャンケンポン！
1...グー, 2...チョキ, 3...パー : 1

あなた: グー
キュアピース: グー

[結果]
あいこ
```

Exit status is changed depending on the result.

| Result   | Exit status |
| ------   | ----------- |
| You win  | 0           |
| You lose | 1           |
| Draw     | 2           |

## `cure precures`
Print Precure names.

```
$ cure precures
キュアブラック
キュアホワイト
シャイニールミナス
キュアブルーム
キュアイーグレット
キュアブライト
キュアウィンディ
キュアドリーム
キュアルージュ
キュアレモネード
...
```

| Option | Description                                   |
| ------ | -----------                                   |
| -m     | Include who have only appeared in the movies. |

## Zsh completion

[zsh-completion/_cure](zsh-completion/_cure) is the file for `cure` command completion.
With [zplug](https://github.com/zplug/zplug), it can be installed like this.

```sh
zplug "greymd/cureutils"
```

And update like this.

```sh
$ zplug update greymd/cureutils
```

![completion_image](./img/cure_echo_demo.gif)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/greymd/cureutils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

### Source code
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

### Logo
<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />The logo is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
