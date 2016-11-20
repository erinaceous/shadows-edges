#!/bin/sh

sh get_training_images.sh
python extract_features.py -i images.txt -g ground-truths.txt \
    --penumbra-as-shadow --ignore-objects \
    -o training_set.csv