component {

    public any function init() {
        variables.utcBaseDate = createObject( 'java', 'java.util.Date' ).init( javacast( 'int', 0 ) );
        return this;
    }

    public numeric function getUTCTimestamp( required date dateToConvert ) {
        var asDate = parseDateTime( dateToConvert );
        return dateDiff( 's', variables.utcBaseDate, asDate );
    }

    public date function parseUTCTimestamp( required numeric utcTimestamp ) {
        var parsed_date = dateAdd( 's', arguments.utcTimestamp, variables.utcBaseDate );
        return parsed_date;
    }

    public boolean function isInteger( required any varToValidate ) {
        return ( isNumeric( arguments.varToValidate ) && isValid( 'integer', arguments.varToValidate ) );
    }

}
