<?php

require __DIR__.'/vendor/autoload.php';

use Symfony\Component\Console\Application;
use App\Command\MyCommand;

$application = new Application();

$application->add(new MyCommand());

$application->run();