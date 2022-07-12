// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// frappe-gantt（ガントチャート）をインポート
import "./frappe-gantt"

// fullcalendarをインポート
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", function () {
  // frappe-gantt
  let tasks = [];

  const XHR = new XMLHttpRequest();
  XHR.open("GET", "/schedules/frappe_gantt", true);
  XHR.responseType = "json";
  XHR.send();
  XHR.onload = () => {
    const allSchedules = XHR.response.all_schedules;
    allSchedules.forEach(element => {
      tasks.push(
        {
          id: `id${element.id}`,
          name: element.name,
          description: element.description,
          start: element.start,
          end: element.end,
          progress: 0,
        },
      )
    });

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

  // fullcalendar
  // XHR.onloadの外部にあるため、現時点ではガントチャートの上に表示される
  var calendarEl = document.getElementById('calendar');

  let calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin],
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek'
    },
    buttonText: {
      today: '今日',
      month: '月',
      week: '週',
      day: '日',
      list: 'リスト'
    },
    selectable: true,
    editable: true,
    locale: "ja",

    select: function (info) {
      const eventName = prompt("イベントを入力してください");
      if (eventName) {
        calendar.addEvent({
          title: eventName,
          start: info.start,
          end: info.end,
          allday: true,
        });
      };
    },

    eventClick: (e) => {
      console.log("eventClick:", e);
    }
  });

  calendar.render();
});