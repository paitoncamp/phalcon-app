<?php

return new \Phalcon\Config(array(
	'database' => array(
		'adapter'  => 'Mysql',
		'host'     => 'localhost',
		'username' => 'root',
		'password' => '',
		'name'     => 'phalcon-app'
	),
	'application' => array(
		'coreDir' => APP_DIR . '/core/',
		'pluginsDir' => APP_DIR . '/plugins/',
		'libraryDir' => APP_DIR . '/library/'
	)
));
