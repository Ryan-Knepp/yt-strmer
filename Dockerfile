FROM python:3.9

ENV AM_I_IN_A_DOCKER_CONTAINER Yes
ENV DOCKER_PORT 5005

RUN mkdir /code
WORKDIR /code

RUN apt-get update && \
apt-get install -y ffmpeg && \
apt-get clean

COPY . /code
RUN pip install --no-cache-dir --upgrade -r requierments.txt

EXPOSE 5000

CMD ["python", "main.py"]