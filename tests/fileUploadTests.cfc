component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( apiKey = request.apiKey, includeRaw = true );

	}

	public void function testUploadFile() {

		var result = stripe.createFileUpload( file = expandPath( '/stripe/tests/test.png' ),  purpose = 'identity_document' );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testGetFileUpload() {

		var fileupload = stripe.createFileUpload( file = expandPath( '/stripe/tests/test.png' ),  purpose = 'identity_document' );
		var result = stripe.getFileUpload( fileupload.id );

		debug( fileupload );
		debug( result );

		assertEquals( 200, fileupload.status_code, "expected a 200 status" );
		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testListFileUploads() {

		var result = stripe.listFileUploads();

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

}