#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# pulldown-cmarkをビルドする。
# CreatedAt: 2021-02-03
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"

	# rustをインストールしておくこと

	wget https://github.com/raphlinus/pulldown-cmark/archive/v0.8.0.zip
	unzip v0.8.0.zip
	cd pulldown-cmark-0.8.0
	cargo build --release
	cd target/release

	./pulldown-cmark --help
	echo '# タイトル' | ./pulldown-cmark
	echo -e '- [ ] 未完了\n- [x] 完了した' | ./pulldown-cmark -L
	echo -e '名前|性別\n----|----\n山田|男\n鈴木|女\n' | ./pulldown-cmark -T
	echo '~~これは間違ったテキストでした~~' | ./pulldown-cmark -S
	echo '[^privacy]: There are some privacy concerns.' | ./pulldown-cmark -F
}
Run "$@"
