<?PHP

class API_Config {

	// Replace this value with your TokBox API Partner Key
	var $API_KEY = "";

	// Replace this value with your TokBox API Partner Secret
	var $API_SECRET = "";

	const API_SERVER = "https://staging.tokbox.com/hl";
	// Uncomment this line when you launch your app
	// const API_SERVER = "https://api.opentok.com/hl";

    const TOKEN_SENTINEL = "T1==";

	const SDK_VERSION = "tbphp-0.90.0";
	
	
	public function API_Config(){
		
		TuiyoLoader::helper("parameter");
		$globalCfg = TuiyoParameter::load("global");

		$this->API_KEY 		= $globalCfg->get("opentokAPIKey", null);
		$this->API_SECRET 	= $globalCfg->get("opentokAPISecret", null);
		
	}

}
