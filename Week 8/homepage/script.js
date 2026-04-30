// === Bascule thème clair / sombre ===
const themeToggle = document.getElementById('theme-toggle');
if (themeToggle) {
    // Restaure la préférence
    if (localStorage.getItem('theme') === 'light') {
        document.body.classList.add('light-mode');
        themeToggle.textContent = '☀️';
    }
    themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('light-mode');
        const isLight = document.body.classList.contains('light-mode');
        themeToggle.textContent = isLight ? '☀️' : '🌙';
        localStorage.setItem('theme', isLight ? 'light' : 'dark');
    });
}

// === Compteur de visites (page Projets) ===
const counter = document.getElementById('visit-count');
if (counter) {
    let visits = parseInt(localStorage.getItem('visits') || '0', 10) + 1;
    localStorage.setItem('visits', visits);
    counter.textContent = visits;
}

// === Validation du formulaire de contact ===
const form = document.getElementById('contact-form');
const feedback = document.getElementById('form-feedback');
if (form) {
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const name = document.getElementById('name').value.trim();
        const email = document.getElementById('email').value.trim();
        const message = document.getElementById('message').value.trim();

        if (!name || !email || !message) {
            feedback.innerHTML = '<div class="alert alert-danger">Tous les champs sont obligatoires.</div>';
            return;
        }
        if (!email.includes('@')) {
            feedback.innerHTML = '<div class="alert alert-danger">Adresse email invalide.</div>';
            return;
        }

        feedback.innerHTML = `<div class="alert alert-success">Merci ${name}, message bien reçu !</div>`;
        form.reset();
    });
}
