import "bootstrap";

const remaining_time = document.querySelector('.time-remaining').innerText.split(':');
const minutes = parseFloat((remaining_time[0] * 60) + (remaining_time[1]));

const status = ( 1 - (minutes / 240));

let color;
if (status >= 1){
  color = 'red';
}
else if (status > 0.875){
  color = 'yellow';
}
else{
  color = 'green';
}

var ProgressBar = require('progressbar.js')
var bar = new ProgressBar.Circle('#donut', {
  strokeWidth: 8,
  easing: 'easeInOut',
  duration: 1,
  color,
  trailColor: 'red',
  trailWidth: 0.5,
  svgStyle: null
});


// Clock ticking down

let hours = remaining_time[0];
let mins = remaining_time[1];
let seconds = remaining_time[2];

    const clock = document.querySelector('.time-remaining');

    function setDate() {
      seconds -= 1;

      if ( seconds == -1 ){
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
          mins = '0' + mins
      }

      clock.innerText = hours+':'+mins+':'+seconds;


      const remaining_time = document.querySelector('.time-remaining').innerText.split(':');
      const minutes = parseFloat((remaining_time[0] * 60) + (remaining_time[1]));

      const status = ( 1 - (minutes / 240));

      let color;
      if (status >= 1){
        color = 'red';
      }
      else if (status > 0.755){
        color = 'yellow';
      }
      else{
        color = 'green';
      }
      bar.animate(status);  // Number from 0.0 to 1.0
    }
    console.log
    setInterval(setDate, 1000);

