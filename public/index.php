<?php

error_reporting(E_ALL);

try {
	/**
     * Define some useful constants
     */
    define('BASE_DIR', dirname(__DIR__));
    define('APP_DIR', BASE_DIR . '/apps');

	/**
	 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
	 */
	$di = new \Phalcon\DI\FactoryDefault();
	
	/**
	 * Read the configuration
	 */
	$config = include APP_DIR . '/config/config.php';
	
	$loader = new \Phalcon\Loader();
	
	/**
	 * We're a registering a set of directories taken from the configuration file
	*/ 
	$loader->registerDirs(
		array(
			$config->application->pluginsDir,
			$config->application->libraryDir,
			$config->application->coreDir,
		)
	)->register();
	/*
	$loader->registerNamespaces(array(
		'MyApp\Core' => $config->application->coreDir,
		'MyApp' => $config->application->libraryDir
	));
	*/
	//echo $config->application->coreDir;
	
	
	/**
	* Setup database for the 1st time to load any setings from database by base classes ( i.e. MyBaseRoute, MyBaseController )
	*/
	
	$di['database'] = function() use ($config){
		$db = new \Phalcon\Db\Adapter\Pdo\Mysql(array(
			"host" => $config->database->host,
			"username" => $config->database->username,
			"password" => $config->database->password,
			"dbname" => $config->database->name
		));
		return $db;
	};
	
	
	/**
	* setup config class to use
	*/
	$di['myconfig'] = function() use($di){
		return new MyBaseConfig($di);
	};
	//$myConfig = new \MyBaseConfig($di);
	
	/**
	 * Registering a router
	 */
	$di['router'] = function() use ($di){

		$router = new \Phalcon\Mvc\Router(false);
		$myroutercfg = $di->getMyconfig()->getRoutesCfg();
		//--- setup all route from database
		while($aroute = $myroutercfg->fetch()){
			$router->add($aroute['route'],array('module'=>$aroute['module'],'controller'=>$aroute['controller'],'action'=>$aroute['action']));
		}
		/*
		$router->add('/admin', array(
			'module' => 'backend',
			'controller' => 'index',
			'action' => 'index'
		));

		$router->add('/index', array(
			'module' => 'frontend',
			'controller' => 'index',
			'action' => 'index'
		));

		$router->add('/', array(
			'module' => 'frontend',
			'controller' => 'index',
			'action' => 'index'
		));
		*/
		return $router;
	};

	/**
	 * The URL component is used to generate all kind of urls in the application
	 */
	$di->set('url', function() {
		$url = new \Phalcon\Mvc\Url();
		$url->setBaseUri('/mvc/multiple-shared-layouts/');
		return $url;
	});

	/**
	 * Start the session the first time some component request the session service
	 */
	$di->set('session', function() {
		$session = new \Phalcon\Session\Adapter\Files();
		$session->start();
		return $session;
	});

	/**
	 * Handle the request
	 */
	$application = new \Phalcon\Mvc\Application();

	$application->setDI($di);

	/**
	 * Register application modules
	 */
	$mymodulescfg = $di->getMyconfig()->getModulesCfg();
	//--- setup all modules from database
	while($amodule = $mymodulescfg->fetch()){
		$modules[$amodule['module']]=array('className'=>$amodule['classname'],'path'=>$amodule['path']);
	}
	$application->registerModules($modules);
	/*
	array(
		'frontend' => array(
			'className' => 'Modules\Frontend\Module',
			'path' => '../apps/frontend/Module.php'
		),
		'backend' => array(
			'className' => 'Modules\Backend\Module',
			'path' => '../apps/backend/Module.php'
		)
	)
	*/

	echo $application->handle()->getContent();

} catch (Phalcon\Exception $e) {
	echo $e->getMessage();
} catch (PDOException $e){
	echo $e->getMessage();
}
