# Changelog

## 1.1.3 - 2025-03-30

Deploy GitHub Pages of a documentation generated by the schema.

## 1.1.2 - 2025-03-07

- Setup GitHub Action to test and create schema artifacts.
- Add Rake tasks to generate extra schema in compact syntax.

## 1.1.1 - 2025-02-08

- Implemented the use of the boolean data type from XML Schema data types to
  improve data validation and integrity.  Ensure to review the updated schema
  files for compatibility with existing XML documents.
- Added an additional RELAX NG schema file that extends the basic schema.
  This new schema can be generated using a Rake task (`rake schemaex.rng`).
