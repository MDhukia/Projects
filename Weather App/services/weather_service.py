import requests


def get_current_weather(latitude, longitude, start_date, end_date):

    url = "https://api.open-meteo.com/v1/forecast"

    params = {
        "latitude": latitude,
        "longitude": longitude,
        "start_date": start_date,
        "end_date": end_date,
        "daily": "temperature_2m_max,temperature_2m_min",
        "current": "temperature_2m,relative_humidity_2m,wind_speed_10m",
        "temperature_unit": "fahrenheit",
        "wind_speed_unit": "mph",
        "timezone": "auto"
    }

    try:

        response = requests.get(
            url,
            params=params,
            timeout=10
    )

        response.raise_for_status()

        data = response.json()

    except requests.exceptions.RequestException as e:

        print("Weather API error:", e)

        return None

    current = data["current"]
    daily = data["daily"]
    daily_dates = daily["time"]

    maximum_temperatures = daily["temperature_2m_max"]
    minimum_temperatures = daily["temperature_2m_min"]

    # Remove missing values
    valid_maximums = [
        temp for temp in maximum_temperatures
        if temp is not None
    ]

    valid_minimums = [
        temp for temp in minimum_temperatures
        if temp is not None
    ]

    maximum_temperature = max(valid_maximums)

    minimum_temperature = min(valid_minimums)

    average_temperature = (
        sum(valid_maximums) + sum(valid_minimums)
    ) / (
        len(valid_maximums) + len(valid_minimums)
    )

    return {
        "temperature": current["temperature_2m"],
        "humidity": current["relative_humidity_2m"],
        "wind_speed": current["wind_speed_10m"],
        "average_temperature": average_temperature,
        "minimum_temperature": minimum_temperature,
        "maximum_temperature": maximum_temperature,
        "daily_dates": daily_dates,
        "daily_maximums": maximum_temperatures,
        "daily_minimums": minimum_temperatures
    }