(function(QUnit) {

    QUnit.init();
    QUnit.config.blocking = false;
    QUnit.config.autorun = true;
    QUnit.config.updateRate = 0;

    var assertions,
        result = { 
            pass: 0,
            fail: 0,
            pass_asserions: 0,
            fail_asserions: 0,
            assertions: {},
            tests: 0
        };

    QUnit.testDone(function (r) {
        if (r.failed > 0) {
            result.fail += 1;
            result.assertions[(r.module ? r.module + ':' : '') + r.name] = assertions;
            assertions = null;
        } else {
            result.pass += 1;
        }
        result.fail_asserions += r.failed;
        result.pass_asserions += r.passed;
        result.tests++;
    });

    QUnit.log(function (r) {
        if (!r.result) {
            assertions = [r.message, r.actual, r.expected];
        }
    });

    QUnit.result = function () {
        // run the tests
        // QUnit.begin();
        // QUnit.start();
        return result;
    };

}( this.QUnit ));
