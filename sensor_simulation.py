import random
import time

def simulate_sensor_data():
    while True:
        temperature = round(random.uniform(20.0, 25.0), 2)
        humidity = round(random.uniform(30.0, 50.0), 2)
        print(f"Temperature: {temperature} °C, Humidity: {humidity} %")
        time.sleep(2)  # شبیه‌سازی جمع‌آوری داده هر 2 ثانیه

if __name__ == "__main__":
    simulate_sensor_data()
