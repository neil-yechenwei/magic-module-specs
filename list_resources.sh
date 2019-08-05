#!/bin/sh

cd `dirname $0`
for file in `ls ./specs`; do
	work_dir=./specs/$file
	if [ -d $work_dir ]; then
		if [ -n "$(git diff --name-only remotes/origin/$target_branch remotes/origin/$source_branch -- $work_dir)" ];
		then
			# remove the directory prefix './specs/'
			expr substr "$work_dir" 9 "${#work_dir}"
		fi
	fi
done