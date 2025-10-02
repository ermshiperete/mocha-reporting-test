import 'mocha';
import { assert } from 'chai';

describe('top level suite', function () {
  // this.timeout(5000);
  describe("example", () => {
    it("2 + 2", () => {
      assert.equal(2 + 2, 4);
    });
    it.skip("20 + 2", () => {
      assert.equal(20 + 2, 22);
    });
    it("4 + 2", () => {
      assert.equal(4 + 2, 4); // failure
    });
    it("3 + 3", () => {
      assert.equal(3 + 3, 6);
    });
  });
});

// expected nesting:
// unit_tests
//   top level suite
//     example
//       2 + 2
//       20 + 2 (skipped)
//       4 + 2 (failed)
//       3 + 3
