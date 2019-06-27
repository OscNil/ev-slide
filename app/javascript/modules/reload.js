function reload(){
// Note: below is only reloading necessary info on your own card on Queue page
// when it is your turn. If more people are in the queue, those won't be updated.
// This is only a solution for the demo.

  setInterval(function(){
    $.ajax({ url: "/queue_refresh", success: function(data){
      console.log("Hej")
      if(!data.myturn) return;

      // query class to find card with correct user id
      const myCard = document.querySelector(`.ev-card-${data.userId}`);
      // add class of me-card-charger-available to make card green
      myCard.classList.add('me-card-charger-available');
      // query class to find charger/time info with correct user id
      const myCharger = document.querySelector(`.ev-info-${data.userId}`);
      // refresh that info to reflect correct icon and number of the charger
      $(`.ev-info-${data.userId}`).load(location.href + ` .ev-info-${data.userId}`);
    }, dataType: "json"});
  }, 500);
}
export default reload;
