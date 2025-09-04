import asyncio
from fastapi import FastAPI, WebSocket

from pydantic_models.chat_body import ChatBody
from services.gemini_service import GeminiService
from services.search_service import SearchService
from services.sort_source_service import SortSourceService


app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
gemini_service = GeminiService()

# chat websocket
@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        
        query = data.get("query")
        

        search_results = search_service.web_search(query)
        
        sorted_results = sort_source_service.sort_sources(query, search_results)
        
        await asyncio.sleep(0.1)
        await websocket.send_json({
            "type": "search_result",
            "data": sorted_results,
        })
        

        for chunk in gemini_service.generate_response(query, sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({
                "type": "content",
                "data": chunk,
            })
    except:
        print("Unexpected error occured")
    finally:
        await websocket.close()

# chat endpoint
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    # search the web and find appropirate info sources
    search_results = search_service.web_search(body.query)

    # sort the sources
    sorted_results = sort_source_service.sort_sources(body.query, search_results)
    
    # generate the response using LLM
    response = gemini_service.generate_response(body.query, sorted_results)
    return response