/**
 * 
 */


// Sélectionner le carrousel
var myCarousel = document.querySelector('#carouselExampleCaptions');
// Initialiser le carrousel
var carousel = new bootstrap.Carousel(myCarousel, {
    interval: 4000,  // Durée entre les slides (3 secondes)
    wrap: true,      // Revenir à la première slide après la dernière
    pause: 'hover'   // Met en pause lors du survol
});


// Gérer la classe sticky pour la navbar
const navbar = document.querySelector('.navbar');
const topBarHeight = 60; // Hauteur estimée de la top-bar
window.addEventListener('scroll', () => {
    if (window.scrollY >= topBarHeight) {
        navbar.classList.add('sticky');
    } else {
        navbar.classList.remove('sticky');
    }
});

// Animation au scroll pour les catégories
window.addEventListener('scroll', () => {
    const categories = document.querySelectorAll('.category');
    categories.forEach(category => {
        const rect = category.getBoundingClientRect();
        if (rect.top < window.innerHeight) {
            category.style.opacity = 1;
            category.style.transform = 'translateY(0)';
            category.style.transition = 'all 0.5s ease';
        }
    });
});

// ---- Script global pour le site A-Z Market ----

// Affiche une alerte de confirmation (par exemple pour les suppressions)
function confirmerAction(message) {
    return confirm(message);
}

// Exemple : Fonction pour basculer le thème clair/sombre (optionnel)
function toggleTheme() {
    const body = document.body;
    body.classList.toggle('dark-mode');
}

document.addEventListener("DOMContentLoaded", () => {
    console.log("Bienvenue chez A-Z Market !");
});

// Exemple : Activation automatique du lien de navigation actif
document.addEventListener('DOMContentLoaded', function () {
    const navLinks = document.querySelectorAll('header nav a');
    const currentPage = window.location.pathname;

    navLinks.forEach(link => {
        if (link.href.includes(currentPage)) {
            link.classList.add('active');
        }
    });
});

document.addEventListener("DOMContentLoaded", () => {
    // Exemple d'animation légère
    const heroSection = document.querySelector(".hero-section");
    heroSection.style.transition = "opacity 1.5s ease";
    heroSection.style.opacity = 1;

    // Animation au scroll
    window.addEventListener("scroll", () => {
        const features = document.querySelectorAll(".feature");
        features.forEach(feature => {
            const rect = feature.getBoundingClientRect();
            if (rect.top < window.innerHeight) {
                feature.style.transform = "translateY(0)";
                feature.style.opacity = 1;
            }
        });
    });
});


// Ajout d'une animation hover sur les icônes des réseaux sociaux
document.querySelectorAll('.footer i').forEach(icon => {
    icon.addEventListener('mouseover', () => {
        icon.style.transform = 'scale(1.2)';
        icon.style.transition = 'transform 0.2s ease-in-out';
    });

    icon.addEventListener('mouseout', () => {
        icon.style.transform = 'scale(1)';
    });
});

