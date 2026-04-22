FROM python:3.11-slim

WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# 复制项目文件
COPY requirements.txt .
COPY run.py .
COPY backend/ ./backend/
COPY config/ ./config/
COPY dashboard/ ./dashboard/

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt

# 创建数据目录
RUN mkdir -p data

# 暴露端口
EXPOSE 8788

# 启动命令
CMD ["python", "run.py", "--port", "8788"]
