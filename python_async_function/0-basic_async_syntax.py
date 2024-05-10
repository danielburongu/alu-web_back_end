#!/usr/bin/env python3

import random
import asyncio

async def wait_random(max_delay: int = 10) -> float:
    """
    Asynchronous coroutine that waits for a random delay between 0 and max_delay seconds.

    Parameters:
    max_delay (int): The maximum delay time (in seconds) to wait. Default is 10 seconds.

    Returns:
    float: The actual delay time (in seconds).
    """
    # Generate a random delay between 0 and max_delay (inclusive).
    delay = random.uniform(0, max_delay)
    
    # Wait for the random delay using asyncio.sleep.
    await asyncio.sleep(delay)
    
    # Return the delay time.
    return delay
