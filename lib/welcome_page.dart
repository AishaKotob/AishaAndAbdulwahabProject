
import 'package:flutter/material.dart';
import 'get_started_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Welcome',style: TextStyle(color: Colors.white,fontSize:24)),
        centerTitle: true,
      ),
      //7ataina mainAxisAlignment ceter kermel kl el widgets bl body ysiro centered
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //hon 3m ne7ke 3n el icon contaitner elli 3a shakel m7atit benzine
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                shape: BoxShape.circle,//la na3mol el container 3a shakel circle
              ),

              //el container elli 3a shakel circle 7ataina b2albo el gas station icon
              child: const Icon(
                Icons.local_gas_station,
                size: 50,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),

            //3m na3mil row la yetla3o 7ad ba3od wl alignment centered
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //hyda el container zabatelo width w length la ya3tini shakel rectangle w 3mtlo el borders circular
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                //hyda el container mtl ka2enno 3m 7ot shi la ybayyin ka2enno shakel sayara
                Container(
                  width: 20,
                  height: 30,
                  color: Colors.teal.shade200,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //circle avatar la a3mil shakel el wheels
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.teal,
                ),
                const SizedBox(width: 75),//hay el masefe between el 2 wheels
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.teal,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome to our Fuel Cost Calculator!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200, // Defines the button's width
              height: 50, // Defines the button's height
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(//bta3mil push into into new page
                    MaterialPageRoute(builder: (context) => const GetStartedPage()),//MaterialPageRoute bt7adedelna el target page hon hyye GetStartedPage.

                  );
                },
                style: ElevatedButton.styleFrom(//hon 3m a3mil styling lal elevator button w 3ataito backgroundColor
                  backgroundColor: Colors.teal, // Teal background for the button
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 16), // White text for the button
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
