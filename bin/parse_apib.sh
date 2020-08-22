#!/usr/bin/env sh

mkdir -p ./public/spec/core || { exit 1; }

echo "Render HTML for next version"
git fetch origin develop:develop || { exit 1; }
git checkout develop -- ./spec || { exit 1; }
git status
cp -r ./spec ./public/spec/core/next || { exit 1; }
git reset HEAD ./spec || { exit 1; }
git checkout -- ./spec || { exit 1; }
git status
node_modules/.bin/aglio -i ./public/spec/core/next/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/next/index.html || { exit 1; }

echo "Render HTML for 0.17"
git fetch origin v0.17:v0.17 || { exit 1; }
git checkout v0.17 -- ./spec || { exit 1; }
mkdir -p ./public/spec/core/0.17 || { exit 1; }
cp -r ./spec ./public/spec/core/0.17 || { exit 1; }
git reset HEAD ./spec || { exit 1; }
git checkout -- ./spec || { exit 1; }
node_modules/.bin/aglio -i ./public/spec/core/0.17/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.17/index.html || { exit 1; }

echo "Render HTML for 0.16"
git fetch origin v0.16:v0.16 || { exit 1; }
git checkout v0.16 -- ./spec || { exit 1; }
mkdir -p ./public/spec/core/0.16 || { exit 1; }
cp -r ./spec ./public/spec/core/0.16 || { exit 1; }
git reset HEAD ./spec || { exit 1; }
git checkout -- ./spec || { exit 1; }
node_modules/.bin/aglio -i ./public/spec/core/0.16/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.16/index.html || { exit 1; }

echo "Render HTML for 0.15"
git fetch origin v0.15:v0.15 || { exit 1; }
git checkout v0.15 -- apiary.apib || { exit 1; }
mkdir -p ./public/spec/core/0.15 || { exit 1; }
mv ./apiary.apib ./public/spec/core/0.15/apiary.apib || { exit 1; }
node_modules/.bin/aglio -i ./public/spec/core/0.15/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.15/index.html || { exit 1; }

echo "Render HTML for 0.14"
git checkout 0.14 -- apiary.apib || { exit 1; }
mkdir -p ./public/spec/core/0.14 || { exit 1; }
mv ./apiary.apib ./public/spec/core/0.14/apiary.apib || { exit 1; }
node_modules/.bin/aglio -i ./public/spec/core/0.14/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.14/index.html || { exit 1; }

echo "Render HTML for 0.13"
git checkout 0.13 -- apiary.apib || { exit 1; }
mkdir -p ./public/spec/core/0.13 || { exit 1; }
mv ./apiary.apib ./public/spec/core/0.13/apiary.apib || { exit 1; }
node_modules/.bin/aglio -i ./public/spec/core/0.13/apiary.apib --no-theme-condense --theme-full-width -o ./public/spec/core/0.13/index.html || { exit 1; }
