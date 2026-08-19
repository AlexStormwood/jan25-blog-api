

/*
app.get("/", (request, response) => {
    response.json({
        message:"Welcome to the Blog API!"
    });
});

*/

const supertest = require("supertest")
const { app } = require("../src/server")

describe("Basic server routes", () => {
    test("Server home page", async () => {
        let response = await supertest(app).get("/");

        expect(response.body.message).toBe("Welcome to the Blog API!");
    })
})