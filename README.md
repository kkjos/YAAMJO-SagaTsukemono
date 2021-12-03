# yamajo-sagatukemono

## サイト概要
京都府にある漬物屋のECサイト<br>
以下の機能・仕組みにより「顧客側は商品の閲覧・購入」「管理者側は商品・注文の管理」ができることを目的とする。
#### <顧客側>
- 商品一覧・詳細の閲覧
- 商品をカートに追加・編集
- 会員情報の編集
- 注文履歴の閲覧
- 配送先の追加・編集
#### <管理者側>
- 商品の追加・編集
- 会員情報の編集
- 注文履歴の確認・編集
#### ※またログインしていない状態ではTOPページ・商品・概要等の一部ページの閲覧が可能

### テーマを選んだ理由
現状のHPでは従業員が管理者として商品情報の編集ができず、商品情報の変更に時間がかかる仕組みになっており<br>
また通販は電話やFAXのみであるため、管理機能を含んだ通販サイトを開設しようと思い至った。

### サイトテーマ
ネット通販をあまり利用しない人でも簡単に注文ができ、従業員自身で商品・注文管理ができるサイト

### ターゲットユーザ
- 電話・FAXで注文いただいている方
- 京都のお漬物を探しておられる方

## 設計書
- [ER図](https://drive.google.com/file/d/1etlbIRGIrQSEWq8UgnpIiOfXkP91EDfi/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1bu3oCuZH_KA7Tv-eW70pCbn3JQNJCs4t/edit?usp=sharing&ouid=105797685610303566461&rtpof=true&sd=true)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1i-uBxIGldU9u883COHAsdqFQol1Sj-kk/edit?usp=sharing&ouid=105797685610303566461&rtpof=true&sd=true)

## チャレンジ要素一覧
[チャレンジ要素一覧](https://docs.google.com/spreadsheets/d/15UAuTZc3Zo6S9Uj-B-8jbfSsJNvRWrCl52uFf925768/edit?usp=sharing)

## 開発環境
- OS：Linux(CentOS)
- 言語
  - HTML 5
  - CSS 3
  - JavaScript
  - Ruby 2.6.3
  - Rails 5.2.5
  - SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9
