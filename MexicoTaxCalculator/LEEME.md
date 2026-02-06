# Calculadora de Impuestos de México - App iOS

Una aplicación iOS para calcular impuestos mexicanos (ISR e IMSS) basada en las tablas oficiales de 2026 y tasas vigentes.

## Características

- **Cálculo de ISR**: Cálculo preciso del Impuesto Sobre la Renta usando los rangos oficiales de 2026 del SAT
- **Cálculo de IMSS**: Aportaciones del trabajador al Seguro Social (Instituto Mexicano del Seguro Social)
- **Múltiples Períodos de Pago**: Soporte para cálculos mensuales, quincenales, semanales y anuales
- **Análisis de Tasas Fiscales**: Muestra tasas de impuestos promedio y marginales
- **Información de Rangos**: Despliega tu rango fiscal actual y tasas aplicables
- **Cálculos en Tiempo Real**: Cálculo instantáneo de impuestos mientras escribes
- **Interfaz SwiftUI Moderna**: Diseño nativo y moderno para iOS

## Detalles del Cálculo de Impuestos

### Rangos de ISR (Impuesto Sobre la Renta) - 2026

La app utiliza los rangos oficiales de ISR para 2026 del Anexo 8 de la Resolución Miscelánea Fiscal:

| Rango de Ingreso Mensual | Cuota Fija | Tasa sobre Excedente |
|--------------------------|------------|---------------------|
| $0.01 - $844.59 | $0.00 | 1.92% |
| $844.60 - $7,168.51 | $16.22 | 6.40% |
| $7,168.52 - $12,598.02 | $420.95 | 10.88% |
| $12,598.03 - $14,644.64 | $1,011.68 | 16.00% |
| $14,644.65 - $17,533.64 | $1,339.14 | 17.92% |
| $17,533.65 - $35,362.83 | $1,856.84 | 21.36% |
| $35,362.84 - $55,736.68 | $5,665.16 | 23.52% |
| $55,736.69 - $106,410.50 | $10,457.09 | 30.00% |
| $106,410.51 - $141,880.66 | $25,659.23 | 32.00% |
| $141,880.67 - $425,641.99 | $37,009.69 | 34.00% |
| $425,642.00+ | $133,488.54 | 35.00% |

**Fórmula**: ISR = Cuota Fija + (Cantidad Excedente × Tasa)
Donde: Cantidad Excedente = Ingreso Gravable - Límite Inferior del Rango

### Tasas de IMSS (Seguro Social) - 2026

Componentes de aportación del trabajador:
- **Enfermedades y Maternidad**: 0.40% (sobre ingreso arriba de 3 UMAs) + 0.375% (gastos médicos) + 0.25% (prestaciones en dinero)
- **Invalidez y Vida**: 0.625%
- **Cesantía y Vejez**: 1.125%
- **Total**: Aproximadamente 2.775% del salario bruto

**Valores de UMA 2026**:
- Diario: $117.31
- Mensual: $3,566.22

## Estructura del Proyecto

```
MexicoTaxCalculator/
├── MexicoTaxCalculatorApp.swift    # Punto de entrada de la app
├── Models/                         # Modelos de datos
│   ├── TaxBracket.swift            # Definiciones de rangos de ISR
│   ├── IMSSConstants.swift         # Tasas IMSS y valores UMA
│   └── TaxCalculationResult.swift  # Modelo de resultado de cálculo
├── Services/                       # Lógica de negocio
│   └── TaxCalculator.swift         # Motor de cálculo de impuestos
├── ViewModels/                     # Gestión de estado de vistas
│   └── TaxCalculatorViewModel.swift # ViewModel de la calculadora
└── Views/                          # Vistas SwiftUI
    └── TaxCalculatorView.swift     # Interfaz principal de la calculadora
```

## Cómo Compilar y Ejecutar

1. **Requisitos**:
   - Xcode 15.0 o posterior
   - iOS 17.0 o posterior
   - macOS para desarrollo

2. **Configuración**:
   ```bash
   # Abrir en Xcode
   open MexicoTaxCalculator.xcodeproj

   # O usar línea de comandos de Xcode
   xcodebuild -project MexicoTaxCalculator.xcodeproj -scheme MexicoTaxCalculator -sdk iphonesimulator
   ```

3. **Crear Proyecto en Xcode**:
   - Abrir Xcode
   - Crear nuevo proyecto de App iOS
   - Nombre: "MexicoTaxCalculator"
   - Interfaz: SwiftUI
   - Lenguaje: Swift
   - Copiar todos los archivos fuente al proyecto

4. **Organización de Archivos en Xcode**:
   - Crear grupos (carpetas) para Models, Views, ViewModels, y Services
   - Arrastrar los archivos .swift correspondientes a cada grupo
   - Asegurar que todos los archivos estén agregados al target

## Ejemplo de Uso

Para un salario bruto mensual de $10,000:
- **ISR**: ~$729
- **IMSS**: ~$237
- **Total de Deducciones**: ~$966
- **Salario Neto**: ~$9,033
- **Tasa Promedio**: ~9.67%
- **Tasa Marginal**: 10.88%

## Fuentes de Datos

Esta calculadora está basada en regulaciones fiscales oficiales de México:

- **Rangos de ISR**: SAT Anexo 8 de la Resolución Miscelánea Fiscal 2026
- **Tasas IMSS**: Tasas oficiales de aportación del trabajador IMSS para 2026
- **Valores UMA**: Valores oficiales 2026 de la Unidad de Medida y Actualización

### Referencias

- [Tablas ISR 2026 - ElConta.MX](https://elconta.mx/tablas-y-tarifas-isr-2026-anexo-8-de-la-resolucion-miscelanea-fiscal-2026/)
- [Calculadora de Impuestos México - Talent.com](https://mx.talent.com/tax-calculator)
- [Calculadora IMSS 2026](https://elconta.mx/calculadora-imss-e-infonavit-2026/)

## Aviso Legal

Esta calculadora proporciona estimaciones basadas en los rangos de ISR 2026 y tasas de aportación del IMSS. Los cálculos son solo para fines informativos y no deben considerarse como asesoría fiscal oficial.

Para cálculos fiscales oficiales y cumplimiento normativo, consulte con:
- Un profesional fiscal certificado
- El SAT (Servicio de Administración Tributaria)
- El departamento de nómina de su empleador

La calculadora hace suposiciones simplificadas (ej. estado civil, deducciones estándar) y puede no tomar en cuenta todas las circunstancias individuales, créditos o deducciones que podrían afectar su obligación fiscal real.

## Licencia

Este es un proyecto educativo. Siéntase libre de usar y modificar según sea necesario.

## Contribuciones

¡Las contribuciones son bienvenidas! Por favor asegúrese de que cualquier cambio mantenga la precisión con las regulaciones oficiales del SAT e IMSS.
