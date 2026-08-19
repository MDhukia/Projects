from datetime import datetime
from database import db


class WeatherSearch(db.Model):

    id = db.Column(db.Integer, primary_key=True)

    location_input = db.Column(db.String(200), nullable=False)

    location_name = db.Column(db.String(200), nullable=False)

    latitude = db.Column(db.Float, nullable=False)

    longitude = db.Column(db.Float, nullable=False)

    start_date = db.Column(db.Date, nullable=False)

    end_date = db.Column(db.Date, nullable=False)

    average_temperature = db.Column(db.Float)

    minimum_temperature = db.Column(db.Float)

    maximum_temperature = db.Column(db.Float)

    created_at = db.Column(
        db.DateTime,
        default=datetime.utcnow
    )

    updated_at = db.Column(
        db.DateTime,
        default=datetime.utcnow,
        onupdate=datetime.utcnow
    )