#!/usr/bin/env python3
"""
Module for a Cache class to interact with Redis.
"""
import redis
import uuid
from typing import Union

class Cache:
    """
    Cache class for storing and retrieving data from Redis.
    """
    def __init__(self):
        """
        Initialize the Cache instance with a Redis client and flush the database.
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        Store the input data in Redis using a randomly generated key and return the key.
        
        Args:
            data (Union[str, bytes, int, float]): The data to be stored in Redis.
        
        Returns:
            str: The key under which the data is stored.
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
