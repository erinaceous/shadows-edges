#!/usr/bin/env bash

mkdir -p testing

for dir in /home/owain/shadows/data/odj/artificial0 /home/owain/shadows/data/odj/kondo1_bifilter; do
    name=`basename $dir`
    gt_dir=`echo "$dir" | sed 's|odj|odj/ground_truth|g' | sed 's|kondo1_bifilter|kondo1|g'`;
    python extract_features.py \
        -i "$dir/files.test_set.inverted.txt" \
        -g "$gt_dir/files.test_set.inverted.txt" \
        --penumbra-as-shadow --ignore-objects \
        -o "testing/$name.csv"
done

for dir in /home/owain/shadows/data/sdmr/*/*/images; do
    name=`dirname $dir`
    name=`basename $name`
    gt_dir=`echo "$dir" | sed 's|images|ground-truth|g'`;
    python extract_features.py \
        -i "$dir/files.test_set.inverted.txt" \
        -g "$gt_dir/files.test_set.inverted.txt" \
        --penumbra-as-shadow --ignore-objects \
        -o "testing/$name.csv"
done