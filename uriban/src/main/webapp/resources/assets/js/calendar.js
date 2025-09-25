  'use strict';
(function (jQuery) {
	function changeView(value) {
        switch (value) {
            case 'day':
                window.cal.changeView('day', true);
                break;
            case 'week':
                window.cal.changeView('week', true);
                break;
            case 'month':
                window.cal.changeView('month', true);
                break;
    	}
	}
	
    function randerRangeText() {
        const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
        const startDate = window.cal.getDateRangeStart()
        const endDate = window.cal.getDateRangeEnd()
        const year = startDate.getFullYear()
        const month = months[startDate.getMonth()]
        console.log(window.cal.getDateRangeEnd())
        console.log(month, year)
        console.log('cal-range-render')
    }

    function createSchedule(data){
        window.cal.createEvents(data); 
    }

    window.cal = new tui.Calendar('#calendar', {
        defaultView: 'month',
        useFormPopup: false,
        useDetailPopup: true,
        isReadOnly: true,
        taskView: true,
        template: {
            monthDayname: function(dayname) {
                return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
            }
        },
        attendees : false,
    });

    window.cal.setCalendars([
        {
            id: 'D101',
            name: '정기행사일정',
            color: '#000',
            backgroundColor: 'rgba(127,183,248,0.76)',
        },
        {
            id: 'D102',
            name: '교내 행사',
            backgroundColor: 'rgba(248,232,127,0.76)',
        },
        {
            id: 'D103',
            name: '학부모 참관일',
            backgroundColor: 'rgba(143,127,248,0.76)',
        },
        {
            id: 'D104',
            name: '생일',
            backgroundColor: 'rgba(248,127,127,0.76)',
        }
    ]);

    window.addEventListener('resize', function() {
        window.cal.render();
    });


    $('#cal-type').on('change', function() {
        changeView($(this).val())
    })
    
    $('#cal-next').on('click', function() {
        window.cal.next()
        // document.getElementById("nowDate").innerHTML =	 nowDate + 1
        setNowDate();
    })

    $('#cal-prev').on('click', function() {
        window.cal.prev()
        document.getElementById("nowDate").innerHTML = nowDate - 1
        setNowDate();
    })

    function getNowDate(){
    	var nowDate = document.getElementById("nowDate").innerHTML = new Date().getMonth() + 1;
    }
    function setNowDate(){
        var year = window.cal.getDate().getFullYear();
        var month = window.cal.getDate().getMonth() + 1;

        document.getElementById("nowDate").innerHTML = year + "-" + month;
    }
    function dateFormat(date) {
        let dateFormat2 = date.getFullYear() +
            '-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
            '-' + ( (date.getDate()) < 9 ? "0" + (date.getDate()) : (date.getDate()) );
        return dateFormat2;
    }



    $(document).ready(getJSON());
    console.log(randerRangeText())
    
    function getJSON(info) {
        var cal_start_date = window.cal.getDateRangeStart();
        var cal_end_date = window.cal.getDateRangeEnd();
        $.ajax('ajaxCalList',{
            type : 'get',
            contentType : 'application/json',
            	data : {
                     start : cal_start_date.toDate()
                  , end:cal_end_date.toDate()
            	}
        })
    	.done(result => {
            console.log(result);
   			createSchedule(result);
    	})
	};
    
	// let classInfo = 'E101';
	
	// getJSON(classInfo);
})(jQuery);

  $(document).on('click', '#btnScheduleUpdateForm', function(e) {
      var scheduleNo = $(e.target).attr("data-schedule-no");
      scheduleUpdateForm(scheduleNo);
  });
  $(document).on('click', '#btnScheduleDelete', function(e) {
      var scheduleNo = $(e.target).attr("data-schedule-no");
      $.ajax({
          url:'scheduelDelete',
          type:'get',
          data: {'scheduleNo' : scheduleNo}
      })
          .done(data=>{
              window.cal.deleteEvent(scheduleNo, clickCalendarEventCalendarId);
              alert("정상적으로 처리되었습니다.");
              $(".toastui-calendar-event-detail-popup-slot").html("");
          })
          .fail(err=>{
          });
  });
  function scheduleUpdateForm(scheduleNo){
      $.ajax({
          url:'scheduleUpdateForm',
          type:'get',
          contentType:'html',
          data: {'scheduleNo' : scheduleNo}
      })
          .done(data=>{
             $("#scheduleUpdateModalBody").html(data);
          })
          .fail(err=>{
          });

  }


