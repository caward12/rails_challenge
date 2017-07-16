function postRestaurant() {
  var restaurantData = {
      restaurant: {
          name: $("#restaurant_name").val(),
          cuisine: $("#restaurant_cuisine").val(),
          city: $("#restaurant_city").val(),
          state: $("#restaurant_state").val(),
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
            $("#restaurant_name").val(""),
            $("#restaurant_cuisine").val(""),
            $("#restaurant_city").val(""),
            $("#restaurant_state").val(""),
            $("#restaurant_zip").val("")
        });
}
  function bindSubmitListenerAndPostRestaurant() {
   $(".new-restaurant-form #add-rest").on("click", function(event) {
       event.preventDefault();
       $(".new-restaurant-form").hide()
       postRestaurant();
   });
  }

function newRestaurantForm (){
  $('.new-restaurant-button').on("click", function(event){
    event.preventDefault()
    $(this).next("div").show()
  })
}


$(document).ready(function(){
  newRestaurantForm()
  bindSubmitListenerAndPostRestaurant()

})

