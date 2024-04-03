import RPi.GPIO as GPIO
import importlib.util
import sys

# Suppress GPIO warnings
GPIO.setwarnings(False)

def test_update_leds(update_leds_func):
    try:
        # Set up GPIO using board numbering scheme
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(15, GPIO.OUT)
        GPIO.setup(12, GPIO.OUT)
        GPIO.setup(3, GPIO.OUT)
        GPIO.setup(5, GPIO.OUT)

        # Call the user's function to update LEDs
        update_leds_func()

        # Check the status of the LEDs and perform assertions
        assert GPIO.input(15) == 0, "LED1 should be turned off"
        assert GPIO.input(3) == 0, "LED3 should be turned off"
        assert GPIO.input(12) == 1, "LED2 should be turned on"
        assert GPIO.input(5) == 1, "LED4 should be turned on"

        # Print test result
        print("Test Passed!")

    except KeyboardInterrupt:
        print("\nTest interrupted by user.")
    finally:
        # Clean up GPIO
        GPIO.cleanup()

def import_user_solution(solution_file):
    spec = importlib.util.spec_from_file_location("solution", solution_file)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.update_leds

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 test.py solution.py")
        sys.exit(1)

    solution_file = sys.argv[1]

    # Import the user's solution
    update_leds_func = import_user_solution(solution_file)

    # Run the test case
    test_update_leds(update_leds_func)

