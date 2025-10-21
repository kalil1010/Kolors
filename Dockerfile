# Use Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Install the kolors package itself
RUN pip install .

# Set PYTHONPATH to ensure imports work
ENV PYTHONPATH="${PYTHONPATH}:/app"

# Default command (can be overridden by Railway)
CMD ["python", "scripts/sampleui.py"]
