from flask import Blueprint, render_template, request

from models.weather import WeatherSearch
from database import db

from services.location_service import search_location
from services.weather_service import get_current_weather


weather_bp = Blueprint("weather", __name__)


@weather_bp.route("/")
def home():
    return render_template("index.html")


@weather_bp.route("/history")
def history():

    searches = WeatherSearch.query.order_by(
        WeatherSearch.created_at.desc()
    ).all()

    return render_template(
        "history.html",
        searches=searches
    )

@weather_bp.route("/view/<int:search_id>")
def view_weather(search_id):

    search = WeatherSearch.query.get_or_404(search_id)

    return render_template(
        "view.html",
        search=search
    )

@weather_bp.route("/edit/<int:search_id>", methods=["GET", "POST"])
def edit_weather(search_id):

    search = WeatherSearch.query.get_or_404(search_id)

    if request.method == "POST":

        search.location_input = request.form["location"]

        search.average_temperature = float(
            request.form["average_temperature"]
        )

        search.minimum_temperature = float(
            request.form["minimum_temperature"]
        )

        search.maximum_temperature = float(
            request.form["maximum_temperature"]
        )

        db.session.commit()

        return render_template(
            "view.html",
            search=search
        )

    return render_template(
        "edit.html",
        search=search
    )


@weather_bp.route("/delete/<int:search_id>", methods=["POST"])
def delete_weather(search_id):

    search = WeatherSearch.query.get_or_404(search_id)

    db.session.delete(search)
    db.session.commit()

    return render_template(
        "history.html",
        searches=WeatherSearch.query.order_by(
            WeatherSearch.created_at.desc()
        ).all()
    )

@weather_bp.route("/weather")
def get_weather():

    location = request.args.get("location")
    start_date = request.args.get("start_date")
    end_date = request.args.get("end_date")

    # Check location
    if not location:
        return render_template(
            "index.html",
            error="Please enter a location"
        )

    # Check dates
    if not start_date or not end_date:
        return render_template(
            "index.html",
            error="Please select both start and end dates."
        )

    # Check date order
    if start_date > end_date:
        return render_template(
            "index.html",
            error="Start date cannot be after end date."
        )

    # Find location
    location_data = search_location(location)

    if location_data is None:
        return render_template(
            "index.html",
            error="Location not found"
        )

    # Get weather
    weather_data = get_current_weather(
    location_data["latitude"],
    location_data["longitude"],
    start_date,
    end_date
)

    if weather_data is None:
        return render_template(
            "index.html",
            error="Unable to retrieve weather data. Please try again later."
    )

    # Save weather search to database
    weather_search = WeatherSearch(
        location_input=location,
        location_name=location_data["name"],
        latitude=location_data["latitude"],
        longitude=location_data["longitude"],
        start_date=__import__("datetime").datetime.strptime(
            start_date, "%Y-%m-%d"
        ).date(),
        end_date=__import__("datetime").datetime.strptime(
            end_date, "%Y-%m-%d"
        ).date(),
        average_temperature=weather_data["average_temperature"],
        minimum_temperature=weather_data["minimum_temperature"],
        maximum_temperature=weather_data["maximum_temperature"]
    )

    db.session.add(weather_search)
    db.session.commit()

    return render_template(
    "index.html",
        location=location_data,
        weather=weather_data,
        start_date=start_date,
        end_date=end_date
    )