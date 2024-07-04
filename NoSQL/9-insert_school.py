#!/usr/bin/env python3
"""python script"""


def insert_school(mongo_collection, **kwargs):
    """inserts a new document in the collection"""
    mongo_collection.insert_one(kwargs)
