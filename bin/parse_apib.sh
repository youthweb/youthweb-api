#!/usr/bin/env sh

mkdir -p ./public/spec/core

echo "Render HTML for next version"
git fetch origin develop:develop
git checkout develop -- ./spec
cp -r ./spec ./public/spec/core/next
git reset HEAD ./spec
git checkout -- ./spec
node_modules/.bin/aglio -i ./public/spec/core/next/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/next/index.html

echo "Render HTML for 0.17"
git fetch origin v0.17:v0.17
git checkout v0.17 -- apiary.apib
mkdir -p ./public/spec/core/0.17
mv ./apiary.apib ./public/spec/core/0.17/apiary.apib
node_modules/.bin/aglio -i ./public/spec/core/0.17/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.17/index.html

echo "Render HTML for 0.16"
git fetch origin v0.16:v0.16
git checkout v0.16 -- apiary.apib
mkdir -p ./public/spec/core/0.16
mv ./apiary.apib ./public/spec/core/0.16/apiary.apib
node_modules/.bin/aglio -i ./public/spec/core/0.16/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.16/index.html

echo "Render HTML for 0.15"
git fetch origin v0.15:v0.15
git checkout v0.15 -- apiary.apib
mkdir -p ./public/spec/core/0.15
mv ./apiary.apib ./public/spec/core/0.15/apiary.apib
node_modules/.bin/aglio -i ./public/spec/core/0.15/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.15/index.html

echo "Render HTML for 0.14"
git checkout 0.14 -- apiary.apib
mkdir -p ./public/spec/core/0.14
mv ./apiary.apib ./public/spec/core/0.14/apiary.apib
node_modules/.bin/aglio -i ./public/spec/core/0.14/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.14/index.html

echo "Render HTML for 0.13"
git checkout 0.13 -- apiary.apib
mkdir -p ./public/spec/core/0.13
mv ./apiary.apib ./public/spec/core/0.13/apiary.apib
node_modules/.bin/aglio -i ./public/spec/core/0.13/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.13/index.html
