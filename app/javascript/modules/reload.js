function reload(){

  setInterval(function(){
    $.ajax({ url: "/queue_refresh", success: function(data){
        if(!data.myturn) return;
        // console.log(data.userId)
        // query class with correct user id
        const myCard = document.querySelector(`.ev-card-${data.userId}`);
        // add class of me-card-charger-available to correct element
        myCard.classList.add('me-card-charger-available');
      }, dataType: "json"});
  }, 1000);
}
export default reload;
