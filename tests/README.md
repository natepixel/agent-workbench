# Testing

This template uses a simple testing ladder.

## 1. Smoke tests

Fast checks that the app or repo starts and basic workflows do not immediately fail.

Examples:
- server starts
- homepage loads
- CLI command runs without error

## 2. Unit tests

Small isolated tests for functions, modules, or components.

Examples:
- utility functions
- parsers
- validation logic
- React component behavior in isolation

## 3. Integration tests

Tests that multiple parts of the system work together.

Examples:
- API + database
- frontend + API mock
- script + filesystem interaction

## 4. End-to-end tests

Tests that exercise the system the way a real user would.

Examples:
- Playwright browser flows
- complete local workflow from start to finish

## Template expectation

Not every repo will implement all layers immediately, but every repo should:
- define what exists today
- define the minimum checks required before deploy or release
- expand coverage over time
