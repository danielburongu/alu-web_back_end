import getResponseFromAPI from './0-promise';

describe('getResponseFromAPI function', () => {
  test('should resolve with "Success"', () => {
    return expect(getResponseFromAPI()).resolves.toBe('Success');
  });

  test('should handle API failure scenario', () => {
    // Example: Simulate an API failure by rejecting the Promise
    // This test expects the Promise to reject with an error message or similar
    return expect(getResponseFromAPI()).rejects.toThrow('Error'); // Update with your specific error expectation
  });


  test('should handle another success scenario', () => {
    // Example: Test another successful API response
    return expect(getResponseFromAPI()).resolves.toBe('AnotherSuccess');
  });

});
