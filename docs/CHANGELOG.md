# Changelog

## 1.1.1 - 2025-02-08

- Implemented the use of the boolean data type from XML Schema data types to
  improve data validation and integrity.  Ensure to review the updated schema
  files for compatibility with existing XML documents.
- Added an additional RELAX NG schema file that extends the basic schema.
  This new schema can be generated using a Rake task (`rake schemaex.rng`).
