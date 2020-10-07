console.log("DOM WAY");
const listItems = document.querySelectorAll("li");
for (let i = 0; i < listItems.length; i++) {
  console.log(listItems[i].textContent);
}

console.log("JQUERY WAY");
// returns a jQuery object; the leading dollar-sign in front of
// $listItems is conventional; it is just part of the variable name.
const $listItems = $("li");
for (let i = 0; i < $listItems.length; i++) {
  console.log($listItems[i].textContent);
}

const $listItems = $("li");

// you can iterate with the each method
$listItems.each(function (index) {
  // The function is called for each `HTMLElement` in `$listItems`;
  // each time it sets `this` to the next `HTMLElement` in the set.
  console.log([index, this.textContent].join(" "));
});

const $ul = $("ul");
$ul.children().attr("style", "background-color: red");
$ul.parent().attr("style", "background-color: green");
$ul.siblings().attr("style", "color: blue");

$("#cool-thing-form").on("submit", event => {
  event.preventDefault();

  const $input = $("#cool_thing");
  const coolThingVal = $input.val();
  // clear input
  $input.val("");

  const $li = $("<li></li>");
  $li.text(coolThingVal);

  $("#cool-things").append($li);
});

var $listItems = $("li");
$listItems.on("mouseover", event => {
  const currentTarget = event.currentTarget;
  const $currentTarget = $(currentTarget);
  alert($currentTarget.text());
})

// jQuery will call the function only after the DOM is fully loaded.
// The anonymous function **is not** called right at this point.
$(() => {
  $("ul.cool-things > li").attr("style", "background-color: red");
});

