function driving(){

  setInterval(function(){
    const where = parseInt(document.querySelector(`.login-logo`).style.marginLeft.slice(0, -2), 10) + 1;

    if (where > 0) return;
    document.querySelector(`.login-logo`).style.marginLeft = where.toString() + "px";
    console.log(where);
  }, 10);
}
export default driving;
