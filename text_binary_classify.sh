#!/bin/bash
#Author: Jihan Yehia
#Date: 11/30/2021
#This shell script takes two arguments: $1: absolute path to weka installation, $2: absolute path to the directory containing the classes and fails to train upon.
export CLASSPATH=$CLASSPATH:$1/weka.jar:$1/libsvm.jar
java weka.core.converters.TextDirectoryLoader -dir $2 > $2".arff"
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector -i $2".arff" -o $2"_training.arff" -M 2
java -Xmx1024m weka.classifiers.meta.ClassificationViaRegression -W weka.classifiers.trees.M5P -num-decimal-places 4 -t $2"_training.arff" -d $2"_training.model" -c 1
