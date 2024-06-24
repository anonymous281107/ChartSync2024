# Implementaion Details

We implemented ChartSync~\footnote(https://github.com/anonymous281107/ChartSync2024) as an Android mobile browser application developed using an open source framework namely flutter~\footnote(https://docs.flutter.dev/get-started/codelab). 


When the user loads a webpage, \sysname{} leverages in-built Dart functions~\footnote(https://dart.dev/) to extract the entire HTML DOM of the webpage and send it to the back-end server via a POST request. 


We used the Beautiful Soup \footnote(https://beautiful-soup-4.readthedocs.io/en/latest/) Python package to extract all images in the DOM, labeling them with positional IDs. These images were then sent to a custom-trained Inception-V3 model \footnote(https://cloud.google.com/tpu/docs/inception-v3-advanced) and annotated with flags (True, False) to indicate whether they were data charts. Subsequently, all chart images were processed using ChartOCR \footnote(https://github.com/soap117/DeepRule) to extract data attributes such as labels, legends, and data values. Following which to identify textual paragraphs associated with charts, we implemented the P-KLA algorithm \footnote(https://aclanthology.org/W11-2306.pdf) ourselves in Python, as there was no publicly available code for the same. 


The chart data points and corresponding textual paragraph pairs are then passed to a pre-trained LLaMA Model\footnote(https://huggingface.co/docs/transformers/main/en/model_doc/llama) along with a well-engineered prompt to accurately match data points with the corresponding sentences in the textual paragraph. The prompt template was constructed using Chain-of-Thought (CoT)\footnote(https://arxiv.org/abs/2201.11903) and ReAct prompting techniques\footnote(https://react-lm.github.io/). CoT prompting provided logical steps for the LLM to discern chart references within the text, while ReAct prompting directed subsequent actions for validating and grouping data points (as detailed in Section 4.3). ChartSync simultaneously utilizes Calliope\footnote(https://arxiv.org/pdf/2010.09975) to identify existing data facts within the charts. These data facts are sent to the LLM along with a natural language template\footnote(https://arxiv.org/pdf/2010.0997) to construct a summary for each data fact. ChartSync then packages the relevant sentences and associated data points from textual paragraphs and identified data facts for all the charts as a JSON object and sends it to the Flutter module.


When the user taps on a chart, ChartSync recreates an interactive slideshow using Flutter UI modules. Each view in the slideshow showcases data points leveraging information from the JSON object using the FLChart package\footnote(https://pub.dev/packages/fl_chart). Additionally, each view includes an audio button, built using the Flutter TTS package\footnote(https://pub.dev/packages/flutter_tts), that reads out the text associated with the data points. Other functionalities such as customization and space compaction were implemented using Dart.


The backend server was developed using Django REST Framework (DRF)\footnote(https://www.django-rest-framework.org/) and Python. This server was responsible for managing incoming requests, executing essential functions, and providing responses to the front-end user interface. 

Note that our user-interface implementation was wrapped in a package with a flexible back-end for developers to use as a dependency in their own mobile applications. 