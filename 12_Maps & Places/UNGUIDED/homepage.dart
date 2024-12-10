import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppColors {
  static const Color primary = Color(0xFFE91E63);
  static const Color secondary = Color(0xFFF06292);
  static const Color background = Color(0xFFFFF8FB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF880E4F);
  static const Color textSecondary = Color(0xFFD81B60);
  static const Color divider = Color(0xFFF8BBD0);
}

class MyMaps extends StatefulWidget {
  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> with TickerProviderStateMixin {
  static final LatLng _kMapCenter =
      const LatLng(-7.429474, 109.253845);

  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 16.0,
  );

  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  late AnimationController _animationController;

  final Map<LatLng, Map<String, dynamic>> _placesInfo = {
    const LatLng(-7.429474, 109.253845): {
      'name': 'RS Margono Purwokerto',
      'address': 'Jl. Dr. Gumbreg No.1, Purwokerto',
      'type': 'Hospital',
      'description': 'Rumah sakit umum terbesar di Purwokerto',
      'phone': '+62 281 632708',
      'website': 'www.rsmargono.go.id',
      'operatingHours': '24 Hours',
      'facilities': [
        'Emergency',
        'Inpatient',
        'Pharmacy',
        'Parking',
        'Laboratory'
      ],
      'rating': 4.5
    },
  };

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializeMarkers() {
    _markers = _placesInfo.entries.map((entry) {
      return Marker(
        markerId: MarkerId(entry.value['name']),
        position: entry.key,
        onTap: () => _showPlaceInfo(entry.key),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
    }).toSet();
  }

  void _showPlaceInfo(LatLng position) {
    _animationController.forward(from: 0.0);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildBottomSheet(position),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: AppColors.primary, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          content,
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(LatLng place) {
    final placeInfo = _placesInfo[place];

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AppColors.divider,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            placeInfo?['name'] ?? '',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '${placeInfo?['rating']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      placeInfo?['type'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoCard(
                        Icons.location_on_rounded,
                        'Address',
                        placeInfo?['address'] ?? '',
                      ),
                      _buildInfoCard(
                        Icons.access_time_rounded,
                        'Operating Hours',
                        placeInfo?['operatingHours'] ?? '',
                      ),
                      _buildInfoCard(
                        Icons.phone_rounded,
                        'Contact',
                        placeInfo?['phone'] ?? '',
                      ),
                      _buildInfoCard(
                        Icons.info_outline_rounded,
                        'About',
                        placeInfo?['description'] ?? '',
                      ),

                      const Text(
                        'Facilities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            (placeInfo?['facilities'] as List<String>? ?? [])
                                .map((facility) {
                          return Chip(
                            label: Text(
                              facility,
                              style: const TextStyle(color: AppColors.primary),
                            ),
                            backgroundColor: AppColors.primary.withOpacity(0.1),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: () {
                          _mapController?.animateCamera(
                            CameraUpdate.newLatLngZoom(place, 17),
                          );
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.navigation_rounded),
                            SizedBox(width: 8),
                            Text(
                              'Navigate',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Place Picker Implementation',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.surface.withOpacity(0.9),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _markers,
        mapType: MapType.normal,
      ),
    );
  }
}
