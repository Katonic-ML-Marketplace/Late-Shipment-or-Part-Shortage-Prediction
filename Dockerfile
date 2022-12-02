FROM python:3.8.2-slim

RUN mkdir -p data model images

COPY app.py .
COPY data/late_shipment_data.csv data/.
COPY model/finalized_model.sav model/.
COPY images/logo.png images/.
COPY images/favicon.ico images/.
COPY requirements.txt .

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error --server.fileWatcherType=none
