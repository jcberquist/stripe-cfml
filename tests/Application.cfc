component {

	this.mappings[ '/stripe' ] = getDirectoryFromPath( getCurrentTemplatePath() ) & '../';

	public void function onRequestStart() {
		// test stripe secret key
		param name="form.stripeTESTSecretKey" default="";
		request.apiKey = form.stripeTESTSecretKey;
	}

}