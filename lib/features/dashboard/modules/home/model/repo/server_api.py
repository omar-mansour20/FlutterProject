from gevent.pywsgi import WSGIServer
from flask import Flask, jsonify, request

app = Flask(__name__)

hotels = [
    {"name": "hotel 1", "description": "Description 1", "image_url": "https://example.com/image1.jpg"},
    {"name": "hotel 2", "description": "Description 2", "image_url": "https://example.com/image2.jpg"},
    {"name": "hotel 3", "description": "Description 3", "image_url": "https://example.com/image3.jpg"}
]

# Route to get list of hotels
@app.route('/hotels', methods=['GET'])
def get_hotels(): 
    return jsonify(hotels)

# Route to add a new hotel
@app.route('/add_hotels', methods=['POST'])
def add_hotel():
    data = request.get_json()
    new_hotel = {
        "name": data.get('name'),
        "description": data.get('description'),
        "image_url": data.get('image url')
    }
    hotels.append(new_hotel)
    return jsonify(new_hotel), 201

# Route to get hotel by name
@app.route('/hotels/<hotel_name>', methods=['GET'])
def get_hotel_by_name(hotel_name):
    hotel = next((hotel for hotel in hotels if hotel['name'] == hotel_name), None) 
    if hotel:
        return jsonify(hotel)
    return jsonify({"error": "hotel not found"}), 404

# Route to search hotel by description from header
@app.route('/description', methods=['GET'])
def search_by_description():
    description = request.headers.get('Description')
    if not description:
        return jsonify({"error": "Description not provided in header"}), 408
    search_results = [hotels for hotel in hotels if description.lower() in hotel['description'].lower()]
    return jsonify(search_results)

if __name__ == '__main__':
    http_server = WSGIServer(('localhost', 5008), app)
    http_server.serve_forever()
