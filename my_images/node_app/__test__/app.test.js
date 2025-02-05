const request = require('supertest');
const app = require('../src/app'); // Import the Express app

describe('GET /', () => {
  it('should return HTML with "Hola Mundo" in the body', async () => {
    const response = await request(app).get('/'); // Make a GET request to /

    // Check if the response status is OK (200)
    expect(response.status).toBe(200);

    // Check if the HTML contains "Hola Mundo"
    expect(response.text).toContain('<h1>Hola Mundo</h1>');
  });
});
