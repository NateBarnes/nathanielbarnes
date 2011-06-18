function show_comments(e) {
  e = document.getElementById(e)
  if (e.style.display != "block") {
    e.style.display = "block";
  } else {
    e.style.display = "none";
  }
}