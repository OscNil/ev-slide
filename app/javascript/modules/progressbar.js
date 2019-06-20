// Grab the start time
let color;
let start_time = document.querySelector('#starting-time').innerHTML.split(':');
console.log("start time " +start_time);

// Grab the time left
let time = document.querySelector('.time-status').innerText.split(':');

// Calc the minutes to get the status of the progress bar
let time_hour = parseFloat(time[0]);
let time_minute = parseFloat(time[1]);
let time_seconds = parseFloat(time[2]);
let secs = ((time_hour * 3600) + (time_minute * 60) + time_seconds);
console.log('Secs: ' +secs);
console.log(240*60);
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

// console.log('Color: ' + color)

// Create progress bar
var ProgressBar = require('progressbar.js');
var bar = new ProgressBar.Circle('#donut', {
  strokeWidth: 12,
  easing: 'easeInOut',
  duration: 240,
  color,
  svgStyle: null
});

// Grab hours, minutes, seconds
let hours = time[0];
let mins = time[1];
let seconds = time[2];
const clock = document.querySelector('.time-status');
const curr_clock = document.querySelector('.curr-time');

    function setDate() {
      // Grab current time
      let date = new Date();
      let hour_now = date.getHours();
      let minute_now = date.getMinutes();
      let seconds_now = date.getSeconds();
      let mins_now = ((hour_now* 60) + (minute_now));

      let start_hour = (parseFloat(start_time[0].trim()) * 60 * 60);
      let start_minute = ((parseFloat(start_time[1]) + 240) *60);
      let start_second = (parseFloat(start_time[2]));
      let start_time_seconds = start_hour + start_minute + start_second;

      let get_time_seconds = ((mins_now * 60) + parseFloat(seconds_now));

      console.log('Start time seconds: ' + start_time_seconds);
      console.log('Get time seconds: ' + get_time_seconds);

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
        date = new Date();
        // re-calculate status

      } else {
        // Time overdue
        seconds++;

        if (seconds == 60){
          mins++;
          seconds = 0;
        }
        if (seconds <10 && seconds > -1){
          seconds = '0' + seconds
        }

        if ( mins == 60 ){
          hours++;
          mins = 0;
        }

        if (mins === 9 || mins === 8 || mins === 7|| mins === 6 || mins === 5 || mins === 4 || mins === 3 || mins === 2 || mins === 1){
          mins = '0' + mins
        }

        status = 1;
        color = 'red';

      }
      // Update remaining time
      if ( hours === '00') {
        clock.innerText = mins+':'+seconds;
      }
      else
      {
        clock.innerText = hours+':'+mins+':'+seconds;
      }
      // Update current time
      curr_clock.innerText = 'Current time: ' + hour_now + ':' + minute_now
      console.log('New status: ' +status);
      console.log('New Color: ' + color);
      bar.animate(-(status))  ;  // Number from 0.0 to 1.0

    }

    setInterval(setDate, 1000);
