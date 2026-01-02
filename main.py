import fastapi
import uvicorn

app = fastapi.FastAPI()
@app.get("/")
def read_root():
    return {"Hello": "World"}

def main():
    uvicorn.run(app, host="0.0.0.0", port=8000)

if __name__ == "__main__":
    main()
