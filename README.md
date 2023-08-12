# flutterviz

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Генерация схемы опенапи

```bash
docker run --rm  -v ${PWD}:/local openapitools/openapi-generator-cli generate  -i http:/
/192.168.0.105:10010/openapi.json  -g dart-dio  --additional-properties pubName=pet_api  -o /local/out/dart
```
