#!/bin/bash

# Get a random sample of 50 images from each of our datasets.
# Outputs 2 lists of files; images.txt and ground-truths.txt

echo -n > images.txt
echo -n > ground-truths.txt

for dir in /home/owain/shadows/data/odj/artificial0 /home/owain/shadows/data/odj/kondo1_bifilter; do
    find $dir -name '*png' > $dir/files.txt
    gt_dir=`echo "$dir" | sed 's|odj|odj/ground_truth|g' | sed 's|kondo1_bifilter|kondo1|g'`;
    find $gt_dir -name '*png' > $gt_dir/files.txt
    find $dir -name '*png' | sort -R | head -n50 | tee -a images.txt | sed 's|odj|odj/ground_truth|g' | sed 's|kondo1_bifilter|kondo1|g' >> ground-truths.txt
    fgrep -vf images.txt $dir/files.txt > $dir/files.test_set.txt
    fgrep -vf ground-truths.txt $gt_dir/files.txt > $gt_dir/files.test_set.txt
done

for dir in /home/owain/shadows/data/sdmr/*/*/images; do
    find $dir -name '*png' > $dir/files.txt
    gt_dir=`echo "$dir" | sed 's|images|ground-truth|g'`;
    find $gt_dir -name '*png' > $gt_dir/files.txt
    find $dir -name '*png' | sort -R | head -n50 | tee -a images.txt | sed 's|images|ground-truth|g' >> ground-truths.txt
    fgrep -vf images.txt $dir/files.txt > $dir/files.test_set.txt
    fgrep -vf ground-truths.txt $gt_dir/files.txt > $gt_dir/files.test_set.txt
done