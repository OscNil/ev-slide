// Grab the start time
let color;
let start_time = document.querySelector('#starting-time').innerHTML.split(':');
console.log("start time " +start_time);

// Grab the time left
let time_status = document.querySelector('.time-status').innerText.split(':');
console.log('Time-status: ' + time_status);

// Calc the minutes to get the status of the progress bar
let hours = parseFloat(time_status[1]);
let mins = parseFloat(time_status[2]);
let seconds = parseFloat(time_status[3]);
let secs = ((hours * 3600) + (mins * 60) + seconds);

let status = -1 + ( secs / (240*60));
console.log("status " + status)
if (status < -0.99999999999){
  color = 'red';
}
else if (status < -0.875){
  color = 'yellow';
}
else{
  color = 'green';
}
// Create progress bar
var ProgressBar = require('progressbar.js');
var bar = new ProgressBar.Circle('#donut', {
  strokeWidth: 12,
  easing: 'easeInOut',
  duration: 240,
  color,
  svgStyle: null
});
// console.log('Color: ' + color)

const clock = document.querySelector('.time-status');
const curr_clock = document.querySelector('.fa-clock');

    function setDate() {
      // Grab current time
      let date = new Date();
      let hour_now = date.getHours();
      let minute_now = date.getMinutes();
      let seconds_now = date.getSeconds();
      let mins_now = ((hour_now* 60) + (minute_now));
      // console.log('hour-now: ' + hour_now);
      // console.log('minute_now: ' + minute_now);

      let start_hour = (parseFloat(start_time[0].trim()) * 60 * 60);
      let start_minute = ((parseFloat(start_time[1]) + 240) *60);
      let start_second = (parseFloat(start_time[2]));
      let start_time_seconds = start_hour + start_minute + start_second;

      let get_time_seconds = ((mins_now * 60) + parseFloat(seconds_now));

      // console.log('Start time seconds: ' + start_time_seconds);
      // console.log('Get time seconds: ' + get_time_seconds);

      // Check if elapsed time is less than four hours
      if ( start_time_seconds >= get_time_seconds) {
        // Remaining time
        seconds--;

        if (seconds == -1){
          mins -= 1;
          seconds = 59;
        }
        if (seconds <10 && seconds > -1){
          seconds = '0' + seconds
        }

        if ( mins == -1 ){
          hours -= 1;
          mins = 59;
        }

        if (mins === 9 || mins === 8 || mins === 7|| mins === 6 || mins === 5 || mins === 4 || mins === 3 || mins === 2 || mins === 1){
          mins = '0' + mins
        }

        // Update remaining time
        if ( hours === '00') {
          clock.innerText = mins+':'+seconds;
        }
        else
        {
          clock.innerText = hours+':'+mins+':'+seconds;
        }
        date = new Date();
        // re-calculate status

      } else {
        let overdue_seconds = get_time_seconds - start_time_seconds;
        // console.log('Seconds overdue: ' + overdue_seconds);
        hours_over = Math.floor(overdue_seconds / 3600);
        // console.log('Hours: ' + hours_over);
        overdue_seconds %= 3600;
        minutes_over = Math.floor(overdue_seconds / 60);
        // console.log('Minutes: ' + minutes_over);
        seconds_over = overdue_seconds % 60;
        // console.log('Seconds: ' + seconds_over);

        if (hours_over < 10 && hours_over > 0) {
          minutes_over = '0' + minutes_over;
        }
        if (minutes_over < 10) {
          minutes_over = '0' + minutes_over;
        }
        if (seconds_over < 10) {
          seconds_over = '0' + seconds_over;
        }
        if ( hours_over === 0) {
        clock.innerText = 'Overdue: '+ minutes_over+':'+seconds_over;
        }
        else
        {
          clock.innerText = 'Overdue: '+ hours_over+':'+minutes_over+':'+seconds_over;
        }
        status = 1;
        color = 'red';
      }
      // Update current time
      curr_clock.innerText = ' ' + hour_now + ':' + minute_now
      // console.log('New status: ' +status);
      // console.log('New Color: ' + color);
      bar.animate(-(status))  ;  // Number from 0.0 to 1.0

    }

    setInterval(setDate, 1000);










// Time overdue
        // seconds++;

        // if (seconds == 60){
        //   mins++;
        //   seconds = 0;
        // }
        // if (seconds <10 && seconds > -1){
        //   seconds = '0' + seconds
        // }

        // if ( mins == 60 ){
        //   hours++;
        //   mins = 0;
        // }

        // if (mins === 9 || mins === 8 || mins === 7|| mins === 6 || mins === 5 || mins === 4 || mins === 3 || mins === 2 || mins === 1){
        //   mins = '0' + mins
        // }
