FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /app

RUN addgroup --system  Newgroup &&\
    adduser --system --ingroup Newgroup newuser

RUN chown -R newuser:Newgroup /app

USER newuser

EXPOSE 8000

ENTRYPOINT [ "python","manage.py" ]

CMD ["runserver","0.0.0.0:8000"]
