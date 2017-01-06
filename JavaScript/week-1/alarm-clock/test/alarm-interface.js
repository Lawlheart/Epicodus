var chai = require('chai');
var chaiHttp = require('chai-http');
var server = "http://localhost:3000";

chai.use(chaiHttp);
var should = chai.should();

describe('Testing test', function() {
  // it('should work', function(done) {
  //   chai.request(server).get('/').end(function(err, res) {
  //     expect(err).to.be.null;
  //     done();
  //   })
  // })
});
