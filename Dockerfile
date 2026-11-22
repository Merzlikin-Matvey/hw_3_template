FROM python:3.13

WORKDIR /app

COPY app/requirements.txt .
RUN pip install -r requirements.txt

COPY app .

EXPOSE 8000

ENTRYPOINT ["python", "app.py"]