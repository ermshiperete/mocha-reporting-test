import 'mocha';
import { assert } from 'chai';

describe('top level suite', () => {
  this.timeout(5000);
  describe("example", () => {
    it("2 + 2", () => {
      assert.equal(2 + 2, 4);
    });
  });
});
