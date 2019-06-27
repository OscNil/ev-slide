// Grab the start time
let color;
let time_status;
let status;
let hours;
let mins;
let seconds;

let start_time = document.querySelector('#starting-time');

if (start_time != null) {
  start_time = document.querySelector('#starting-time').innerHTML.split(':');

  get_time_status();

  setColor();
  // Create progress bar
  let count = 0;
  let begin_state = 0;
  var ProgressBar = require('progressbar.js');
  var bar = new ProgressBar.Circle('#donut', {
    strokeWidth: 12,
    easing: 'easeInOut',
    duration: 1000,
    color,
    trailWidth: 12,
    trailColor: '#f2f4f6',
    svgStyle: null,
    step: (state, circle) => {

      if(count > 0 && count < 2){
        begin_state = state.offset;
      }
        count += 1;
      let decimal = Math.round(state.offset / parseFloat(begin_state) * 1000, 0.5)
      if (decimal > 125) {
        color = "rgb(50,195,178)"
      } else if(decimal <= 125 && decimal > 0){
        color = "rgb(246,142,79)"
      } else {
        color = "rgb(255, 63, 63)"
        decimal = 1;
      }
      circle.path.setAttribute('stroke', color);
    }
  });


}
  const clock = document.querySelector('.time-status');
  const curr_clock = document.querySelector('.fa-clock');
setInterval(setDate, 1000);

// ---------     Functions     --------- //

function get_time_status () {
// Grab the time left
  time_status = document.querySelector('.time-status').innerText.split(':');
}

function calcStatus() {
  get_time_status();
  // Calc the minutes to get the status of the progress bar
  hours = parseFloat(time_status[0]);
  mins = parseFloat(time_status[1]);
  seconds = parseFloat(time_status[2]);
  let secs = ((hours * 3600) + (mins * 60) + seconds);

  // Change between 240 and 3600 depending on 4 minutes or hours
  // Also change in appl_controller and charg_session
  status = -1 + ( secs / (240));
}
function setColor() {
  calcStatus();
    if (status < -0.99999999999){
      color = "rgb(198, 63, 63)";
      status = -1;
    }
    else if (status < -0.875){
      color = "rgb(246,142,79)";
    }
    else{
      color = "rgb(50,195,178)";
    }
  }


function setDate() {
  // Grab current time
  if (start_time != null) {
    let date = new Date();
    let hour_now = date.getHours();
    let minute_now = date.getMinutes();
    let seconds_now = date.getSeconds();
    let mins_now = ((hour_now * 60) + (minute_now));

    let start_hour = (parseFloat(start_time[0].trim()) * 60 * 60);
    // Change position of 0 and 240 depending on 4 hours / 4 minutes
    let start_minute = ((parseFloat(start_time[1]) + 0) *60) + 240;
    let start_second = (parseFloat(start_time[2]));

    let start_time_seconds = start_hour + start_minute + start_second;
    let time_now_seconds = ((mins_now * 60) + parseFloat(seconds_now));

    // Check if elapsed time is less than four hours
    if ( start_time_seconds >= time_now_seconds) {
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

      if (mins < 10) {
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
      calcStatus();

    } else {
      let overdue_seconds = time_now_seconds - start_time_seconds;
      hours_over = Math.floor(overdue_seconds / 3600);
      overdue_seconds %= 3600;
      minutes_over = Math.floor(overdue_seconds / 60);
      seconds_over = overdue_seconds % 60;

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
      clock.innerText = minutes_over+':'+seconds_over;
      }
      else
      {
        clock.innerText = hours_over+':'+minutes_over+':'+seconds_over;
      }
      // status = 1;
      // color = "rgb(198, 63, 63)";
    }
    // Update current time
    if (minute_now < 10 ){
      minute_now = '0' + minute_now
    }

    if (seconds_now < 10 ){
      seconds_now = '0' + seconds_now
    }

    curr_clock.innerText = ' ' + hour_now + ':' + minute_now + ':' + seconds_now

    bar.animate(-(status))  ;  // Number from 0.0 to 1.0
  }
}
