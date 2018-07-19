<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../src/config/db.php';

$app = new \Slim\App;

// Client Routes
require '../src/routes/client.php';
require '../src/routes/nana.php';
require '../src/routes/service.php';
require '../src/routes/comments.php';

$app->run();