component {

    this.name = 'stripe-cfml-testing-suite-' & hash( getCurrentTemplatePath() );
    this.sessionManagement = true;
    this.setClientCookies = true;
    this.sessionTimeout = createTimespan( 0, 0, 15, 0 );
    this.applicationTimeout = createTimespan( 0, 0, 15, 0 );

    testsPath = getDirectoryFromPath( getCurrentTemplatePath() );
    this.mappings[ '/tests' ] = testsPath;
    rootPath = reReplaceNoCase( this.mappings[ '/tests' ], 'tests(\\|/)', '' );
    this.mappings[ '/root' ] = rootPath;
    this.mappings[ '/testingModuleRoot' ] = listDeleteAt( rootPath, listLen( rootPath, '\/' ), '\/' );
    this.mappings[ '/stripecfml' ] = listDeleteAt( rootPath, listLen( rootPath, '\/' ), '\/' );
    this.mappings[ '/lib' ] = rootPath & '/lib';
    this.mappings[ '/app' ] = testsPath & 'resources/app';
    this.mappings[ '/coldbox' ] = testsPath & 'resources/app/coldbox';
    this.mappings[ '/testbox' ] = rootPath & '/testbox';


    function onRequestStart() {
        setting requestTimeout="9999";
        structDelete( application, 'cbController' );
        structDelete( application, 'wirebox' );
        return true;
    }

}

