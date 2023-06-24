FROM registry.access.redhat.com/ubi8/python-39:latest

COPY requirements.txt ./requirements.txt
COPY data data/
COPY models models/
COPY notebooks notebooks/
COPY experiments experiments/
COPY config config
COPY lib lib/

RUN pip install -r requirements.txt

COPY wsgi.py ./wsgi.py
COPY prediction.py ./prediction.py

USER 1001
EXPOSE 8080

CMD ["python3", "wsgi.py", "8080"]


