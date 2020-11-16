component extends="coldbox.system.testing.BaseTestCase" {

    function beforeAll() {
        super.beforeAll();

        getController().getModuleService().registerAndActivateModule( 'stripecfml', 'testingModuleRoot' );

        getWireBox().autowire( this );
    }

    /**
    * @beforeEach
    */
    function setupIntegrationTest() {
        setup();
    }

}
