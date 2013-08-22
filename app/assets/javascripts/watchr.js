$(function(){
  $("body").on("mouseenter", ".slide-right", start_timer);
  $("body").on("mouseleave", ".slide-right", stop_timer);
  $("body").on("mouseenter", ".slide-left", start_timer);
  $("body").on("mouseleave", ".slide-left", stop_timer);
});
x = {in_theaters:0, opening:0, upcoming:0, following:0}
timer = null;
el = null;
left = null;
total = null;

function start_timer() {
  el = this.parentElement.children[2];
  left = this.classList[0].split("-")[1] == "left"
  total = $(this).siblings(".table-holder").children().children().children()[0].scrollWidth - $(this).siblings(".table-holder").width();
  timer = setInterval(scrollSideways, 20);
}

function stop_timer() {
  clearInterval(timer);
}
function scrollSideways() {
  if(left && x[el.id] > 0 ) {
    x[el.id] -= 10;
  }
  else if(!left && x[el.id] < total) {
    x[el.id] += 10;
  }
  $(el).scrollLeft(x[el.id]);
}
