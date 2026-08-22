from flask import Flask

from database import db


app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///weather.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db.init_app(app)


from models.weather import WeatherSearch
from routes.weather_routes import weather_bp
from routes.export_routes import export_bp


app.register_blueprint(weather_bp)
app.register_blueprint(export_bp)


with app.app_context():
    db.create_all()


if __name__ == "__main__":
    app.run(debug=True)