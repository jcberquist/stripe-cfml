component extends=testbox.system.BaseSpec {

    function beforeAll() {
        var config = new lib.config();
        argumentParser = new lib.parsers.arguments( config );
        makePublic( argumentParser, 'flatten' );
        makePublic( argumentParser, 'parseSimpleValue' );
    }

    function run() {
        describe( 'The flatten() method', function() {
            it( 'serializes strings', function() {
                var out = argumentParser.flatten( {
                    a: 'b'
                } );
                expect( out ).toBe( [
                    {
                        name: 'a',
                        value: 'b'
                    }
                ] );
            } );

            it( 'serializes integers', function() {
                var out = argumentParser.flatten( {
                    a: 1
                } );
                expect( out ).toBe( [
                    {
                        name: 'a',
                        value: '1'
                    }
                ] );
            } );

            it( 'serializes booleans', function() {
                var out = argumentParser.flatten( {
                    a: true
                } );
                expect( out ).toBe( [
                    {
                        name: 'a',
                        value: 'true'
                    }
                ] );
            } );

            it( 'serializes structs', function() {
                var out = argumentParser.flatten( {
                    a: {
                        b: 1,
                        c: 'd'
                    }
                } );
                var expected = [
                    {
                        name: 'a[b]',
                        value: '1'
                    },
                    {
                        name: 'a[c]',
                        value: 'd'
                    }
                ];
                expect( out ).toBe( expected );
            } );

            it( 'ignores empty structs', function() {
                var out = argumentParser.flatten( {
                    a: { }
                } );
                expect( out ).toBeEmpty();
            } );

            it( 'serializes simple value arrays', function() {
                var out = argumentParser.flatten( {
                    a: [ 'b', 'c' ]
                } );
                var expected = [
                    {
                        name: 'a[0]',
                        value: 'b'
                    },
                    {
                        name: 'a[1]',
                        value: 'c'
                    }
                ];
                expect( out ).toBe( expected );
            } );

            it( 'serializes arrays of structs', function() {
                var out = argumentParser.flatten( {
                    a: [
                        {
                            b: 1
                        },
                        {
                            b: 2
                        }
                    ]
                } );
                var expected = [
                    {
                        name: 'a[0][b]',
                        value: '1'
                    },
                    {
                        name: 'a[1][b]',
                        value: '2'
                    }
                ];
                expect( out ).toBe( expected );
            } );
        } );

        describe( 'The parseSimpleValue() method', function() {
            it( 'converts cfml dates to unix timestamps', function() {
                var datetime = now();
                datetime.setTime( javacast( 'long', '1521518884000' ) );
                var parsed = argumentParser.parseSimpleValue( datetime, 'timestamp' );
                expect( parsed ).toBe( 1521518884 );
            } );

            it( 'converts strings that can be interpreted as dates to unix timestamps', function() {
                var datetime = '2018-03-01T12:00:00Z';
                var parsed = argumentParser.parseSimpleValue( datetime, 'timestamp' );
                expect( parsed ).toBe( 1519905600 );
            } );
        } );
    }

}
