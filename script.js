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

  // ---- Language switch (TR default / EN) ----
  var STORE = 'ssil_lang';
  var nodes = document.querySelectorAll('[data-en]');
  // capture the original Turkish content of each translatable node
  nodes.forEach(function(n){ n.setAttribute('data-tr', n.innerHTML); });

  function applyLang(lang){
    nodes.forEach(function(n){
      n.innerHTML = (lang === 'en') ? n.getAttribute('data-en') : n.getAttribute('data-tr');
    });
    document.documentElement.lang = lang;
    var lb = document.getElementById('langBtn');
    if(lb){
      // button shows the language you can switch TO
      lb.textContent = (lang === 'en') ? 'TR' : 'EN';
    }
    try { localStorage.setItem(STORE, lang); } catch(e){}
  }

  var saved = 'tr';
  try { saved = localStorage.getItem(STORE) || 'tr'; } catch(e){}
  applyLang(saved);

  var langBtn = document.getElementById('langBtn');
  if(langBtn){
    langBtn.addEventListener('click', function(){
      var next = (document.documentElement.lang === 'en') ? 'tr' : 'en';
      applyLang(next);
    });
  }
})();
