# Guía de Inicio Rápido

¡Pon en funcionamiento la app Calculadora de Impuestos de México en menos de 5 minutos!

## Prerrequisitos

- Computadora macOS
- Xcode 15.0+ instalado ([Descargar del App Store](https://apps.apple.com/app/xcode/id497799835))

## Pasos de Configuración

### 1. Crear Proyecto en Xcode (2 minutos)

1. Abrir Xcode
2. **Archivo → Nuevo → Proyecto** (o presiona ⇧⌘N)
3. Selecciona **iOS** → **App**
4. Completa:
   - Nombre del Producto: `MexicoTaxCalculator`
   - Interfaz: **SwiftUI**
   - Lenguaje: **Swift**
5. Clic en **Siguiente** y guarda en cualquier lugar

### 2. Organizar Estructura del Proyecto (1 minuto)

En la barra lateral izquierda de Xcode, crea estos grupos (clic derecho en proyecto → Nuevo Grupo):
- Models
- Services
- ViewModels
- Views

### 3. Agregar Archivos Fuente (2 minutos)

Copia los archivos de este repositorio a tu proyecto de Xcode:

**Nivel Raíz:**
- Elimina el archivo `ContentView.swift` predeterminado
- Reemplaza `MexicoTaxCalculatorApp.swift` con la versión proporcionada

**Carpeta Models:**
- `TaxBracket.swift`
- `IMSSConstants.swift`
- `TaxCalculationResult.swift`

**Carpeta Services:**
- `TaxCalculator.swift`

**Carpeta ViewModels:**
- `TaxCalculatorViewModel.swift`

**Carpeta Views:**
- `TaxCalculatorView.swift`

**Carpeta Tests:**
- Elimina el archivo de prueba predeterminado
- Agrega `TaxCalculatorTests.swift`

### 4. Compilar y Ejecutar

1. Selecciona simulador: **iPhone 15 Pro** (o cualquier iPhone)
2. Presiona **⌘R** o clic en el botón Play
3. ¡La app se ejecuta en el simulador!

## Verificar Instalación

La app debe mostrar:
- Título: "Calculadora de Impuestos"
- Salario predeterminado: $10,000
- Cálculos de impuestos mostrando:
  - ISR: ~$729
  - IMSS: ~$237
  - Salario Neto: ~$9,033

## Probar la App

Prueba estas entradas:
- **$10,000 mensual** → Neto: ~$9,033
- **$20,000 mensual** → Neto: ~$17,104
- **$50,000 mensual** → Neto: ~$39,547

Cambia el período a:
- **Quincenal**: $5,000 → Neto: ~$4,517
- **Anual**: $120,000 → Neto: ~$108,401

## Ejecutar Pruebas

Presiona **⌘U** para ejecutar todas las pruebas unitarias. Todas las 15+ pruebas deben pasar.

## Solución de Problemas

### "No se puede encontrar TaxCalculatorView"
- Asegúrate de que todos los archivos estén agregados al target **MexicoTaxCalculator**
- Marca la casilla en el panel derecho al seleccionar el archivo

### La compilación falla
- Limpia la carpeta de compilación: **⇧⌘K**
- Recompila: **⌘B**

### El simulador no inicia
- **Xcode → Abrir Herramienta de Desarrollador → Simulator**
- O reinicia Xcode

## Siguientes Pasos

- Lee [LEEME.md](LEEME.md) para documentación detallada
- Consulta [EXAMPLES.md](EXAMPLES.md) para ejemplos de cálculo
- Revisa [SETUP.md](SETUP.md) para configuración avanzada

## Soporte

- [Ayuda de Xcode](https://developer.apple.com/documentation/xcode)
- [Tutorial de SwiftUI](https://developer.apple.com/tutorials/swiftui)

---

**Tiempo Total**: ~5 minutos
**Dificultad**: Apto para principiantes
