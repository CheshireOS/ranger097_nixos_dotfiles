const themeButtons = document.querySelectorAll('#anonymous, #gruvbox, #catppuccin, #kanagawa, #persona, #tokyo, #anime');

const navList = document.querySelectorAll('.query_nav-text');
navList.forEach((nav) => {
  nav.addEventListener('click', function() {
    const currentChosen = document.querySelector('.query_nav-text.chosen'); 
    if (currentChosen) {
      currentChosen.classList.remove('chosen');
    }
    this.classList.add('chosen');
  });
});

const themeList = document.querySelectorAll('.theme-text');
   themeList.forEach((theme) => {
   theme.addEventListener('click', function() {
   const currentTheme = document.querySelector('.theme-text.chosen');
   if (currentTheme) {
      currentTheme.classList.remove('chosen');
   }
      this.classList.add('chosen');
   });
});

function themeChanger(newTheme) {
thebody.className = newTheme;
}

themeButtons.forEach(btn => {
  btn.addEventListener('click', () =>  themeChanger(btn.id));
});


thebody.classList.add('anonymous');
document.getElementById('welcome')?.classList.add('chosen');
document.getElementById('anonymous')?.classList.add('chosen');

