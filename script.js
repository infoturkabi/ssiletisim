// SS İletişim — minimal vanilla JS
// Mobile menu toggle + footer year

(function(){
  // mobile menu toggle
  var btn = document.getElementById('menuBtn');
  var nav = document.getElementById('navLinks');
  if(btn && nav){
    btn.addEventListener('click', function(){
      nav.classList.toggle('open');
    });
    // close menu when a link is clicked (mobile UX)
    nav.querySelectorAll('a').forEach(function(a){
      a.addEventListener('click', function(){ nav.classList.remove('open'); });
    });
  }
  // footer year
  var y = document.getElementById('yr');
  if(y) y.textContent = new Date().getFullYear();
})();
