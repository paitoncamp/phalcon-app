<?php
//namespace MyApp\Core;
use Phalcon\Events\EventsAwareInterface;



class MyBaseConfig implements EventsAwareInterface {

	protected $_eventsManager;
	protected $_di;
	
	
	public function __construct($di){
		$this->_di = $di;
	}

    public function setEventsManager($eventsManager)
    {
        $this->_eventsManager = $eventsManager;
    }

    public function getEventsManager()
    {
        return $this->_eventsManager;
    }

    public function someTask()
    {
        $this->_eventsManager->fire("my-component:beforeSomeTask", $this);

        // do some task

        $this->_eventsManager->fire("my-component:afterSomeTask", $this);
    }
	
	public function getRoutesCfg(){
		$connection = $this->_di->getDatabase();
		$sql = "select route,module,controller,action from routes where status=1";
		$result = $connection->query($sql);
		return $result;
	}
	
	public function getModulesCfg(){
		$connection = $this->_di->getDatabase();
		$sql = "select module,classname,path from modules where status=1";
		$result = $connection->query($sql);
		return $result;
	}

}