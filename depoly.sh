#!/usr/bin/env sh
# 當發生錯誤時終止腳本運行
set -e
# 打包
yarn build
# 移動至到打包後的 dist 目錄 
cd dist
git init
git add -A
git commit -m 'deploy'
# 部署到 git@github.com:LiaoYingKai/calculator.git 分支為 gh-pages
git push -f git@github.com:LiaoYingKai/world-clock.git master:gh-pages

# 將 dist 資料夾中的內容推送至遠端 gh-pages 分支中，並強制無條件將舊有的內容取代成目前的內容（指令 git push -f)
cd -