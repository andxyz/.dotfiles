#!/bin/sh

git log --tags --simplify-by-decoration --pretty='format:%ai %d by %an'
