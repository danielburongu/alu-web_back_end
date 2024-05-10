#!/usr/bin/env python3

import random
import asyncio


async def wait_random(max_delay: int = 10) -> float:
    """
    Asynchronous coroutine that waits for a random delay.
    Returns:
    float: The actual delay time (in seconds).
    """
    # Generate a random delay between 0 and max_delay (inclusive).
    delay = random.uniform(0, max_delay)
    
    # Wait for the random delay using asyncio.sleep.
    await asyncio.sleep(delay)
    return delay
