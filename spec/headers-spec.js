/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const {
  assert
} = require('chai');
const headers = require('../src/headers');
const types = require('leadconduit-types');


describe('Headers', function() {

  it('should remove header with empty value', () => assert.deepEqual(headers({Foo: 'bar', Baz: ''}), {Foo: 'bar'}));


  it('should remove header with whitespace value', () => assert.deepEqual(headers({Foo: 'bar', Baz: ' '}), {Foo: 'bar'}));


  it('should join header with array value', () => assert.deepEqual(headers({Foo: ['bar', 'baz']}), {Foo: 'bar, baz'}));


  return it('should normalize header with richly typed value', function() {
    assert.deepEqual(headers({Foo: types.number.parse('10')}), {Foo: '10'});
    return assert.deepEqual(headers({Foo: types.phone.parse('512-789-1111')}), {Foo: '5127891111'});
  });
});
