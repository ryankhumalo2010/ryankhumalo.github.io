<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ryan Khumalo | Portfolio</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;900&display=swap" rel="stylesheet">
  <meta name="google-site-verification" content="wulfGKZCkJedA2DhWjwFZf6nnPpVpuoOAqF7l0ZkxuA" />
  <style>
    :root {
      --bg-dark: #121212;
      --bg-darker: #1f1f1f;
      --accent: #00aaff;
      --text-light: #e0e0e0;
      --font-main: 'Poppins', sans-serif;
    }

    html {
      scroll-behavior: smooth;
    }

    body {
      margin: 0;
      font-family: var(--font-main);
      background-color: var(--bg-dark);
      color: var(--text-light);
      overflow-x: hidden;
    }

    header {
      background: var(--bg-darker);
      padding: 1rem 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
      z-index: 10;
    }

    .logo {
      font-size: 1.5rem;
      color: var(--accent);
      font-weight: 600;
    }

    nav ul {
      list-style: none;
      display: flex;
      gap: 1.5rem;
      padding: 0;
      margin: 0;
    }

    nav a {
      color: var(--text-light);
      text-decoration: none;
      font-weight: 500;
    }

    .floating-container {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      overflow: hidden;
      z-index: 0;
    }

    .floating-name {
      position: absolute;
      font-size: 4rem;
      color: var(--accent);
      opacity: 0.05;
      font-weight: 900;
      white-space: nowrap;
      text-shadow: 0 0 10px var(--accent), 0 0 30px var(--accent);
      animation: floatRotate 12s ease-in-out infinite alternate;
    }

    @keyframes floatRotate {
      0% { transform: translateY(0) rotate(0deg); }
      50% { transform: translateY(-30px) rotate(5deg); }
      100% { transform: translateY(0) rotate(-5deg); }
    }

    .hero {
      text-align: center;
      padding: 6rem 2rem 4rem;
      background: linear-gradient(to right, var(--bg-dark), #1e1e1e);
      position: relative;
      z-index: 1;
    }

    .hero h1 {
      font-size: 2.5rem;
    }

    .hero h1 span {
      color: var(--accent);
    }

    .btn, .whatsapp-btn {
      margin-top: 1rem;
      padding: 0.75rem 1.5rem;
      background: linear-gradient(135deg, var(--accent), #00ffc3);
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      display: inline-block;
      font-weight: 600;
      position: relative;
      overflow: hidden;
      transition: all 0.4s ease;
      box-shadow: 0 0 15px rgba(0, 255, 255, 0.3);
    }

    .btn::before, .whatsapp-btn::before {
      content: "";
      position: absolute;
      top: 50%;
      left: 50%;
      width: 0;
      height: 0;
      background: rgba(255, 255, 255, 0.3);
      transform: translate(-50%, -50%);
      border-radius: 50%;
      transition: width 0.4s ease, height 0.4s ease;
      z-index: 0;
    }

    .btn:hover, .whatsapp-btn:hover {
      transform: scale(1.05);
      box-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
    }

    .btn:active::before, .whatsapp-btn:active::before {
      width: 200px;
      height: 200px;
      transition: 0s;
    }

    section {
      padding: 4rem 2rem;
      max-width: 1000px;
      margin: auto;
      position: relative;
      z-index: 1;
    }

    h2 {
      font-size: 2rem;
      margin-bottom: 1.5rem;
    }

    .projects {
      display: flex;
      flex-wrap: wrap;
      gap: 2rem;
    }

    .card {
      background: #1c1c1c;
      padding: 1.5rem;
      border-radius: 10px;
      flex: 1 1 45%;
      opacity: 0;
      transform: translateY(50px);
      transition: all 0.6s ease-out;
    }

    .card.fade-in {
      opacity: 1;
      transform: translateY(0);
    }

    .skills {
      list-style: none;
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
      margin-top: 1rem;
      padding: 0;
    }

    .skills li {
      background: var(--accent);
      color: #fff;
      padding: 0.5rem 1rem;
      border-radius: 5px;
      font-weight: 500;
      opacity: 0;
      transform: translateY(30px);
      transition: all 0.5s ease;
    }

    .skills li.fade-in {
      opacity: 1;
      transform: translateY(0);
    }

    .skills li:hover {
      background: linear-gradient(135deg, var(--accent), #007acc);
      transform: scale(1.1);
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    form input, form textarea {
      padding: 1rem;
      background: #1e1e1e;
      color: #fff;
      border: none;
      border-radius: 5px;
    }

    form button {
      background: var(--accent);
      color: white;
      padding: 1rem;
      border: none;
      cursor: pointer;
      border-radius: 5px;
      font-weight: 600;
      transition: transform 0.3s ease;
    }

    form button:hover {
      transform: scale(1.05);
    }

    footer {
      text-align: center;
      padding: 2rem;
      background: var(--bg-darker);
      font-size: 0.9rem;
    }

    @media (max-width: 768px) {
      .floating-name {
        font-size: 2rem;
      }

      .projects {
        flex-direction: column;
      }

      nav ul {
        flex-direction: column;
        gap: 1rem;
        background-color: var(--bg-darker);
        padding: 1rem;
        position: absolute;
        top: 60px;
        right: 20px;
        display: none;
      }
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">🌟 Ryan Khumalo</div>
    <nav>
      <ul>
        <li><a href="#home">🏠 Home</a></li>
        <li><a href="#portfolio">💼 Portfolio</a></li>
        <li><a href="#about">🧠 About</a></li>
        <li><a href="#contact">📬 Contact</a></li>
      </ul>
    </nav>
  </header>

  <div class="floating-container">
    <div class="floating-name">Ryan Khumalo</div>
    <div class="floating-name">Ryan Khumalo</div>
    <div class="floating-name">Ryan Khumalo</div>
  </div>

  <section id="home" class="hero">
    <h1>Hi, I’m <span>Ryan Khumalo</span> 👋</h1>
    <p>Web Designer • Developer • Robotics Enthusiast 🤖</p>
    <a href="#portfolio" class="btn">🚀 View My Work</a>
  </section>

  <section id="portfolio">
    <h2>💼 Portfolio</h2>
    <div class="projects">
      <div class="card"> <h3>📱 Responsive Web App</h3> <p>A sleek modern UI with React and Tailwind.</p> </div>
      <div class="card"> <h3>🤖 Robotic Arm Project</h3> <p>Controlled with Arduino and JavaScript interface.</p> </div>
    </div>
  </section>

  <section id="about">
    <h2>🧠 About Me</h2>
    <p>I build interactive websites and smart robotics systems. Here are the tools I use:</p>
    <ul class="skills">
      <li>HTML</li><li>CSS</li><li>JavaScript</li><li>React</li><li>Arduino</li><li>Python</li>
    </ul>
  </section>

  <section id="contact">
    <h2>📬 Contact Me</h2>
    <form id="contact-form" action="https://formspree.io/f/mnqezzwk" method="POST">
      <input type="text" name="name" placeholder="Your Name" required />
      <input type="email" name="email" placeholder="Your Email" required />
      <textarea name="message" placeholder="Your Message" required></textarea>
      <button type="submit">Send ✉️</button>
    </form>

    <h3>💬 Or WhatsApp Me</h3>
    <button class="whatsapp-btn" onclick="window.open('https://wa.me/263717890402?text=Hello%20Ryan!', '_blank')">
      Message on WhatsApp 💬
    </button>
  </section>

  <footer>
    <p>© 2025 Ryan Khumalo. All rights reserved.</p>
  </footer>

  <script>
    // Form submit
    document.getElementById('contact-form').addEventListener('submit', function (e) {
      e.preventDefault();
      fetch(this.action, {
        method: 'POST',
        body: new FormData(this),
        headers: { 'Accept': 'application/json' }
      }).then(response => {
        if (response.ok) {
          alert("✅ Message sent! Ryan will get back to you shortly.");
          this.reset();
        } else {
          alert("❌ Something went wrong. Please try again.");
        }
      });
    });

    // Scroll reveal
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add("fade-in");
        }
      });
    }, { threshold: 0.1 });

    document.querySelectorAll(".card, .skills li").forEach(el => observer.observe(el));
  </script>

</body>
</html>
