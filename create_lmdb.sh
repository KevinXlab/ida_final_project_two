
# create labels.txt in train_labels/
ls training -1|awk -F "_" '{print $1 "_" $2 " " $1 }' >training_labels/labels.txt
ls testing -1|awk -F "_" '{print $1 "_" $2 " " $1 }' >testing_labels/labels.txt

rm -r training_lmdb
rm -r testing_lmdb

convert_imageset --shuffle training/ training_labels/labels.txt training_lmdb
convert_imageset --shuffle testing/ testing_labels/labels.txt testing_lmdb
