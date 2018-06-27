//= require rails-ujs
//= require_tree .
function handleEvent(_, target) {
  var cat = document.getElementById('user_remember_me')
  cat.checked = !cat.checked;
  target.classList.toggle("focs")
}