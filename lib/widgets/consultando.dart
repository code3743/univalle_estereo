import 'package:flutter/material.dart';

class Consulta extends StatelessWidget {
  const Consulta({
    super.key,
    this.mensaje = 'Consultando',
  });
  final String mensaje;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              mensaje,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
