# 🚀 App Store Submission - Step by Step Guide

Follow these steps to submit your app to the App Store.

---

## PART 1: Build and Upload from Xcode (30-60 mins)

### Step 1: Open Your Project in Xcode

```bash
cd /Users/eaflores/claude-sandbox/MexicoTaxCalculator-ipad
open MexicoTaxCalculatorAppiPad/MexicoTaxCalculatorAppiPad.xcodeproj
```

### Step 2: Configure Project Settings

1. In Xcode, click on the **project name** in the left sidebar (blue icon)
2. Select your **app target** (MexicoTaxCalculatorAppiPad)
3. Go to the **General** tab

**Verify these settings:**
- **Display Name:** Calculadora ISR México
- **Bundle Identifier:** com.edgarflores.MexicoTaxCalculator
- **Version:** 1.0
- **Build:** 1
- **Deployment Target:** iOS 15.0 or later
- **Devices:** iPhone and iPad

### Step 3: Set Up Signing & Capabilities

1. Go to **Signing & Capabilities** tab
2. **Automatically manage signing:** ✓ (check this)
3. **Team:** Select your Apple Developer account
4. Xcode will automatically create provisioning profiles

**If you see errors:**
- Make sure you're logged into Xcode with your Apple ID (Preferences → Accounts)
- Your Apple Developer Program membership must be active

### Step 4: Select Build Destination

1. In the toolbar (top left), click the device selector
2. Select **"Any iOS Device (arm64)"**
   - NOT a simulator!
   - Must be "Any iOS Device" to create an archive

### Step 5: Archive Your App

1. Go to menu: **Product → Archive**
2. Wait for build to complete (2-5 minutes)
3. The **Organizer** window will open automatically

**If build fails:**
- Check for any red errors in Xcode
- Fix them and try again
- Common issues: missing files, code signing problems

### Step 6: Upload to App Store Connect

In the Organizer window:

1. Select your archive (should be the newest one)
2. Click **Distribute App**
3. Select **App Store Connect**
4. Click **Next**
5. Select **Upload**
6. Click **Next**
7. **Signing options:**
   - Keep defaults (Automatically manage signing)
   - Click **Next**
8. Review the information
9. Click **Upload**
10. Wait for upload to complete (5-15 minutes)

**You'll see:** "Upload Successful" message

11. Click **Done**

---

## PART 2: App Store Connect Setup (30-45 mins)

### Step 7: Log into App Store Connect

1. Go to: https://appstoreconnect.apple.com
2. Sign in with your Apple ID
3. Click **My Apps**

### Step 8: Create New App

1. Click the **"+"** button (top left)
2. Select **New App**

Fill in the form:

**Platforms:**
- ✓ iOS

**Name:**
```
Calculadora ISR México
```

**Primary Language:**
```
Spanish (Mexico)
```

**Bundle ID:**
- Select: `com.edgarflores.MexicoTaxCalculator`
- If not available, you may need to create it in Certificates, Identifiers & Profiles

**SKU:**
```
mx-tax-calculator-2026
```
(Can be anything unique, this is for your internal tracking)

**User Access:**
- Select: **Full Access**

Click **Create**

---

## PART 3: Fill in App Information

### Step 9: General App Information

Navigate to **App Information** (left sidebar)

**Name:**
```
Calculadora ISR México
```

**Subtitle:**
```
ISR e IMSS 2026 - Rápido
```

**Privacy Policy URL:**
```
https://edgarfc.github.io/MexicoTaxCalculator-iPad/politica-privacidad.html
```

**Category:**
- Primary: **Finance**
- Secondary: **Productivity** (optional)

**Content Rights:**
- Contains Third-Party Content: **No**

Click **Save**

---

### Step 10: Pricing and Availability

Navigate to **Pricing and Availability** (left sidebar)

**Price:**
- Select: **Free** (0.00)

**Availability:**
- All Countries and Regions (or select specific ones)
- Mexico should definitely be included!

Click **Save**

---

### Step 11: Age Rating

Navigate to **Age Rating** (under App Information)

Answer these questions (all should be **None**):

1. **Cartoon or Fantasy Violence:** None
2. **Realistic Violence:** None
3. **Sexual Content or Nudity:** None
4. **Profanity or Crude Humor:** None
5. **Alcohol, Tobacco, or Drug Use or References:** None
6. **Mature/Suggestive Themes:** None
7. **Horror/Fear Themes:** None
8. **Gambling:** None
9. **Unrestricted Web Access:** None
10. **User Generated Content:** None

**Result:** Should show **4+**

Click **Done**

---

## PART 4: Version Information (The Big One!)

### Step 12: Navigate to Version 1.0

1. Click **iOS App** in left sidebar
2. Click **1.0 Prepare for Submission**

Now let's fill everything in:

---

### Step 13: Screenshots

**iPhone 6.7" Display:**
1. Click **iPhone 6.7" Display**
2. Drag and drop these files from `screenshots/appstore/iphone/`:
   - 01-iphone-welcome-empty-state.png
   - 02-iphone-monthly-15k-calculation.png
   - 03-iphone-monthly-50k-high-salary.png
   - 04-iphone-biweekly-7500-quincenal.png
   - 05-iphone-weekly-3500-semanal.png
   - 06-iphone-annual-180k-calculation.png

**iPad Pro (3rd Gen) 12.9" Display:**
1. Click **iPad Pro (3rd Gen) 12.9" Display**
2. Drag and drop these files from `screenshots/appstore/ipad/`:
   - 01-ipad-welcome-empty-state.png
   - 02-ipad-monthly-15k-full-details.png
   - 03-ipad-monthly-50k-high-salary.png
   - 04-ipad-biweekly-7500-quincenal.png
   - 05-ipad-weekly-3500-semanal-full.png
   - 06-ipad-annual-180k-calculation.png

---

### Step 14: Promotional Text (Optional but recommended)

```
¡Nueva interfaz de vidrio líquido! Calcula instantáneamente tu ISR e IMSS 2026. Sin anuncios, sin registro, 100% gratis. Tus datos nunca salen de tu dispositivo.
```

---

### Step 15: Description

Copy this entire description:

```
CALCULA TUS IMPUESTOS MÉXICO 2026 - ISR E IMSS

La forma más rápida, precisa y privada de calcular tus impuestos en México. Diseñada específicamente para trabajadores mexicanos que necesitan calcular su Impuesto Sobre la Renta (ISR) y cuotas del IMSS.

🎨 DISEÑO MODERNO DE VIDRIO LÍQUIDO
• Interfaz elegante con efecto glassmorfismo
• Diseño responsive optimizado para iPhone y iPad
• Fuentes grandes y legibles en iPad
• Experiencia visual premium

💰 CÁLCULOS PRECISOS Y COMPLETOS
• Basado en tablas oficiales de ISR 2026
• Tasas actualizadas del IMSS (Seguro Social)
• Calcula tu salario neto en segundos
• Muestra desglose detallado de impuestos
• Tasa promedio y tasa marginal
• Información de tu categoría fiscal ISR

📅 MÚLTIPLES PERÍODOS DE PAGO
• Mensual - Salarios mensuales
• Quincenal - Pagos cada 15 días
• Semanal - Pagos semanales
• Anual - Ingresos anuales

El sistema convierte automáticamente entre períodos para cálculos precisos.

🔒 100% PRIVADO Y SEGURO
• Sin recopilación de datos personales
• Todos los cálculos se realizan en tu dispositivo
• Sin conexión a internet requerida
• Tus datos salariales NUNCA salen de tu dispositivo
• Sin anuncios, sin rastreadores, sin análisis

✨ CARACTERÍSTICAS PRINCIPALES
• Interfaz completamente en español
• Cálculos instantáneos en tiempo real
• Desglose completo de ISR e IMSS
• Visualización clara con códigos de colores
• Rango de ingresos de tu categoría fiscal
• Tasa sobre excedente del límite inferior
• Sin necesidad de registro o cuenta
• Funciona completamente offline

📊 INFORMACIÓN DETALLADA
La app muestra:
• Salario Neto - Lo que realmente recibes
• Impuestos Totales - Suma de ISR + IMSS
• ISR - Impuesto Sobre la Renta desglosado
• IMSS - Cuotas del Seguro Social
• Tasa Promedio - Tu tasa efectiva de impuestos
• Tasa Marginal - Tasa sobre ingresos adicionales
• Tu Categoría de ISR - Rango salarial y tasa

💡 IDEAL PARA
• Trabajadores asalariados en México
• Profesionistas independientes
• Personas que buscan trabajo y necesitan comparar ofertas
• Quienes planean sus finanzas personales
• Empleadores calculando nómina
• Estudiantes de contabilidad y finanzas

📱 OPTIMIZADO PARA TODOS LOS DISPOSITIVOS
• iPhone - Interfaz compacta y eficiente
• iPad - Fuentes grandes (30% más) para mejor lectura
• Diseño responsive que se adapta a tu pantalla
• Botones grandes y fáciles de tocar

⚡ RÁPIDO Y SIMPLE
1. Ingresa tu salario bruto
2. Selecciona tu período de pago
3. ¡Listo! Resultados instantáneos

⚠️ AVISO IMPORTANTE
Esta calculadora proporciona estimaciones basadas en las tablas de ISR 2026 y tasas del IMSS vigentes. Los cálculos son para propósitos informativos y educativos.

Para cálculos oficiales de impuestos y asesoría fiscal profesional, consulte con:
• Un Contador Público Certificado
• El SAT (Servicio de Administración Tributaria)
• Un profesional fiscal licenciado

🆓 COMPLETAMENTE GRATIS
• Sin compras dentro de la app
• Sin suscripciones
• Sin anuncios molestos
• Sin funciones bloqueadas
• Todas las características disponibles desde el inicio

🔐 PRIVACIDAD GARANTIZADA
No recopilamos, almacenamos ni transmitimos ninguna información. Lee nuestra política de privacidad completa en la app.

📞 SOPORTE
¿Tienes preguntas o sugerencias? Contáctanos en edgar.afc@gmail.com

Descarga ahora y toma control de tus finanzas con la Calculadora de Impuestos México 2026.
```

---

### Step 16: Keywords

```
isr,imss,impuestos,calculadora,salario,neto,fiscal,sat,nomina,mexico,renta,seguro,social,quincenal
```

---

### Step 17: Support URL

```
https://edgarfc.github.io/MexicoTaxCalculator-iPad/soporte.html
```

---

### Step 18: Marketing URL (Optional)

Leave blank or use:
```
https://github.com/edgarfc/MexicoTaxCalculator-iPad
```

---

### Step 19: What's New in This Version

```
🎉 LANZAMIENTO INICIAL - VERSIÓN 1.0

¡Bienvenido a la Calculadora de Impuestos México 2026!

✨ CARACTERÍSTICAS PRINCIPALES
• Diseño moderno de vidrio líquido con efecto glassmorfismo
• Cálculos precisos de ISR e IMSS basados en tablas 2026
• Soporte para múltiples períodos: Mensual, Quincenal, Semanal, Anual
• Interfaz completamente en español
• 100% privado - sin recopilación de datos

🎨 DISEÑO PREMIUM
• Gradientes azules elegantes
• Contenedores de vidrio translúcido
• Animaciones suaves con efecto de resorte
• Botones de período en diseño 2x2 optimizado

💰 CÁLCULOS COMPLETOS
• Salario neto después de impuestos
• Desglose detallado de ISR e IMSS
• Tasa promedio y marginal de impuestos
• Información de tu categoría fiscal ISR

📱 OPTIMIZADO PARA IPAD
• Fuentes 30% más grandes para mejor lectura
• Espaciado optimizado
• Elementos interactivos más grandes

🔒 PRIVACIDAD TOTAL
• Sin conexión a servidores
• Todos los cálculos locales
• Cero rastreadores o análisis

Gracias por descargar. ¡Esperamos que encuentres útil esta herramienta!

Para soporte: edgar.afc@gmail.com
```

---

### Step 20: Build

1. Scroll to **Build** section
2. Click the **"+"** button next to Build
3. Select the build you uploaded earlier
4. Click **Done**

**If no build appears:**
- Wait 10-15 minutes after uploading
- Refresh the page
- Check that the build processed successfully in Activity tab

---

### Step 21: App Review Information

**Contact Information:**
- First Name: `Edgar`
- Last Name: `Flores`
- Phone Number: `[Your phone number]`
- Email: `edgar.afc@gmail.com`

**Notes for Reviewer:**
```
This is a simple tax calculator for Mexico that calculates ISR (Income Tax) and IMSS (Social Security) based on 2026 rates.

The app works completely offline with no data collection. All calculations are performed locally on the device.

To test:
1. Enter any salary amount (e.g., 15000)
2. Select a pay period (Mensual, Quincenal, Semanal, or Anual)
3. View the calculated results

No special configuration or test account needed.

Thank you for reviewing!
```

**Attachment (Optional):**
- Can attach screenshots showing how to test if needed

---

### Step 22: Version Release

Select: **Automatically release this version**

(Or select manual release if you want to control when it goes live)

---

### Step 23: Final Review

1. Scroll through the entire page
2. Check that all required fields have green checkmarks
3. Make sure screenshots look good
4. Verify all URLs work

---

## PART 5: Submit!

### Step 24: Submit for Review

1. Click **Save** (top right) to save all your work
2. Click **Add for Review** or **Submit for Review**
3. Review the submission summary
4. Click **Submit**

🎉 **Congratulations! Your app is submitted!**

---

## What Happens Next

### Timeline:
1. **Waiting for Review** (immediately) - In queue
2. **In Review** (24-72 hours) - Apple is reviewing
3. **Pending Developer Release** (if approved) - Ready to publish
4. **Ready for Sale** (live!) - On the App Store

### If Approved:
- You'll get an email notification
- App will be live on App Store (or pending your release if you chose manual)

### If Rejected:
- You'll get an email with rejection reason
- Fix the issues
- Resubmit

---

## 📞 Need Help?

**During Submission:**
- Xcode errors: Check Apple Developer Forums
- App Store Connect issues: Contact Apple Developer Support

**After Submission:**
- Check email regularly for updates from Apple
- Monitor App Store Connect dashboard

---

## ✅ Post-Submission Checklist

After submitting:
- [ ] Email confirmation received
- [ ] Status shows "Waiting for Review"
- [ ] Take a screenshot of submission confirmation
- [ ] Monitor email for updates

---

## 🎉 You're All Set!

Everything is ready. Just follow the steps above and you'll have your app submitted in about an hour.

Good luck! 🚀

---

Questions during submission? Email: edgar.afc@gmail.com
