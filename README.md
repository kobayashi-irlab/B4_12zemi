# 研究室 卒業論文・修士論文用 LaTeX テンプレート

卒業論文・修士論文などを$\LaTeX$で書くためのテンプレートです．
(ローカル / クラウドアプリ)での利用方法を記載してます．
環境に合わせて選択してください．

#### $\TeX$ 構成要素
| 項目 | 設定 |
| :-: | :-: |
| コンパイルエンジン | LuaLaTeX |
| ドキュメントクラス | ozakilab-thesis <br> (jlreqを基底としたカスタムクラス) |
| 参考文献処理 | biblatex <br> (バックエンド: biber) |

#### ディレクトリ構成
```
.
├── main.tex                      # メインファイル
├── chapters/                     # 章
├── acknowledgements.tex          # 謝辞
├── appendices/                   # 付録
├── figures/                      # 画像ディレクトリ
├── references.bib                # 文献データベース
├── styles/
│   ├── ozakilab-thesis.cls       # ドキュメントクラス
│   ├── title-page.sty            # タイトルページパッケージ
│   ├── table-of-contents.sty     # 目次パッケージ
│   ├── lab-caption.sty           # キャプションパッケージ
│   └── lab-ref.sty               # 参考文献パッケージ
├── .latexmkrc                    # latexmk 設定ファイル
├── build_flag                    # 出力先切り替えフラグ
├── Makefile                      # 標準ビルドスクリプト
├── .vscode/
    └── settings.json             # VSCode 用ビルドスクリプト
```

---

## ローカルでの利用方法

#### 1. Tex Live のインストール (Ubuntu) [参考](https://texwiki.texjp.org/Linux)
apt 経由だと最新バージョンがインストールされないらしい


1. ```wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz```

2. ```tar xvf install-tl-unx.tar.gz```

3. ```cd install-tl-2*```

4. ```sudo ./install-tl -no-gui```

5. `S`でインストールするスキームを指定 ( デフォルトでは scheme-full )
   `I`を入力してインストール開始

6. `<year>`はインストールした年
   ```sudo /usr/local/texlive/<year>/bin/*/tlmgr path add```

7. ```lualatex --version```
   ```biber --version```

その他，必要なパッケージがあれば
```bash
sudo tlmgr update --self --all
sudo tlmgr install <package>
```

#### 2. GitHub からテンプレート作成
テンプレートを個人のリポジトリにコピーして，バックアップをとってください

1. 「**Use this templete**」ボタンをクリックし，「**Create a new repository**」を選択
   - Owner: 自身のGitHubアカウント
   - Repository name: 任意のプロジェクト名 (例: B4_8zemi)

2. ローカルにクローン
```bash
git clone <https://github.com/YourUsername/your-repository-name.git>
cd your-repository-name
```

#### 3. コンパイル方法
```
make           # PDFを作成します
make view      # PDFを作成して，ビューアで開きます
make clean     # 成果物を削除します
```

#### 4. おすすめ
VS Codeの拡張機能 **LaTeX Workshop** と併用するのがおすすめ
- ctrl + S で自動コンパイル
- TeX -> PDF: `Ctrl + Alt + J`
- PDF -> TeX: `Ctrl + クリック`
- Snippets から記号を探せる

---

## Cloud LaTeX での利用方法

#### 1. GitHub から ZIPファイル取得
「**Code**」ボタンをクリックし，「**Download ZIP**」を選択してテンプレート全体をダウンロード

#### 2. Cloud LaTeX にアップロード
Cloud LaTeX にログインし，「**+ 新規プロジェクト**」から「**ZIPファイルを選択**」を選択し，ダウンロードしたZIPファイルをアップロード
- プロジェクト名: 任意
- LaTeX エンジン: lualatex