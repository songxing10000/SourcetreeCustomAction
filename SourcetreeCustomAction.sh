#!/bin/sh


# /Users/mac/Downloads/openAD.sh $REPO androidstudio $FILE

#设置变量IDE为第二个参数
IDE=$2
# 如果IDE变量不为空，则执行以下操作
if [ -n "$IDE" ]; then
#根据IDE变量的值进行不同的操作
  case $IDE in
    xcworkspace)
    # 如果Example目录存在且_Pods.xcodeproj文件存在，则打开Example目录下的xcworkspace文件，否则打开当前目录下的xcworkspace文件
        if [ -d "Example" ] && [ -e "_Pods.xcodeproj" ]; then
          open Example/*.xcworkspace
        elif [ -d "Example" ]; then
          open Example/*.xcworkspace
        else
           open ./*.xcworkspace
        fi
      ;;
    xcodeproj)
    # 如果Example目录存在且_Pods.xcodeproj文件存在，则打开Example目录下的xcodeproj文件，否则打开当前目录下的xcodeproj文件
      if [ -d "Example" ] && [ -e "_Pods.xcodeproj" ]; then
          open Example/*.xcodeproj
      elif [ -d "Example" ]; then
          open Example/*.xcworkspace
      else
          open ./*.xcodeproj
      fi
      ;;
    vscode)
    # 如果参数个数大于等于3且第三个参数不等于$FILE，则使用VSCode打开第三个参数指定的文件，否则只打开第一个参数指定的目录
      if [ $# -ge 3 ] && [ "$3" != '$FILE' ]; then
        /usr/local/bin/code $1 $3
      else
        /usr/local/bin/code $1
      fi
      ;;
    androidstudio)
    # 如果参数个数大于等于3且第三个参数不等于$FILE，则使用Android Studio打开第三个参数指定的文件，否则只打开第一个参数指定的目录
      if [ $# -ge 3 ] && [ "$3" != '$FILE' ]; then
        /usr/local/bin/studio $1 $3
      else
        /usr/local/bin/studio $1
      fi
      ;;
    *)
    # 如果IDE变量的值不是上述四种情况，则输出错误信息并退出脚本
      echo "Unsupported IDE: $IDE"
      exit 1
      ;;
  esac
fi
