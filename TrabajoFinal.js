
  function toggleLanguage() {
        const spanish = document.getElementById('spanish');
        const english = document.getElementById('english');
        
        if (spanish.classList.contains('active')) {
            spanish.classList.remove('active');
            english.classList.add('active');
        } else {
            english.classList.remove('active');
            spanish.classList.add('active');
        }
    }

