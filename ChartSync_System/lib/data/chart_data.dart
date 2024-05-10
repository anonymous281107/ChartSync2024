List<String> baselineChartSummaryData = [
  'The bar chart represents the monthly price variations of a specific commodity over the course of a year. The horizontal axis (x-axis) is labeled with the months from January to December, illustrating the temporal progression throughout the year. Meanwhile, the vertical axis (y-axis) quantifies the price of the commodity, marked in units. This setup allows for easy observation of the price trends and fluctuations as the year progresses, providing insights into seasonal impacts or other factors influencing the pricing.',
  'The bar chart presents a comparative overview of inventory levels across multiple prominent healthcare institutions. It visually represents the stock quantities at each organization, highlighting the variations and trends in resource allocation. This chart serves as a tool to assess the distribution of healthcare resources among these institutions.',
  'The "Graduation Rates by School" bar chart provides a visual comparison of graduation rates across 18 different schools. It highlights the performance of each institution, ranging from high achievers with rates above 80% to schools facing challenges with rates below 60%. This chart serves as a tool to identify trends in educational outcomes and pinpoint areas in need of improvement.',
  'The "Average Annual Rainfall by City" bar chart provides a visual representation of precipitation levels across 20 major cities. It highlights the significant variability in rainfall, from the arid deserts of Las Vegas to the tropical wetness of Miami. This chart serves as a useful tool for understanding regional climatic differences and their impact on urban environments. It visually emphasizes how geographical location influences weather patterns, particularly annual rainfall distribution.',
];

List<String> chartSummaryData = [
  'The bar chart illustrates the monthly price changes of a commodity over one year. Notably, the first quarter shows significant volatility, with prices starting at 10 units in January, dropping to 5 units in February, and surging to a yearly high of 18 units in March. The second quarter displays a downward trend, beginning at a low of 4 units in April, followed by a partial recovery to 15 units in May, and then settling at 8 units in June. In the months of July to September, the prices mildly fluctuate, stabilizing somewhat with July and August recording lower prices of 6 and 7 units respectively, before rising to 13 units in September. The final quarter sees relatively stable prices, with October and November showing consistent figures around 8 and 9 units, and December experiencing a slight increase to 11 units, suggesting a moderate upward trend as the year ends.',
  'The chart highlights inventory levels at different health facilities, showing varied management strategies. Banner Health and Duke Health hold modest supplies at 34 and 57 days respectively, indicating a balanced approach to inventory management that mitigates supply shortages without incurring high storage costs. In contrast, Mount Sinai and Stanford Health, with the highest days\' supplies at 70 and 75 days respectively, likely adopt a conservative approach influenced by factors such as geographic location and patient volume. Kaiser Permanente and UPMC also maintain higher inventory levels at 65 and 68 days, which could reflect strategic preparedness for large-scale emergencies or disruptions in supply chains.',
  'The graduation rates chart illustrates varying levels of educational achievement across schools, divided into three segments. At the top, Lincoln High leads with a graduation rate of 92%, followed closely by Washington Academy and Riverside Prep at 89% and 86% respectively, and Sunset School at 83%. These schools likely benefit from strong academic programs and support services. The middle segment includes Hill Valley College, Springfield High, Eastwood High, and Grandview School with rates ranging from 70% to 79%, reflecting moderate success and alignment with national averages. At the lower end, schools like Maplewood High to Desert Sands High have rates from 57% down to 43%, possibly due to challenges like higher student-to-teacher ratios and limited resources, which can negatively impact outcomes.',
  'The rainfall distribution chart categorizes cities based on their annual precipitation levels. Miami, with 61.9 inches, and Atlanta, with 50.2 inches, top the list, indicative of their humid subtropical climates that foster frequent rainfall. Close behind are Houston and New York City, both receiving around 50 inches, suggesting influences from seasonal storms and hurricane-prone locations. The next tier includes cities like Seattle, Portland, Chicago, and Dallas, which experience moderate rainfall levels between 36.3 and 37.5 inches, typical of areas with a blend of maritime and continental climates that ensure steady, year-round precipitation. In contrast, desert cities Phoenix and Las Vegas record the lowest rainfall, at 8.2 and 4.2 inches respectively, reflecting their extremely arid conditions and the significant impact on local environmental management and water resources.'
];

class ChartData {
  ChartData(this.xLabel, this.yLabel);
  final String xLabel;
  final double yLabel;
}

List<List<ChartData>> baselineChartData = [
  [
    ChartData("Jan", 10),
    ChartData("Feb", 5),
    ChartData("Mar", 18),
    ChartData("Apr", 4),
    ChartData("May", 15),
    ChartData("Jun", 8),
    ChartData("Jul", 6),
    ChartData("Aug", 7),
    ChartData("Sep", 13),
    ChartData("BMW", 8),
    ChartData("Mercedes", 9),
    ChartData("Audi", 11)
  ],
  [
    ChartData('Banner Health', 34),
    ChartData('Baylor Health', 53),
    ChartData('Cedars-Sinai', 40),
    ChartData('Cleveland Clinic', 60),
    ChartData('Duke Health', 57),
    ChartData('Emory Healthcare', 44),
    ChartData('Johns Hopkins', 45),
    ChartData('Kaiser Permanente', 65),
    ChartData('Mass General', 50),
    ChartData('Mayo Clinic', 35),
    ChartData('Mount Sinai', 70),
    ChartData('NY Presbyterian', 63),
    ChartData('Stanford Health', 75),
    ChartData('UCLA Health', 55),
    ChartData('UCSF Health', 30),
    ChartData('UPMC', 68)
  ],
  [
    ChartData("Lincoln High", 92),
    ChartData("Washington Academy", 89),
    ChartData("Riverside Prep", 86),
    ChartData("Sunset School", 83),
    ChartData("Hill Valley College", 79),
    ChartData("Springfield High", 76),
    ChartData("Eastwood High", 73),
    ChartData("Grandview School", 70),
    ChartData("Lakefront Academy", 68),
    ChartData("Central High", 66),
    ChartData("Bay Area School", 63),
    ChartData("Northern Lights High", 60),
    ChartData("Maplewood High", 57),
    ChartData("Oceanview Prep", 55),
    ChartData("Redwood High", 52),
    ChartData("Silver Lake Academy", 49),
    ChartData("Pine Hill Academy", 46),
    ChartData("Desert Sands High", 43)
  ],
  [
    ChartData("Seattle", 37.5),
    ChartData("Portland", 36.3),
    ChartData("San Francisco", 23.5),
    ChartData("Los Angeles", 14.9),
    ChartData("Denver", 15.6),
    ChartData("Miami", 61.9),
    ChartData("New York City", 49.9),
    ChartData("Boston", 43.8),
    ChartData("Chicago", 36.9),
    ChartData("Dallas", 37.1),
    ChartData("Houston", 49.8),
    ChartData("Atlanta", 50.2),
    ChartData("Washington D.C.", 40.8),
    ChartData("Phoenix", 8.2),
    ChartData("Las Vegas", 4.2),
    ChartData("Salt Lake City", 16.1),
    ChartData("Minneapolis", 30.6),
    ChartData("Detroit", 33.5),
    ChartData("Philadelphia", 41.5),
    ChartData("Cleveland", 39.1)
  ],
  [
    ChartData("Toyota", 0.5),
    ChartData("Subaru", 1.4),
    ChartData("Lexus", 1.7),
    ChartData("Mazda", 2.3),
    ChartData("Chevrolet", 3.7),
    ChartData("Ford", 3.8),
    ChartData("Kia", 3.8),
    ChartData("Cardillac", 6.2),
    ChartData("Hyundai", 7.2),
    ChartData("Genesis", 9.3),
    ChartData("Porsche", 10.0),
    ChartData("Volvo", 10.8),
    ChartData("Audi", 11.0),
    ChartData("Mercedes", 11.4),
    ChartData("VW", 11.5),
    ChartData("BMW", 12.5),
  ]
];

class CustomChartData {
  final List<ChartData> comaprisonChartData;
  final String comaprisonChartDataSummary;

  CustomChartData(this.comaprisonChartData, this.comaprisonChartDataSummary);
}

List<List<CustomChartData>> customChartData = [
  [
    CustomChartData(
      [ChartData("Jan", 10), ChartData("Feb", 5), ChartData("Mar", 18)],
      'In the initial quarter, the commodity\'s price begins at 10 units in January, experiences a significant drop to 5 units in February, and then surges to a peak of 18 units in March. This period is marked by sharp fluctuations, indicating possible seasonal effects or market adjustments early in the year.',
    ),
    CustomChartData(
      [ChartData("Apr", 4), ChartData("May", 15), ChartData("Jun", 8)],
      'During the second quarter, there\'s a notable downward trend in prices, starting from a low of 4 units in April, climbing to 15 units in May, and stabilizing at 8 units in June. The initial steep drop followed by a recovery might suggest a correction in the market or a response to external economic factors.',
    ),
    CustomChartData(
      [ChartData("Jul", 6), ChartData("Aug", 7), ChartData("Sep", 13)],
      'Prices in this quarter show moderate fluctuations, with July and August recording relatively lower figures at 6 and 7 units, respectively, before increasing to 13 units in September. This pattern could reflect seasonal demand changes or supply adjustments.',
    ),
    CustomChartData(
      [ChartData("Oct", 8), ChartData("Nov", 9), ChartData("Dec", 11)],
      'The last quarter of the year shows more consistency in prices, with slight increases from 8 units in October to 9 units in November and a further rise to 11 units in December. This steady increase could be influenced by year-end economic activities or market anticipation of future trends.',
    ),
  ],
  [
    CustomChartData(
      [
        ChartData('Banner Health', 34),
        ChartData('Duke Health', 57),
      ],
      'Banner Health and Duke Health show a modest inventory level, around the middle of the range, which might suggest a balanced approach to inventory management, mitigating risks of supply shortages without incurring high storage costs.',
    ),
    CustomChartData(
      [
        ChartData('Mount Sinai', 70),
        ChartData('Stanford Health', 75),
      ],
      'In contrast, Mount Sinai and Stanford Health, with the highest days\' supply at 70 and 75 days respectively, might be employing a more conservative approach. This could be due to varying factors such as geographic location, patient volume, or specialization in treatments that require a broader range of supplies to be kept on hand.',
    ),
    CustomChartData(
      [ChartData('Kaiser Permanente', 65), ChartData('UPMC', 68)],
      'Kaiser Permanente and UPMC also exhibit relatively high inventory levels, which may be strategic, reflecting preparedness for large-scale emergencies or disruptions in supply chains, a consideration that has become increasingly relevant in recent times.',
    ),
  ],
  [
    CustomChartData(
      [
        ChartData("Lincoln High", 92),
        ChartData("Washington Academy", 89),
        ChartData("Riverside Prep", 86),
        ChartData("Sunset School", 83)
      ],
      'At the top of the spectrum, Lincoln High leads with a graduation rate of 92%, closely followed by Washington Academy and Riverside Prep with 89% and 86% respectively. Sunset School also performs well with an 83% graduation rate. These schools, with rates significantly above the average, likely benefit from robust academic programs and extensive student support services, which are crucial factors in achieving high graduation rates.',
    ),
    CustomChartData(
      [
        ChartData("Hill Valley College", 79),
        ChartData("Springfield High", 76),
        ChartData("Eastwood High", 73),
        ChartData("Grandview School", 70)
      ],
      'The middle range of schools includes Hill Valley College and Springfield High with 79% and 76%, Eastwood High at 73%, and Grandview School at 70%. These institutions show moderate success, which could be indicative of a balanced mix of challenges and opportunities in educational engagement and resources. They align more closely with national averages, suggesting standard but effective educational practices.',
    ),
    CustomChartData(
      [
        ChartData("Maplewood High", 57),
        ChartData("Oceanview Prep", 55),
        ChartData("Redwood High", 52),
        ChartData("Silver Lake Academy", 49),
        ChartData("Pine Hill Academy", 46),
        ChartData("Desert Sands High", 43)
      ],
      'On the lower end, Maplewood High through Desert Sands High show graduation rates declining from 57% to 43%. These schools might struggle with issues like higher student-to-teacher ratios or insufficient academic resources, which are typical challenges that can impact educational outcomes negatively.',
    ),
  ],
  [
    CustomChartData(
      [
        ChartData("Miami", 61.9),
        ChartData("Atlanta", 50.2),
        ChartData("Houston", 49.8),
        ChartData("New York City", 49.9)
      ],
      'Miami (61.9 inches) and Atlanta (50.2 inches) are among the cities with the highest rainfall, indicating their humid subtropical climates that support frequent rain throughout the year. Similarly, Houston (49.8 inches) and New York City (49.9 inches) also experience substantial rainfall, reflecting their locations that are prone to seasonal storms and hurricanes.',
    ),
    CustomChartData(
      [
        ChartData("Seattle", 37.5),
        ChartData("Portland", 36.3),
        ChartData("Chicago", 36.9),
        ChartData("Dallas", 37.1)
      ],
      'Cities like Seattle (37.5 inches), Portland (36.3 inches), and Chicago (36.9 inches) receive moderate amounts of rainfall. These figures are typical for cities that have a mix of maritime and continental climates, where the rainfall is fairly distributed throughout the year, avoiding extremes.',
    ),
    CustomChartData(
      [ChartData("Phoenix", 8.2), ChartData("Las Vegas", 4.2)],
      'In stark contrast, Phoenix (8.2 inches) and Las Vegas (4.2 inches) report the lowest annual rainfall, characteristic of their desert climates. These cities are known for their arid conditions and very minimal precipitation, which drastically affects the local environment and water resource management.',
    ),
  ]
];
