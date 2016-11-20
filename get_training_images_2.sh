#!/bin/sh

for name in artificial0 kondo1; do
    im_dir="$HOME/shadows/data/odj/$name"
    gt_dir="$HOME/shadows/data/odj/ground_truth/$name"
    python extract_features.py -ps --ignore-objects \
        -i "$im_dir/files.txt" -g "$gt_dir/files.txt" \
        -o "training4/$name.csv"
done

for dir in ~/shadows/data/sdmr/*/*; do
    name=`basename $dir`
    im_dir="$dir/images"
    gt_dir="$dir/ground-truth"
    python extract_features.py -ps --ignore-objects \
        -i "$im_dir/files.txt" -g "$gt_dir/files.txt" \
        -o "training4/$name.csv"
done
