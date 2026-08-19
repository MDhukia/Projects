# will take what the user types and sending it to the Open-Meteo Geocoding API.
import requests


def search_location(location_input):
    url = "https://geocoding-api.open-meteo.com/v1/search"

    params = {
        "name": location_input,
        "count": 1,
        "language": "en",
        "format": "json"
    }

    response = requests.get(url, params=params)

    response.raise_for_status()

    data = response.json()

    if "results" not in data or not data["results"]:
        return None

    location = data["results"][0]

    return {
        "name": location["name"],
        "latitude": location["latitude"],
        "longitude": location["longitude"],
        "country": location.get("country")
    }