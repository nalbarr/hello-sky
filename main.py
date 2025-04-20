import ray
import time

@ray.remote
def hello_sky(i):
    return f"hello sky {i}."

ray.init()
for i in range(1,10):
    object_ref = hello_sky.remote(i)
    print(ray.get(object_ref))
    time.sleep(1)
