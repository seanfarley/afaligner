FROM python:3.9-slim

RUN apt update -q \
    && apt install --no-install-recommends -yq espeak \
    libespeak-dev \
    ffmpeg
RUN apt install -yq gcc

WORKDIR /afaligner
COPY src src
COPY tests tests
COPY requirements requirements
COPY LICENSE MANIFEST.in README.md setup.py ./

RUN pip install $(grep numpy requirements/base.txt)
RUN pip install .

WORKDIR /
ENTRYPOINT []
CMD ["bash"]
