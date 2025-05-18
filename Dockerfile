FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

# Set up base environment
ENV DEBIAN_FRONTEND=noninteractive

# Install system packages
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev \
    build-essential cmake g++ \
    curl wget git \
    libpq-dev libffi-dev libssl-dev \
    redis-tools \
    gnupg2 ca-certificates lsb-release \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install MongoDB shell
RUN curl -fsSL https://pgp.mongodb.com/server-6.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-6.0.gpg && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | \
    tee /etc/apt/sources.list.d/mongodb-org-6.0.list && \
    apt-get update && apt-get install -y mongodb-mongosh

# Install Python packages
RUN pip3 install --no-cache-dir \
    torch torchvision torchaudio \
    transformers fastapi uvicorn \
    psycopg2-binary redis pymongo \
    numpy pandas scikit-learn

# Install Node.js (for frontend dev)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Set default directory
WORKDIR /workspace

CMD ["tail", "-f", "/dev/null"]
