(function () {
  function closeSearch() {
    var toggle = document.getElementById("__search");
    var input = document.querySelector("[data-md-component='search-query']");

    if (toggle) {
      toggle.checked = false;
    }

    if (input) {
      input.blur();
    }
  }

  function scrollToCurrentHash() {
    var id = decodeURIComponent(window.location.hash.slice(1));
    var target = id ? document.getElementById(id) : null;

    if (target) {
      target.scrollIntoView();
    }
  }

  window.addEventListener("hashchange", function () {
    window.setTimeout(function () {
      closeSearch();
      scrollToCurrentHash();
    }, 250);
  });
})();
