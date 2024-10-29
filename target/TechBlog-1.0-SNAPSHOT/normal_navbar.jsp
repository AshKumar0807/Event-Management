<style>
  .custom-navbar {
    background-color: #413c58;
    padding: 1rem;
  }

  .custom-navbar .navbar-brand {
    color: #fdf0d5;
    font-weight: bold;
    padding: 0.5rem 1rem;
    transition: color 0.3s ease;
  }

  .custom-navbar .navbar-brand:hover {
    color: #c6d8d3;
  }

  .custom-navbar .nav-link {
    color: #fdf0d5;
    margin: 0 0.5rem;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    transition: all 0.3s ease;
  }

  .custom-navbar .nav-link:hover {
    background-color: #d81e5b;
    color: #fdf0d5;
  }

  .custom-navbar .navbar-toggler {
    border-color: #fdf0d5;
  }

  .custom-navbar .navbar-toggler-icon {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(253, 240, 213, 0.8)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
  }

  .logo-img {
    height: 24px;
    width: auto;
    margin-right: 5px;
    vertical-align: middle;
  }
</style>

<nav class="navbar navbar-expand-lg custom-navbar">

  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
      <img src="blog_pics/log.png" alt="Eventora Logo" class="logo-img">
      Eventora
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="contact.jsp">
            <span class="fa fa-user-plus"></span>
            Contact
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login_page.jsp">Login</a>
        </li>``
        <li class="nav-item">
          <a class="nav-link" href="register_page.jsp">Register</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
