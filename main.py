import ray
import time

@ray.remote
def hello_sky(i):
    return f"hello sky {i}."

ray.init()
for i in range(1,25):
    print(ray.get(hello_sky(remote(i)))
    time.sleep(1)
