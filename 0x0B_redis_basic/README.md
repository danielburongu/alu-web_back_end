# Redis Cache Project

## Description
This project implements a simple cache system using Redis in Python. It includes a `Cache` class with methods to store data in Redis and retrieve it using a randomly generated key. 

## Requirements
- All files will be interpreted/compiled on Ubuntu 18.04 LTS using python3 (version 3.7)
- All files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- The first line of all files should be exactly `#!/usr/bin/env python3`
- The code should use the pycodestyle style (version 2.5)
- All modules should have documentation
- All classes should have documentation
- All functions and methods should have documentation
- All functions and coroutines must be type-annotated

## Installation
1. Ensure you have Python 3.7 and Redis installed.
2. Install the Redis-py library: `pip install redis`

## Usage
```python
#!/usr/bin/env python3
"""
Main file
"""
import redis

Cache = __import__('exercise').Cache

cache = Cache()

data = b"hello"
key = cache.store(data)
print(key)

local_redis = redis.Redis()
print(local_redis.get(key))
