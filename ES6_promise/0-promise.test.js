import getResponseFromAPI from './0-promise';

describe('getResponseFromAPI function', () => {
  test('should return a resolved promise with "Success"', () => {
    return expect(getResponseFromAPI()).resolves.toBe('Success');
  });

  test('should return a promise', () => {
    const response = getResponseFromAPI();
    expect(response).toBeInstanceOf(Promise);
  });

  test('should handle async behavior using resolves', async () => {
    await expect(getResponseFromAPI()).resolves.toBe('Success');
  });

  test('should handle async behavior using async/await', async () => {
    const response = await getResponseFromAPI();
    expect(response).toBe('Success');
  });

  test('should not throw an error', async () => {
    await expect(getResponseFromAPI()).resolves.not.toThrow();
  });

  test('should handle rejected promise with error message', async () => {
    const errorMessage = 'API request failed';
    const getErrorResponse = () => new Promise((resolve, reject) => {
      reject(new Error(errorMessage));
    });

    await expect(getErrorResponse()).rejects.toThrowError(errorMessage);
  });

  test('should handle long-running promise correctly', async () => {
    const longRunningPromise = new Promise((resolve) => {
      setTimeout(() => {
        resolve('Delayed Success');
      }, 1000);
    });

    await expect(longRunningPromise).resolves.toBe('Delayed Success');
  });


});
