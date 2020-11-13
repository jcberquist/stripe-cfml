component {

    rootPath = getDirectoryFromPath( getCurrentTemplatePath() )
        .replace( '\', '/', 'all' )
        .replaceNoCase( 'tests/', '' );

    this.mappings[ '/testbox' ] = rootPath & '/testbox';
    this.mappings[ '/tests' ] = rootPath & '/tests';
    this.mappings[ '/lib' ] = rootPath & '/lib';

    public boolean function onRequestStart( String targetPage ) {
        setting requestTimeout="9999";
        return true;
    }

}
