FROM python:3.11-slim AS builder
WORKDIR /usr/src/app

# Install dependencies and pytest
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --upgrade pytest

# Copy source code and tests
COPY app ./app
COPY tests ./tests

# Remove any old .pyc files
RUN find . -name "*.pyc" -delete

# Set PYTHONPATH so tests can import "app"
ENV PYTHONPATH=/usr/src/app

# Run tests
RUN pytest tests/ --disable-warnings


# Stage 2: Production image
FROM python:3.11-slim AS production
WORKDIR /usr/src/app

# Copy only the app from builder stage
COPY --from=TODO /usr/src/app/app ./app
COPY requirements.txt ./

# Install only runtime dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Default command to run the app
CMD ["python", "-m", "app.main"]
