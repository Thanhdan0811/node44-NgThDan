import express from 'express';


const app = express();

// parse body json
// có thể thay thế với body-parser.
app.use(express.json());

app.get("/", (req, res, next) => {
    console.log("pasre route");
    res.send("Hello first get method");
})

app.get("/test", (req, res) => {
    res.send("test api");
})

// demo get query từ url.
app.get("/test-query", (req, res) => {
    let query = req.query;
    res.send(query);
})

// demo get params từ url.
app.post("/users/:id/*/*", (req, res) => {
    // res.
    let body = req.body;
    let params = req.params;
    res.send(params);
})

// demo get header from request 
app.get("/test-header", (req, res) => {
    let headers = req.headers;
    res.send(headers);
})


app.listen(8080, () => {
    console.log("Server at port: ", 8080);
    
})

