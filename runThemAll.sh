#!/bin/bash

for dir in tests/*/; do
    parent_folder=$(basename "$dir")

    robot --outputdir results/"$parent_folder" "$dir"*.robot
done
