# shadows-edges
Owain Jones [contact@odj.me]

Code used to generate shadow-edge-classification datasets to be used with Weka.
This requires numpy and Python's OpenCV bindings to run. 

This is the code necessary to reproduce the experiments in
"Shadow detection for mobile robots: features, evaluation and datasets" by
Charles C. Newey, Owain D. Jones and Hannah M. Dee (2016), section 8
("Edges of Shadows and Objects").

This can be used with the "Shadow Detection/Texture Segmentation
Computer Vision Dataset" available on Zenodo at http://dx.doi.org/10.5281/zenodo.59019

The `extract_features.py` script takes a list of input images and their
respective ground truths, and produces a dataset of labeled feature vectors,
in comma separated value (CSV) format. This can be imported into Weka.

In order to use with Weka's classifiers, such as the Random Forest classifier
tested in the paper, some further processing of the data is necessary:
* The script sometimes outputs 'NaN' values for some of the CSV columns. Weka
  incorrectly treats these fields as "nominal" rather than "numeric" fields,
  unless the NaN values are filtered out:

    fgrep -i nan -v edges.csv > edges.filtered.csv

* Load the filtered CSV file into Weka Explorer's "Preprocess" tab. Attributes
  whose names begin with an underscore (\_), such as `_pos_centery` and `_pos_centerx` and `_img_id` should be removed. `img_scale` and `blur` are also unused
  attributes. The `label_class` attribute needs to be set as the class attribute.

This is a slightly cleaned up version of the original code, which I wrote during
my undergrad dissertation. The original exists at https://github.com/erinaceous/shadows
