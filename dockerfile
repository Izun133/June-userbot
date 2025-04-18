FROM python:3.11
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get install -y git wget ffmpeg mediainfo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN python -m venv --copies /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "main.py"]