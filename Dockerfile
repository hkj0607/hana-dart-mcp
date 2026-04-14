FROM python:3.12-slim

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN pip install --no-cache-dir uv && uv sync --frozen

COPY dart.py dart_taxonomy.json ./

ENV DART_API_KEY=""
ENV USECASE="light"

ENTRYPOINT ["uv", "run", "python", "dart.py"]
