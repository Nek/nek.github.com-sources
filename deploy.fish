cd out
rm -rf .git
git init
git add .
git commit -m "(date)" -a
git push --force git@github.com:Nek/nek.github.com.git master:master
cd -
