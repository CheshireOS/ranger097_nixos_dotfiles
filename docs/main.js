const navSection = document.getElementById('nav-section');
const closeBtn = document.getElementById('close-btn');
closeBtn.addEventListener('click',() => {
  navSection.classList.toggle('hidden');
});
