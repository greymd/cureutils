<p align="center">
<img src="./img/cureutils_logo.png" />
</p>

# Cureutils
[![Gem Version](https://badge.fury.io/rb/cureutils.svg)](https://badge.fury.io/rb/cureutils)

Useful command line tool for Japanese battle heroine Pretty Cure (Precure).

## Installation

Install:

```
$ gem install cureutils

# for ruby 2.0, 2.1, 2.2
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

| Option | Description                                           |
| ------ | ---------                                             |
| -d     | cure date -d STRING: display time described by STRING |

```sh
$ cure date -d '3 years ago' '+%Y/%m @P'
2013/06 ドキドキ！プリキュア放映期間
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

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

