#!/bin/bash

echo "🔍 Python version:"
python3 --version

echo "📦 Pip packages:"
pip list | grep -E 'torch|transformers|fastapi|psycopg2|redis|pymongo'

echo "💡 GPU Test (Torch CUDA):"
python3 -c "import torch; print('CUDA Available:', torch.cuda.is_available())"

echo "🛠  G++ version (C++ Compiler):"
g++ --version

echo "🧪 C++ Compilation Test:"
echo '#include <iostream>
int main() { std::cout << "C++ is working.\n"; return 0; }' > test.cpp
g++ test.cpp -o test_cpp_out && ./test_cpp_out

echo "🔗 PostgreSQL Client Version:"
pg_config --version

echo "🔗 Redis CLI Version:"
redis-cli --version

echo "🔗 MongoDB CLI Version:"
mongosh --version || echo "mongosh not installed (but pymongo works)"

echo "🌐 Node.js & npm:"
node -v && npm -v

echo "✅ Everything looks installed if no errors above."
