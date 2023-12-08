import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Términos y Condiciones'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido a nuestra aplicación.\n Antes de continuar, por favor,\n lea detenidamente\n nuestros términos y condiciones:',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  '1. Responsabilidades del Usuario:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Al utilizar esta aplicación, acepta cumplir con estos términos y condiciones.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Usted es responsable de mantener la confidencialidad de su información de cuenta.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸No está permitido compartir su cuenta con otras personas.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Respete la privacidad de otros usuarios y no comparta información personal sin su consentimiento.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Nos reservamos el derecho de modificar estos términos y condiciones en cualquier momento.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  '2. Propiedad Intelectual:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸El contenido y los derechos de propiedad intelectual de la aplicación, incluidos textos, gráficos, logotipos y software, son propiedad exclusiva de la aplicación.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Los usuarios no pueden utilizar, copiar, distribuir ni modificar dicho contenido sin autorización previa.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  '3. Suspensión o Cierre de Cuentas:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Nos reservamos el derecho de suspender o cerrar cuentas de usuarios que violen nuestros términos y condiciones.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Los usuarios pueden cerrar sus cuentas en cualquier momento, respetando las obligaciones contractuales pendientes.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  '4. Modificaciones en los Términos y Condiciones:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Nos reservamos el derecho de actualizar y modificar estos términos y condiciones en cualquier momento.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Se notificará a los usuarios sobre cambios significativos, y el uso continuado de la aplicación después de dichas modificaciones constituirá la aceptación de los nuevos términos.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  '5. Descuentos por Donaciones:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Se realizará un descuento adicional en el servicio por donaciones, de manera legal y respetuosa.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '🔸Los detalles y condiciones específicas de los descuentos por donaciones se especificarán en secciones adicionales o comunicados oficiales.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                'Gracias por utilizar nuestra aplicación.\n 👍🐶❤️😺',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
