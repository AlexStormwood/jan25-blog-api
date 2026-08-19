

/*
app.get("/", (request, response) => {
    response.json({
        message:"Welcome to the Blog API!"
    });
});

*/

const supertest = require("supertest")
const { app } = require("../src/server")
const { dbConnect, dbDisconnect } = require("../src/utils/databaseConnectionManager")

const DATABASE_URI = `mongodb://localhost:27017/${process.env.npm_package_name}-${process.env.NODE_ENV.toLowerCase()}`;


beforeEach(async () => {
    process.env.DATABASE_URL = DATABASE_URI;
    await dbConnect()
})

afterEach(async () => {
    await dbDisconnect();
})

describe("Basic server routes", () => {
    test("Server home page", async () => {
        let response = await supertest(app).get("/");

        expect(response.body.message).toBe("Welcome to the Blog API!");
    })
})