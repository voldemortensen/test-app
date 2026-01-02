FROM python:3.12-slim-trixie

ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && \
    sh /uv-installer.sh && rm /uv-installer.sh

ENV PATH="/root/.local/bin/:$PATH"

WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen
COPY . .

CMD ["uv", "run", "python", "main.py"]

