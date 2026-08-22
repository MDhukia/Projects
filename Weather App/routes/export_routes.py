import pandas as pd

from flask import Blueprint, Response, send_file

from models.weather import WeatherSearch

from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.platypus import (
    SimpleDocTemplate,
    Table,
    TableStyle,
    Paragraph,
    Spacer
)

import io


export_bp = Blueprint("export", __name__)


@export_bp.route("/export/csv")
def export_csv():

    searches = WeatherSearch.query.order_by(
        WeatherSearch.created_at.desc()
    ).all()

    data = []

    for search in searches:

        data.append({
            "Location Input": search.location_input,
            "Location": search.location_name,
            "Latitude": search.latitude,
            "Longitude": search.longitude,
            "Start Date": search.start_date,
            "End Date": search.end_date,
            "Average Temperature (°F)": search.average_temperature,
            "Minimum Temperature (°F)": search.minimum_temperature,
            "Maximum Temperature (°F)": search.maximum_temperature,
            "Created At": search.created_at
        })

    df = pd.DataFrame(data)

    csv_data = df.to_csv(index=False)

    return Response(
        csv_data,
        mimetype="text/csv",
        headers={
            "Content-Disposition":
                "attachment; filename=weather_history.csv"
        }
    )


@export_bp.route("/export/pdf")
def export_pdf():

    searches = WeatherSearch.query.order_by(
        WeatherSearch.created_at.desc()
    ).all()

    buffer = io.BytesIO()

    document = SimpleDocTemplate(
        buffer,
        pagesize=letter
    )

    styles = getSampleStyleSheet()

    elements = []

    title = Paragraph(
        "Weather History Report",
        styles["Title"]
    )

    elements.append(title)

    elements.append(Spacer(1, 20))

    table_data = [
        [
            "Location",
            "Start Date",
            "End Date",
            "Average °F",
            "Minimum °F",
            "Maximum °F"
        ]
    ]

    for search in searches:

        table_data.append([
            search.location_name,
            str(search.start_date),
            str(search.end_date),
            str(search.average_temperature),
            str(search.minimum_temperature),
            str(search.maximum_temperature)
        ])

    table = Table(
        table_data,
        repeatRows=1
    )

    table.setStyle(
        TableStyle([
            ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
            ("TEXTCOLOR", (0, 0), (-1, 0), colors.white),
            ("GRID", (0, 0), (-1, -1), 1, colors.black),
            ("ALIGN", (0, 0), (-1, -1), "CENTER"),
            ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
            ("FONTSIZE", (0, 0), (-1, -1), 8),
            ("BOTTOMPADDING", (0, 0), (-1, 0), 8),
            ("TOPPADDING", (0, 0), (-1, 0), 8)
        ])
    )

    elements.append(table)

    document.build(elements)

    buffer.seek(0)

    return send_file(
        buffer,
        as_attachment=True,
        download_name="weather_history.pdf",
        mimetype="application/pdf"
    )