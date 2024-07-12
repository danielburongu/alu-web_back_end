import getResponseFromAPI from './0-promise';

describe('getResponseFromAPI function', () => {
  test('should resolve with "Success"', () => {
    return getResponseFromAPI().then(response => {
      expect(response).toBe('Success');
    });
  });

});
