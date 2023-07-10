from robot.api import logger
import csv


class SeatPosition:

    def __init__(self) -> None:
       self.path = 'data.csv'

    def result_should_be(self, expect):
        with open(self.path, 'r') as file:
            reader = csv.reader(file)
            first_line = next(reader)
            content = first_line[1]
            if content != expect:
                raise AssertionError(f"{content} != {expect}")


if __name__ == '__main__':
    v = SeatPosition()
    v.result_should_be('02 01 00 00 00 00 00 00')
        
            
        

    
