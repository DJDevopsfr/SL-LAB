from .utils import add

def main():
    print("Running main.py")
    result = add(2, 3)
    print(f"2 + 3 = {result}")

#Run this code only when this file is executed directly, not when it is imported as a module
if __name__ == "__main__":
    main()
    # keep container alive for inspection
    import time
    while True:
        time.sleep(60)
