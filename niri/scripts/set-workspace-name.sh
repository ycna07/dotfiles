userInput=$(zenity --entry --text="请输入内容：" --title="输入框" )
if [ $? -eq 0 ]; then  
niri msg action set-workspace-name "$userInput"  
else 
echo "用户取消了输入。" 
fi
