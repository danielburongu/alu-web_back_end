export default function getResponseFromAPI() {
  return new Promise((resolve, reject) => {
    // Simulate fetching data from an API (e.g., using setTimeout)
    setTimeout(() => {
      const data = { message: "Data fetched from API" };
      resolve(data); // Resolve with fetched data
    }, 1000); // Simulate delay of 1 second
  });
}
