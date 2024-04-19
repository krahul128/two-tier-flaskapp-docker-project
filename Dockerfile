# get a base image of python because it runs on Python
FROM python:3.9-slim

#your working directory
WORKDIR /app

RUN apt-get update -y \
   && apt-get upgrade -y \
   && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*
         

    
COPY requirements.txt .

#install all the required dependencies
RUN pip install mysqlclient
RUN pip install -r requirements.txt


COPY . .
#run the python app
CMD ["python", "app.py"]
