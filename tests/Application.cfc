component {

    rootPath = getDirectoryFromPath( getCurrentTemplatePath() )
        .replace( '\', '/', 'all' )
        .replaceNoCase( 'tests/', '' );

    this.mappings[ '/tests' ] = rootPath & '/tests';
    this.mappings[ '/lib' ] = rootPath & '/lib';

    public boolean function onRequestStart( String targetPage ) {
        setting requestTimeout="9999";
        return true;
    }

}
