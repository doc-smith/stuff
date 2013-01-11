#!/usr/bin/env python

import copy
import random


class DoorSet:
    def __init__(self):
        self.doors = range(1, 4)

    def random_door(self):
        return random.choice(self.doors)

    def another_door(self, a, b):
        for d in self.doors:
            if d != a and d != b:
                return d


class Doors:
    def __init__(self):
        self.doors = DoorSet()
        self.car_door = self.doors.random_door()

    def monty_says(self):
        self.goat_door = self.doors.another_door(
                self.car_door, self.chosen_door)
        return self.goat_door

    def check_door(self):
        return self.car_door == self.chosen_door

    def check_another_door(self):
        return self.doors.another_door(
                self.chosen_door, self.goat_door) == self.car_door

    def choose_random_door(self):
        self.chosen_door = self.doors.random_door()
        return self.chosen_door


def game(change_strategy):
    doors = Doors()
    chosen = doors.choose_random_door()
    goat_door = doors.monty_says()
    if change_strategy:
        return doors.check_another_door()
    else:
        return doors.check_door()


def check_strategy(n, change_strategy):
    print "change strategy: {0}".format(change_strategy)
    print "n: {0}".format(n)
    win_count = 0
    for i in xrange(0, n):
        if game(change_strategy):
            win_count += 1
    print "result: {0}".format(float(win_count) / n)


def main():
    check_strategy(100, False)
    check_strategy(1000, False)
    check_strategy(10000, False)
    check_strategy(1000000, False)
    check_strategy(100, True)
    check_strategy(1000, True)
    check_strategy(10000, True)
    check_strategy(1000000, True)


if __name__ == "__main__":
    main()
