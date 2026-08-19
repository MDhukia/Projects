from services.weather_service import get_current_weather


latitude = 37.77493
longitude = -122.41942

weather = get_current_weather(latitude, longitude)

print(weather)