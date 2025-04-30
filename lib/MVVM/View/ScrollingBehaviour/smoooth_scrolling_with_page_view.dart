import 'package:flutter/material.dart';

class SmothScollingScreen extends StatefulWidget {
  const SmothScollingScreen({super.key});

  @override
  State<SmothScollingScreen> createState() => _SmothScollingScreenState();
}

class _SmothScollingScreenState extends State<SmothScollingScreen> {
  final List<String> supercarImages = [
    "https://media.istockphoto.com/id/182057878/photo/hot-sports-car.jpg?b=1&s=612x612&w=0&k=20&c=unhJC0Jd81U-3DcDoKmh8oiA4HmZnfyh4vD_VbL74l0=",
    "https://media.istockphoto.com/id/2169619139/photo/luxury-car-alloy-rim-with-polished-details.jpg?b=1&s=612x612&w=0&k=20&c=rfs27HnFmVS5k5JwdRI5tZzE6dA29VkwxCAF3UFUO0Q=",
    "https://media.istockphoto.com/id/910943736/photo/modern-red-metallic-sedan-car-in-urban-setting-tunnel-generic-design-brandless.jpg?b=1&s=612x612&w=0&k=20&c=BvZOCeSrIBxY_Hf1bA_DF432-Q9-omHf-y-PtaemdPQ=",
    "https://media.istockphoto.com/id/688980174/photo/low-angle-side-view-of-car.jpg?b=1&s=612x612&w=0&k=20&c=hSRSSZca6SNHeEyJnxMLAxouTp1WxT5YITnUnSBfl-M=",
    "https://media.istockphoto.com/id/174860711/photo/yellow-supercar.jpg?b=1&s=612x612&w=0&k=20&c=c80rYi9JneB7z86nfSqH2y8BFlSNRKjfEMTD-EgeCLY=",
    "https://media.istockphoto.com/id/2150924548/photo/dusty-red-car-in-garage-low-angle-closeup-of-side-mirror.jpg?b=1&s=612x612&w=0&k=20&c=H1FT-Mxvl4vO4Uj3QIZpFdEo51wtClLDcYRvNHAThp8=",
    "https://media.istockphoto.com/id/174257607/photo/sports-car.jpg?b=1&s=612x612&w=0&k=20&c=Ianqisz1eBv6yUmbQd67kLn0k_nCEq3qshFuhnX6QTc=",
    "https://media.istockphoto.com/id/177264718/photo/silver-car-speeding-in-tunnel.jpg?b=1&s=612x612&w=0&k=20&c=alkrNirpaV-DhE6eE4cgTOgRT5ZkPVGBPHxzrKWivVU=",
    "https://media.istockphoto.com/id/1013911356/photo/generic-futuristic-sports-car-speeding-in-the-underground-tunnel.jpg?b=1&s=612x612&w=0&k=20&c=DTFpThtnn8-cO6IiuXyZCSarxjyuFWJj6rUuHSwkrdg=",
    "https://media.istockphoto.com/id/929646980/photo/3d-rendering-of-a-brand-less-grey-sport-car-with-motion-blur.jpg?b=1&s=612x612&w=0&k=20&c=ezDI1M44Dh2kUJF2iMDi0-SzqS_sWCRXntaO3oDXFc4=",
    "https://media.istockphoto.com/id/481924646/photo/crazy-ride-on-the-night-by-car.jpg?b=1&s=612x612&w=0&k=20&c=L6HTPRRkzr9empPNKp8CT09Z9Yi1jguOWyYDaLzdDI4=",
    "https://media.istockphoto.com/id/2204025471/photo/close-up-of-gray-leather-with-orange-stitching-detail-luxury-automotive-interior-texture.jpg?b=1&s=612x612&w=0&k=20&c=5F08qi7ghJJZFC_XwWUdVB8l_V54R-6mD7ZeamWBIpI=",
    "https://media.istockphoto.com/id/1155216803/photo/off-road-suv-driving-on-the-rock-mountain-road-in-leh-india.jpg?b=1&s=612x612&w=0&k=20&c=11jR_Xv9KBZ5LKqyw9bPAySs9Kn_2a2oRQWEoijngGM=",
    "https://media.istockphoto.com/id/2200604472/photo/partial-close-up-of-the-car.jpg?b=1&s=612x612&w=0&k=20&c=TSPr70V4KdLA2d6JJq_eBYKRKsf7WxARmzqvy1-PpY0=",
    "https://media.istockphoto.com/id/1168555912/photo/yellow-sports-concept-car-in-restricted-area.jpg?b=1&s=612x612&w=0&k=20&c=dhv9nvvB8k_GkqJnVyqdK0Dz8w0wKE4Psxz33kFNMUc=",
    "https://media.istockphoto.com/id/147461270/photo/hot-sports-car.jpg?b=1&s=612x612&w=0&k=20&c=2IR2IE3cbDYUPB0EVUDcQEe9OPtFnz8awFrpAGrU7O0=",
    "https://media.istockphoto.com/id/920877788/photo/self-drive-autonomous-vehicle.jpg?b=1&s=612x612&w=0&k=20&c=YN9xvdTZMipQ7bymvPqiCV28z-SVHt-FKJBH79UKpxQ=",
    "https://media.istockphoto.com/id/92134877/photo/a-line-up-of-brand-new-cars-in-an-automobile-factory.jpg?b=1&s=612x612&w=0&k=20&c=ubE5oQVt34Co2Kl5tQUTsvWT-DNb0YVFhRjFrWT63EA=",
    "https://media.istockphoto.com/id/1320950393/photo/cars-on-production-line-in-factory.jpg?b=1&s=612x612&w=0&k=20&c=30HlNvU5XoUAgcX9ezRxwbIu1P2XmgGroeD5-qGBjA4=",
    "https://media.istockphoto.com/id/1478431022/photo/cars-for-sale-stock-lot-row.jpg?b=1&s=612x612&w=0&k=20&c=M8M4RHWKzIDba-I2d2MgVwqtD3yCvsMZRwXSRT7OMOk=",
    "https://media.istockphoto.com/id/474413273/photo/modern-powerful-car-engine.jpg?b=1&s=612x612&w=0&k=20&c=274wofA7F0UdWggQWmiy3PtSjWTVCIQ8T5Au93OMMGU=",
    "https://media.istockphoto.com/id/1688124066/photo/car-rental-business-transportation-service.jpg?b=1&s=612x612&w=0&k=20&c=yZgDdf1m5N5BeKdUBImH1rIoeCU5z1nuDQne3M3AHy0=",
    "https://media.istockphoto.com/id/585495312/photo/new-cars-at-dealer-showroom.jpg?b=1&s=612x612&w=0&k=20&c=QzZrubZmfWE4tbGLtXj2os9V6EXoaq1oDNPtgxWatq4=",
    "https://media.istockphoto.com/id/1404697465/photo/mother-and-daughter-getting-inside-the-car-while-travelling.jpg?b=1&s=612x612&w=0&k=20&c=h07DfjnkcjCf6YD4HwuCswkzrSffboG5d3wBS0yYT84=",
    "https://media.istockphoto.com/id/1314155790/photo/cars-in-the-parking-lot.jpg?b=1&s=612x612&w=0&k=20&c=1nNUsYKcYdhI6er5GgnWww2LTLGYThVjwldGS5dAvnk=",
    "https://media.istockphoto.com/id/1032516778/photo/indian-currency-notes-and-toy-car-in-the-hands-bank-loan-concept.jpg?b=1&s=612x612&w=0&k=20&c=eFjaxu5_lFQOzifpnSSxMJlIvcVcQ1Tgul6eqWEFcEU=",
    "https://media.istockphoto.com/id/2170396768/photo/a-close-up-view-of-a-damaged-silver-car-front-highlighting-cracked-headlight-and-bumper-near.jpg?b=1&s=612x612&w=0&k=20&c=YD8gZ7BxrhkjvgPm_u93tmQbQeYCOF6uTNozKhFhALQ=",
    "https://media.istockphoto.com/id/188052258/photo/car-components.jpg?b=1&s=612x612&w=0&k=20&c=3uddKLVhIISTtRL-wgJJUa_p58EsbBV7nEt24IUscGA=",
    "https://media.istockphoto.com/id/160554760/photo/car-factory-production-line.jpg?b=1&s=612x612&w=0&k=20&c=UrlBSmnC_pIdCIBP9oT8UH0utQ6IK1tCS0IZc3KoYDA=",
    "https://media.istockphoto.com/id/1143495980/photo/car-finance-with-indian-rupee.jpg?b=1&s=612x612&w=0&k=20&c=Skg4ffAPcDNvveIv70AOH0cgXJNGTL--clNZb9KCE-Q=",
    "https://media.istockphoto.com/id/174555993/photo/4x4-dune-bashing-is-a-popular-sport-of-arabian-desert.jpg?b=1&s=612x612&w=0&k=20&c=MUA42SgBnNSU96_7o5IKUjEwnuzAFQsGvi8vDPtPGWo=",
    "https://media.istockphoto.com/id/2171477934/photo/high-angle-view-of-cityscape-against-sky.jpg?b=1&s=612x612&w=0&k=20&c=FO3KB87cgvvAZBB4TjINDl03e4rs79YROdtdS4SsOpA=",
  ];

  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 1);
  int _activeIndex = 0;
  double itemWidth = 200; // or whatever width you use

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              // height: 300,
              child: PageView.builder(
                controller: _pageController,
                pageSnapping: false,
                scrollDirection: Axis.horizontal,
                itemCount: supercarImages.length,
                onPageChanged: (value) {
                  setState(() {
                    _activeIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  final vehicle = supercarImages[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(
                      horizontal: _activeIndex == index ? 8 : 16,
                      vertical: _activeIndex == index ? 0 : 60,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: _activeIndex == index ? 3 : 1,
                        color: _activeIndex == index
                            ? Colors.red.withOpacity(0.2)
                            : Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        vehicle,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[500],
                          child: const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
