function eventCalendar() {
  var calendar = $('#calendar').fullCalendar({
    header: {
      left: '',
      center: 'title',
    },
    events: '/events.json',
    selectable: true,
    eventClick: function(event) { //イベントをクリックしたときに実行
      //     calendar.fullCalendar('refetchEvents');
      $("#calendar").fullCalendar('refetchEvents');
      console.log(event)
    },
    dayClick: function(event) {
      var data = {
        date: {
          year: event.year(),
          month: parseInt(event.month()) + 1,
          day: event.date(),
        }
      }
      $.ajax({
       type: "POST",
       url: "/schedules",
       data: data,
      }).done(function(data, text, jq) {
        calendar.fullCalendar('refetchEvents');
      });
    }
  });
  return calendar
};
function clearCalendar() {
  $('#calendar').fullCalendar('delete'); // In case delete doesn't work.
  $('#calendar').html('');
};
$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar)

