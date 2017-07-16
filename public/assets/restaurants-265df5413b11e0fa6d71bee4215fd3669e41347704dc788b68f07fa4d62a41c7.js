function postRestaurant() {
  var restaurantData = {
      restaurant: {
          name: $("#restaurant_name").val(),
          cuisine: $("#restaurant_cuisine").val(),
          city: $("#restaurant_city").val()
          state: $("#restaurant_state").val()
          zip: $("#restaurant_zip").val()
       }
   }

 $.ajax({
        url: "/restaurants",
        method: "POST",
        data: restaurantData
        })
        .done(function(newRestaurantMarkup) {
            $("#restaurants").prepend(newRestaurantMarkup);
        });
}
  function bindSubmitListenerAndPostRestaurant() {
   $(".new-restaurant-form input[type='submit']").on("click", function(event) {
     debugger
       event.preventDefault();
       postRestaurant();
   });
  }

function newRestaurantForm (){
  $('new-restaurant-button').on("click", function(){
    debugger
    $('.new_restaurant').show();
  })
}


$(document).ready(function(){
  bindSubmitListenerAndPostRestaurant()
  $('.new-restaurant-button').on("click", function(){
    debugger
    $('.new_restaurant').show();
  })
})

;
