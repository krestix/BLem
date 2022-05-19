FROM pypy

WORKDIR /usr/app

COPY ["app.py", "."]

RUN pip install flask

CMD [ "python", "app.py" ] 
