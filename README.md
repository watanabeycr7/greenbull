# アプリケーション名
greenbull

# アプリケーション概要
ユーザーごと、グループごとに予定を管理

# URL
<https://greenbull.herokuapp.com/>

# テスト用アカウント
+ Basic認証ID: wtnbkyt
+ Basic認証password: 38043
+ メールアドレス:aaa@aaa
+ パスワード:aaaaaa

# 利用方法
+ 予定の追加
  1. トップページの予定追加リンクを押す
  2. 予定名・開始日時・終了日時・場所・メモを入力
  3. 該当する参加者とグループにチェックを入れて登録ボタンを押す
+ グループの追加、編集
  1. ヘッダーのグループ一覧を押す
  2. 新規グループ作成を押し、グループ名を入力し登録ボタンを押す
  3. 編集したいグループを押す
  4. 「グループ情報を編集する」リンクを押し、グループ名を編集して「確定する」ボタンを押す
+ ユーザー自身の情報編集
  1. ヘッダーの「マイページ」を押す
  2. 名前・メールアドレス・グループ・編集し、登録ボタンを押す
+ 他のユーザーの情報編集
  1. ヘッダーの「利用者一覧」を押す
  2. 編集したいユーザー名を押す
  3. 名前・メールアドレス・グループ・編集し、登録ボタンを押す

+ 管理用画面
  1. トップページのURLの末尾に"/admin"を追加してエンターキーを押す

# アプリケーションを作成した背景
自分自身の前職での経験から、編集権限のあるユーザーがその他のユーザーの予定を把握し自由に編集できるツールの必要性を感じた。ユーザーごとやグループごとに一覧表示をして予定の管理をしやすくするアプリケーションを開発することにした。

# 洗い出した要件
<https://docs.google.com/spreadsheets/d/14l2DsDKMiJvEoMWP8eK4EQyYeQh78YRsr4dQIcODQCg/edit#gid=543973842>

# 実装予定の機能
+ CSS装飾の実装
+ スケジュール情報が1件も存在しない場合にカレンダーが表示されるかわりに、スケジュール登録の操作説明を表示させる。
+ スケジュールを画面遷移することなくトップページ上で追加、編集可能にする
+ スケジュール編集開始時に、登録されてある情報をもとにユーザーとグループが自動で選択されるようにする
+ ユーザー詳細ページにそのユーザーが紐付けられた予定を一覧表示する
+ ユーザーの権限を3種類（閲覧者・編集者・管理者）に分け、アクセスできるページを権限により制限する
+ 入力情報に誤りがある場合に、入力画面に入力情報を残したままエラーメッセージを表示させる。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/4c2198ecec41dd127bf22b6b61894f69.png)](https://gyazo.com/4c2198ecec41dd127bf22b6b61894f69)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/18ed64e6618cd581fd43aca5d36f296c.png)](https://gyazo.com/18ed64e6618cd581fd43aca5d36f296c)

## スクリーンショット
トップページ
[![Image from Gyazo](https://i.gyazo.com/4f6015d6f536f75abe6d69bca976beb0.png)](https://gyazo.com/4f6015d6f536f75abe6d69bca976beb0)

マイページ
[![Image from Gyazo](https://i.gyazo.com/e8dca084a77867cb2404d8db120054a3.png)](https://gyazo.com/e8dca084a77867cb2404d8db120054a3)

利用者一覧
[![Image from Gyazo](https://i.gyazo.com/650df22c4de818f6bc137a40252fe611.png)](https://gyazo.com/650df22c4de818f6bc137a40252fe611)

グループ一覧
[![Image from Gyazo](https://i.gyazo.com/e6c25f43d06e228651ccb03ecf5b3d16.png)](https://gyazo.com/e6c25f43d06e228651ccb03ecf5b3d16)

# 開発環境
HTML, CSS, JavaScript, Ruby on Rails, vscode, github

# ローカルでの動作方法
以下のコマンドを実行
1. git clone <https://github.com/31-wtcr/greenbull.git>
2. cd greenbull
3. bundle install
4. yarn install

# 工夫した点
+ スケジュール登録時に、グループとユーザーを紐付けて中間テーブルへ同時に保存すること
+ javascriptのライブラリを用いてスケジュールを動的に表示させること
