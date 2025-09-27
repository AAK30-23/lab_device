CXXFLAGS=-std=c++17 -pthread -I.
CXX=g++
COVERAGE_FLAGS=--coverage -g -O0 -fprofile-arcs -ftest-coverage
GTEST_FLAGS=-lgtest -lpthread

# Основная программа
all: device

device: device.cpp
	$(CXX) $(CXXFLAGS) device.cpp -o device

# Тесты с coverage
test: device.cpp
	$(CXX) $(COVERAGE_FLAGS) device.cpp $(GTEST_FLAGS) -o test_executable

run_tests: test
	./test_executable

# Добавьте эту цель - она будет запускать тесты
check: test
	./test_executable

clean:
	$(RM) device test_executable *.gcno *.gcda *.gcov

.PHONY: all test run_tests clean check
