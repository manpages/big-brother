#!/bin/bash
abs="$(dirname $(readlink -f "$0"))"
eval "$(cat ${abs}/plot.conf)"
for f in ${datafiles[@]}; do
  echo "Rendering ${f}."
  echo | gnuplot <<EOF
  set terminal gif font 'ubuntu,6' size 800,600 enhanced
  set output '/tmp/$(echo "$(basename ${f})").gif'
  set xtic 3600
  plot '/tmp/apm' with line
EOF
done
