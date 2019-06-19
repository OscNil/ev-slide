import "bootstrap";

let color = 'blue';

// Grab the start time
let start_time = document.querySelector('#starting-time').innerHTML.split(':');
console.log("start time " +start_time);

// Grab the time left
let time = document.querySelector('.time-status').innerText.split(':');
console.log("time "+ time);

// Calc the minutes to get the status of the progress bar
let minutes = parseFloat((time[0] * 60) + (time[1]));
let status = ( 1 - (minutes / 240));
console.log("status " + status)
if (status >= 0.9999){
  color = 'red';
}
else if (status > 0.875){
  color = 'yellow';
}
else{
  color = 'green';
}
// console.log('Color: ' + color)

// Create progress bar
var ProgressBar = require('progressbar.js');
var bar = new ProgressBar.Circle('#donut', {
  strokeWidth: 8,
  easing: 'easeInOut',
  duration: 240,
  color,
  trailColor: 'red',
  trailWidth: 0.5,
  svgStyle: null
});

// Grab hours, minutes, seconds
let hours = time[0];
let mins = time[1];
let seconds = time[2];
const clock = document.querySelector('.time-status');

    function setDate() {
      // Grab current time
      let date = new Date();
      // console.log('Date: ' + date)
      let hour_now = date.getHours();
      // console.log('hour_now: ' + hour_now);
      let minute_now = date.getMinutes();
      // console.log('mins_now: ' + minute_now);
      let seconds_now = date.getSeconds();
      let mins_now = ((hour_now* 60) + (minute_now));

      let start_hour = (parseFloat(start_time[0].trim()) * 60 * 60);
      // console.log('Start hour: ' + start_hour);
      let start_minute = ((parseFloat(start_time[1]) + 240) *60);
      // console.log('Start minute: ' + start_minute);
      let start_second = (parseFloat(start_time[2]));
      // console.log('Start second: ' + start_second);
      let start_time_seconds = start_hour + start_minute + start_second;

      let get_time_seconds = ((mins_now * 60) + parseFloat(seconds_now));

      console.log('Start time seconds: ' + start_time_seconds);
      console.log('Get time seconds: ' + get_time_seconds);
      // Check if elapsed time is less than four hours
      if ( start_time_seconds >= get_time_seconds) {

        // console.log('Inside the seconds -- statement')
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

        if (mins <10 && mins > -1){
          //mins = '0' + mins
        }
        date = new Date();

      } else {
        // console.log('Inside the seconds ++ statement')
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

        if (mins <10 && mins > -1){
          //mins = '0' + mins
        }

        if ( hours == 24) {
          days++;
          hours = 0;
        }

        status = 1;
        color = 'red';

      }
      clock.innerText = hours+':'+mins+':'+seconds;
      bar.animate(status);  // Number from 0.0 to 1.0
    }
    setInterval(setDate, 1000);

//   let time;
//   let minutes;
//   let status;
//   let color = 'blue';
//   console.log('Init color: ' + color)
//   let class_name = document.querySelector('.time-overdue');
//   console.log('class name: ' + class_name);

//   if (class_name === null) {
//     console.log('In the time-remaining statement.')
//     time = document.querySelector('.time-remaining').innerText.split(':');
//     minutes = parseFloat((time[0] * 60) + (time[1]));

//     status = ( 1 - (minutes / 240));
//     console.log('Status: ' + status)

//     if (status >= 1){
//       color = 'red';
//     }
//     else if (status > 0.875){
//       color = 'yellow';
//     }
//     else{
//       color = 'green';
//     }

//     console.log('Color: ' + color)

//   } else {
//     time = document.querySelector('.time-overdue').innerText.split(':');
//     status = 1;
//     console.log('In the time-overdue statement.');
//     console.log('Time in the time-overdue: ' + time);
//   };

//   var ProgressBar = require('progressbar.js')
//   var bar = new ProgressBar.Circle('#donut', {
//     strokeWidth: 8,
//     easing: 'easeInOut',
//     duration: 240,
//     color,
//     trailColor: 'red',
//     trailWidth: 0.5,
//     svgStyle: null
//   });


// // Clock ticking down

// let hours = time[0];
// let mins = time[1];
// let seconds = time[2];
// console.log('hours = ' + hours);
// console.log('hours = ' + mins);
// console.log('hours = ' + seconds);
// const clock_remaining = document.querySelector('.time-remaining');
// const clock_overdue = document.querySelector('.time-overdue');

//     function setDate() {
//       if (class_name === null) {
//         console.log('Inside the seconds -- statement')
//         seconds--;

//         if (seconds == -1){
//           mins -= 1;
//           seconds = 59;
//         }
//         if (seconds <10 && seconds > -1){
//           seconds = '0' + seconds
//         }

//         if ( mins == -1 ){
//           hours -= 1;
//           mins = 59;
//         }

//         if (mins <10 && mins > -1){
//           //mins = '0' + mins
//         }

//         time = document.querySelector('.time-remaining').innerText.split(':');
//         minutes = parseFloat((time[0] * 60) + (time[1]));

//         let status = ( 1 - (minutes / 240));
//         console.log('Status inside seconds --: ' + status);

//         if (status >= 1){
//           color = 'red';
//         }
//         else if (status > 0.825){
//           color = 'yellow';
//         }
//         else{
//           color = 'green';
//         }
//         console.log('Color inside seconds --: ' + color)
//         clock_remaining.innerText = hours+':'+mins+':'+seconds;
//         bar.animate(status);  // Number from 0.0 to 1.0

//       } else {
//         console.log('Inside the seconds ++ statement')
//         seconds++;

//         if (seconds == 60){
//           mins++;
//           seconds = 0;
//         }
//         if (seconds <10 && seconds > -1){
//           seconds = '0' + seconds
//         }

//         if ( mins == 60 ){
//           hours++;
//           mins = 0;
//         }

//         if (mins <10 && mins > -1){
//           //mins = '0' + mins
//         }

//         // time = document.querySelector('.time-overdue').innerText.split(':');

//         status = 1;
//         color = 'red';
//         clock_overdue.innerText = hours+':'+mins+':'+seconds;
//       }

//       bar.animate(status);   // Number from 0.0 to 1.0
//     }
//     setInterval(setDate, 1000);





