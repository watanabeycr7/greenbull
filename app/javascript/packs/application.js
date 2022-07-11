// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./frappe-gantt"

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

window.onload = function () {
  // タスクを用意
  var tasks = [
    {
      id: 'id1',
      name: '確定申告する',
      description: '必ずやる!!',
      start: '2021-01-01',
      end: '2021-01-7',
      progress: 100,
    },
    {
      id: 'id2',
      name: 'クライアントに挨拶',
      description: '年賀状も確認した上で連絡する',
      start: '2021-01-4',
      end: '2021-01-8',
      progress: 100,
    },
    {
      id: 'id3',
      name: '請求書作成',
      description: 'みんなに稼働時間を記録してもらった上で請求を出す',
      start: '2021-01-5',
      end: '2021-01-6',
      progress: 40,
    },
    {
      id: 'id4',
      name: '案件A を開発',
      description: 'まずはフレームワークのアップデートやる!',
      start: '2021-01-5',
      end: '2021-01-11',
      progress: 50,
    },
    {
      id: 'id5',
      name: 'フィードバック面談',
      description: '各メンバーシートを記入してもらった上で 1on1',
      start: '2021-01-12',
      end: '2021-01-16',
      progress: 20,
    },
  ];

  // gantt をセットアップ
  var gantt = new Gantt("#gantt", tasks, {
    // ダブルクリック時
    on_click: (task) => {
      console.log(task.description);
    },
    // 日付変更時
    on_date_change: (task, start, end) => {
      console.log(`${task.name}: change date`);
    },
    // 進捗変更時
    on_progress_change: (task, progress) => {
      console.log(`${task.name}: change progress to ${progress}%`);
    },
  });
};