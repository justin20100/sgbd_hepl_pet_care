<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title><?= $site_name ?> HTML Bootstrap 5 Template</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100;300;400;700;900&display=swap"
          rel="stylesheet">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-icons.css" rel="stylesheet">

    <link rel="stylesheet" href="css/magnific-popup.css">

    <link href="css/aos.css" rel="stylesheet">

    <link href="css/templatemo-nomad-force.css" rel="stylesheet">
    <!--

TemplateMo 567 <?= $site_name ?>

https://templatemo.com/tm-567-nomad-force

-->
</head>

<body>
<main>

    <section class="hero" id="hero">
        <div class="heroText">
            <h1 class="text-white mt-5 mb-lg-4" data-aos="zoom-in" data-aos-delay="800">
                <?= $site_name ?>
            </h1>

            <p class="text-secondary-white-color" data-aos="fade-up" data-aos-delay="1000">
                Nos animaux recherchent la famille parfaite !
            </p>
        </div>

        <div class="videoWrapper">
            <video autoplay="" loop="" muted="" class="custom-video"
                   poster="videos/792bd98f3e617786c850493560e11c45.jpg">
                <source src="videos/814dc43e870597176cad645798825c03.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>

        <div class="overlay"></div>
    </section>

    <nav class="navbar navbar-expand-lg bg-light shadow-lg">
        <div class="container">
            <a class="navbar-brand" href="index.html">
                <strong><?= $site_name ?></strong>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#hero">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#about">Introduction</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#portfolio">Nos animaux</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#news">News & Events</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="section-padding pb-0" id="about">
        <div class="container mb-5 pb-lg-5">
            <div class="row">
                <div class="col-12">
                    <h2 class="mb-3" data-aos="fade-up">Sauveteur d'animaux</h2>
                </div>

                <div class="col-lg-6 col-12 mt-3 mb-lg-5">
                    <p class="me-4" data-aos="fade-up" data-aos-delay="300">You may contribute <a rel="nofollow"
                                                                                                  href="http://paypal.me/templatemo"
                                                                                                  target="_blank">a
                            small amount</a> via PayPal if <a rel="nofollow"
                                                              href="https://templatemo.com/tm-567-nomad-force"
                                                              target="_parent"><?= $site_name ?> Template</a> is useful
                        for you. This will absolutely help us to keep creating better CSS templates for you. <br><br>We
                        provide you 100% free templates on TemplateMo website. Images are provided by FreePik and
                        Unsplash websites.</p>
                </div>

                <div class="col-lg-6 col-12 mt-lg-3 mb-lg-5">
                    <p data-aos="fade-up" data-aos-delay="500">This Bootstrap 5 layout is free to use for your business.
                        You are allowed to edit it in any way you like. However, please do not redistribute this
                        template ZIP file for a template download purpose on any other website such as Free CSS
                        collections.</p>
                </div>

            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-12 p-0">
                    <img src="images/elena-rabkina-eVVzwsNhNf4-unsplash.jpg" class="img-fluid about-image" alt="">
                </div>

                <div class="col-lg-3 col-12 bg-dark">
                    <div class="d-flex flex-column flex-wrap justify-content-center h-100 py-5 px-4 pt-lg-4 pb-lg-0">
                        <h3 class="text-white mb-3" data-aos="fade-up">Nous sommes des sauveurs d'animaux</h3>

                        <p class="text-secondary-white-color" data-aos="fade-up">Nous nous occupons des animaux depuis 9
                            ans</p>

                        <div class="mt-3 custom-links">

                            <a href="#news" class="text-white custom-link" data-aos="zoom-in" data-aos-delay="100">Voir
                                les animaux</a>

                            <a href="#contact" class="text-white custom-link" data-aos="zoom-in" data-aos-delay="300">Travailler
                                avec nous</a>
                        </div>

                    </div>
                </div>

                <div class="col-lg-6 col-12 p-0">
                    <section id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <?php foreach ($employees as $index => $employee): ?>
                                <div class="carousel-item <?= ($index === 0) ? 'active' : ''; ?>">
                                    <img src="<?= $employee->src; ?>" class="img-fluid team-image" alt="photo de <?= $employee->firstname . ' ' . $employee->lastname; ?>">
                                    <div class="team-thumb bg-<?= $employee->color; ?>">
                                        <h3 class="text-white mb-0"><?= $employee->firstname . ' ' . ucfirst(substr($employee->lastname,0,1)).'.'; ?></h3>
                                        <p class="text-secondary-white-color mb-0"><?= $employee->job ?></p>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>

                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>

                            <span class="visually-hidden">Previous</span>
                        </button>

                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>

                            <span class="visually-hidden">Next</span>
                        </button>
                    </section>

                </div>
            </div>
        </div>
    </section>

    <section class="section-padding" id="portfolio">
        <div class="container">
            <div class="row">

                <div class="col-12">
                    <h2 class="mb-5 text-center" data-aos="fade-up">Nos animaux</h2>
                </div>
                <div class="col-lg-6 col-12">

                    <?php foreach ($leftanimals as $index => $animal): ?>

                        <div class="portfolio-thumb mb-5" data-aos="fade-up">
                            <a href="<?= $animal->src ?>" class="image-popup">
                                <img src="<?= $animal->src ?>" class="img-fluid portfolio-image"
                                     alt="<?= $animal->alt ?>">
                            </a>

                            <div class="portfolio-info">
                                <h4 class="portfolio-title mb-0"><?= ucfirst($animal->name); ?></h4>

                                <p style="color:<?= $animal->color ?>"><?= ucfirst($animal->species) . ', ' . lcfirst($animal->breed); ?></p>
                                <?php if ($animal->sterilized): ?>
                                    <p>Stérilisé</p>
                                <?php else: ?>
                                    <p>Non stérilisé</p>
                                <?php endif; ?>
                            </div>
                        </div>

                    <?php endforeach; ?>
                </div>

                <div class="col-lg-6 col-12">
                    <?php foreach ($rightanimals as $index => $animal): ?>
                        <div class="portfolio-thumb mt-5 mt-lg-0 mb-5" data-aos="fade-up">
                            <a href="<?= $animal->src; ?>" class="image-popup">
                                <img src="<?= $animal->src; ?>" class="img-fluid portfolio-image"
                                     alt="<?= $animal->alt; ?>">
                            </a>

                            <div class="portfolio-info">
                                <h4 class="portfolio-title mb-0"><?= ucfirst($animal->name); ?></h4>

                                <p style="color:<?= $animal->color ?>"><?= ucfirst($animal->species) . ', ' . lcfirst($animal->breed); ?></p>
                                <?php if ($animal->sterilized): ?>
                                    <p>Stérilisé</p>
                                <?php else: ?>
                                    <p>Non stérilisé</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>

            </div>
        </div>
    </section>

    <section class="news section-padding" id="news">
        <div class="container">
            <div class="row">

                <div class="col-12">
                    <h2 class="mb-5 text-center" data-aos="fade-up">Articles</h2>
                </div>
                <?php $firstPost = array_shift($posts);?>
                <div class="col-lg-6 col-12 mb-5 mb-lg-0">
                    <div class="news-thumb" data-aos="fade-up">
                        <a href="news-detail.html" class="news-image-hover news-image-hover-warning">
                            <img src="<?= $firstPost->src; ?>"
                                 class="img-fluid large-news-image news-image" alt="">
                        </a>
                        <div class="news-category bg-warning text-white">News</div>

                        <div class="news-text-info">
                            <h5 class="news-title">
                                <a href="news-detail.html" class="news-title-link"><?= $firstPost->title; ?></a>
                            </h5>
                            <span class="text-muted"><?= $firstPost->published_at; ?></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <?php foreach ($posts as $index => $post): ?>
                    <div class="news-thumb news-two-column d-flex flex-column flex-lg-row" data-aos="fade-up">
                        <div class="news-top w-100">
                            <a href="news-detail.html" class="news-image-hover news-image-hover-primary">
                                <img src="<?= $post->src; ?>"
                                     class="img-fluid news-image" alt="">
                            </a>
                            <div class="news-category bg-primary text-white">Events</div>
                        </div>

                        <div class="news-bottom w-100">
                            <div class="news-text-info">
                                <h5 class="news-title">
                                    <a href="news-detail.html" class="news-title-link"><?= $post->title ?></a>
                                </h5>

                                <div class="d-flex flex-wrap">
                                            <span class="text-muted me-2">
                                                <i class="bi-geo-alt-fill me-1 mb-2 mb-lg-0"></i>
                                                <?= $post->location ?>
                                            </span>

                                    <span class="text-muted"><?= $post->published_at ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>

            </div>
        </div>
    </section>

    <section class=" contact section-padding" id="contact">
        <div class="container">
            <div class="row">

                <div class="col-lg-7 col-12 mx-auto">

                    <h2 class="mb-4 text-center" data-aos="fade-up">Dont' be shy, write to us</h2>

                    <form action="#" method="post" class="contact-form" role="form" data-aos="fade-up">

                        <div class="row">

                            <div class="col-lg-6 col-6">
                                <label for="name" class="form-label">Name <sup class="text-danger">*</sup></label>

                                <input type="text" name="name" id="name" class="form-control" placeholder="Full name"
                                       required>
                            </div>

                            <div class="col-lg-6 col-6">
                                <label for="email" class="form-label">Email <sup class="text-danger">*</sup></label>

                                <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control"
                                       placeholder="Email address" required>
                            </div>

                            <div class="col-12 my-4">
                                <label for="message" class="form-label">How can we help?</label>

                                <textarea name="message" rows="6" class="form-control" id="message"
                                          placeholder="Tell us about the project" required></textarea>

                            </div>

                            <div class="col-12">
                                <label for="services" class="form-label">Services<sup
                                            class="text-danger">*</sup></label>
                            </div>

                            <div class="col-lg-4 col-12">
                                <div class="form-check">
                                    <input type="checkbox" id="checkbox1" name="checkbox1" class="form-check-input">

                                    <label class="form-check-label" for="checkbox1">Branding</label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-12 my-2 my-lg-0">
                                <div class="form-check">
                                    <input type="checkbox" id="checkbox2" name="checkbox2" class="form-check-input">

                                    <label class="form-check-label" for="checkbox2">Digital Experiences</label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-12">
                                <div class="form-check">
                                    <input type="checkbox" id="checkbox3" name="checkbox3" class="form-check-input">

                                    <label class="form-check-label" for="checkbox3">Web Development</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-5 col-12 mx-auto mt-5">
                            <button type="submit" class="form-control">Send Message</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </section>

    <section class="google-map">
        <iframe src="https://maps.google.com/maps?q=Av.+L%C3%BAcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed"
                class="map-iframe" width="100%" height="400" style="border:0;" allowfullscreen=""
                loading="lazy"></iframe>
    </section>

</main>

<footer class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h5 class="text-white">
                    <i class="bi-geo-alt-fill me-2"></i>
                    State of Rio de Janeiro, Brazil
                </h5>

                <a href="mailto:info@company.com" class="custom-link mt-3 mb-5">
                    info@company.com
                </a>
            </div>

            <div class="col-6">
                <p class="copyright-text mb-0">Copyright © <?= $site_name ?> 2021

                    <br><br>Design: <a href="https://templatemo.com/page/1" target="_parent">TemplateMo</a></p>

            </div>

            <div class="col-lg-3 col-5 ms-auto">
                <ul class="social-icon">
                    <li><a href="#" class="social-icon-link bi-facebook"></a></li>

                    <li><a href="#" class="social-icon-link bi-twitter"></a></li>

                    <li><a href="#" class="social-icon-link bi-whatsapp"></a></li>

                    <li><a href="#" class="social-icon-link bi-instagram"></a></li>

                    <li><a href="#" class="social-icon-link bi-youtube"></a></li>
                </ul>
            </div>

        </div>
        </section>
</footer>

<!-- JAVASCRIPT FILES -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>
<script src="js/scrollspy.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>