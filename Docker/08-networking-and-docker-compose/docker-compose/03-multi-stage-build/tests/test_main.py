import unittest
from app.main import main

class TestMain(unittest.TestCase):
    def test_main_runs(self):
        # just test that main runs without error
        main()

if __name__ == "__main__":
    unittest.main()

