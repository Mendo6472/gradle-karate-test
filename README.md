# gradle-test

Proyecto de pruebas automatizadas con Gradle, JUnit 5 y Karate.

## Ejecutar las pruebas

```powershell
./gradlew test
```

Para ejecutar un filtro de Karate:

```powershell
./gradlew test -Dkarate.options="--tags @smoke"
```

Los reportes se generan en `build/karate-reports` y `target/`.