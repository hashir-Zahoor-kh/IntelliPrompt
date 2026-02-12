#!/usr/bin/env bash
# Assertion utilities for E2E tests

assert_equals() {
    local expected="$1"
    local actual="$2"
    local message="${3:-Assertion failed}"
    
    if [ "$expected" != "$actual" ]; then
        echo "❌ $message"
        echo "   Expected: $expected"
        echo "   Actual: $actual"
        exit 1
    fi
}

assert_file_exists() {
    local file="$1"
    if [ ! -f "$file" ]; then
        echo "❌ File does not exist: $file"
        exit 1
    fi
}

assert_contains() {
    local haystack="$1"
    local needle="$2"
    local message="${3:-String not found}"
    
    if [[ ! "$haystack" =~ $needle ]]; then
        echo "❌ $message"
        exit 1
    fi
}
