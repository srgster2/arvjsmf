FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /data

ENV PORT=8000
ENV DATA_DIR=/data

CMD sh -c "uvicorn main:app --host 0.0.0.0 --port ${PORT}"
