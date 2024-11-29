import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  //la 7ad hl sator mojarrad ma ektob st w na2e stful la 7alon byenkatabo

  // hon hyda dictionary to store cars and their efficiencies.
  final Map<String, double> _carEfficiencyDictionary = {
    'Toyota Corolla': 7.5,
    'Honda Civic': 6.8,
    'Ford Focus': 7.2,
    'Chevrolet Malibu': 8.0,
    'Nissan Altima': 7.1,
  };

  String? _selectedCar; // Holds the selected car name wl "?" l2nno momken te7mol null value
  double? _carEfficiency; // Holds the efficiency of the selected car w kmn el "?" l2nno momken te7mol null value

  String _distance = ''; // el distance input
  String _fuelPrice = ''; // hon fuel price input
  String _fuelBudget = ''; //hon fuel budget input
  String _fuelCostResult = ''; // Result b3d ma na3mil  calculation lal fuel cost
  String _maxDistanceResult = ''; // Result lal max distance elli fiha el siyara tmshiha bl km

  void _calculateFuelCost() {
    double? distance = double.parse(_distance); // yjib el distance mn user input w y7awlo la double
    double? fuelPrice = double.parse(_fuelPrice); // yjib el fuel price mn user input w y7awlo la double

    if (distance == '' || fuelPrice == '') {
      setState(() {
        _fuelCostResult = 'Please enter valid numbers for distance and fuel price.';
      });
      return;
    }

    double fuelCost = (distance / 100) * _carEfficiency! * fuelPrice; //isharet el "!" ma3neta 7atta law ken null kaffe 3adi ma7 ya3te error
    setState(() {
      _fuelCostResult = 'The total fuel cost is \$${fuelCost.toStringAsFixed(2)}'; //toStringAsFixed(2) bte5od 2 nbrs b3d el fasli
    });
  }

  void _calculateMaxDistance() {

    double? fuelBudget = double.parse(_fuelBudget); // 3m njib fuel budget mn el input w n7awlo la double
    double? fuelPrice = double.parse(_fuelPrice); // 3m njib el fuel price mn input w n7awlo la double

    if (fuelBudget == ''|| fuelPrice == '') {
      setState(() {
        _maxDistanceResult = 'Please enter valid numbers for budget and fuel price.';
      });
      return;
    }

    double maxDistance = (fuelBudget / fuelPrice) * (100 / _carEfficiency!);// isharet el "!" ma3neta 7atta law ken null kaffe 3adi ma7 ya3te error
    setState(() {
      _maxDistanceResult =
      'You can travel up to ${maxDistance.toStringAsFixed(2)} kilometers with your budget.'; //toStringAsFixed(2) bte5od 2nbs b3d el fasli
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Started',style: TextStyle(color: Colors.white,fontSize:24)),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select a Car:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // hay lal  Spacing between text and dropdown
            DropdownMenu(
              width: 210.0,

              onSelected: (car) {
                setState(() {
                  _selectedCar = car as String; //hon fini ma 7ot as String l22no already m3arfe _selectedCar?
                  _carEfficiency = _carEfficiencyDictionary[_selectedCar]; // Update car efficiency
                });
              },
              dropdownMenuEntries: _carEfficiencyDictionary.keys.map((car) {
                return DropdownMenuEntry(value: car, label: car);
              }).toList(),//7ataina .toList() la2enno dropdownMenuEntries btrajji3 list bynama el map btraji3 object of type iterable la hik lezem 7awla la list
            ),

            if (_carEfficiency != null)
              Text('Efficiency: $_carEfficiency L/100km'),
            const SizedBox(height: 20), // hay for spacing

            const Text('Enter Distance (km):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) => _distance = value, // bt7ot el distance input bel variable _distance
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter distance in km',
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Enter Fuel Price (\$/L):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) => _fuelPrice = value, // bt7ot el fuel price input bel variable _fuelPrice
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter fuel price',
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Enter Fuel Budget (\$):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) => _fuelBudget = value, // bt7ot el fuel budget input bel variable _fuelBudget
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter fuel budget',
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _calculateFuelCost,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // background color lal button howwi teal
                ),
                child: const Text('Calculate Fuel Cost', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 10),
            Text(_fuelCostResult, style: const TextStyle(fontSize: 16, color: Colors.black), textAlign: TextAlign.center),
            const SizedBox(height: 20),


            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _calculateMaxDistance,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: const Text('Calculate Max Distance', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 10),
            Text(_maxDistanceResult, style: const TextStyle(fontSize: 16, color: Colors.black), textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
