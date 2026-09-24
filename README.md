# ChessGame
ChessGame for Computer Basic Class of TUS

## 開発環境

Python 3.12 と [uv](https://docs.astral.sh/uv/) を使用します。`pygame-ce` は画面表示と入力、`python-chess` は盤面と指し手の管理に使います。

```sh
uv sync
```

依存ライブラリを確認するには、次を実行します。

```sh
uv run python -c "import pygame, chess; print(pygame.version.ver, chess.__version__)"
```

ゲームの起動コードはまだありません。追加後は `uv run python <起動ファイル>.py` で実行できます。
