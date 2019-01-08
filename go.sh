#!/bin/bash
#Program:
#	饥荒linux系统服务器开服脚本
#just for fun
#History:
#2016/11/12  欲醉无由   第一次完成
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DST_script_version="20170601"
DST_conf_dirname="DoNotStarveTogether"   
DST_conf_basedir="$HOME/.klei" 
DST_bin_cmd="./dontstarve_dedicated_server_nullrenderer"   
DST_game_path="$HOME/Steam/steamapps/common/Don't Starve Together Dedicated Server"

function SetWhite()
{
	echo "============================================"
	echo "[1]加入白名单 [2]放出白名单 "
	read white1
	case $white1 in
	1)
	echo "============================================"
	echo "请输入要加入白名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ ! `grep "$ID2" whitelist.txt` ]]
		then 
			echo "$ID2" >> whitelist.txt
			echo "已为这个基佬预留一个位置"
		else
			echo "这个基佬已经有一个位置"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	;;
	2)
	echo "============================================"
	echo "请输入要解除白名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ `grep "$ID2" whitelist.txt` ]]
		then 
			sed -i "/$ID2/d" whitelist.txt
			cd $HOME
			echo "预留位置已开放"
		else
			echo "没有这个基佬的预留位置"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	;;
	esac
	Main
}
function SetBlack()
{
 echo "============================================"
	echo "[1]加入黑名单 [2]放出黑名单 "
	read black1
	case $black1 in
	1)
	echo "============================================"
	echo "请输入要加入黑名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ ! `grep "$ID2" blacklist.txt` ]]
		then 
			echo "$ID2" >> blacklist.txt
			echo "SB已被关入地上小黑屋"
		else
			echo "这个SB已经在小黑屋"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ ! `grep "$ID2" blacklist.txt` ]]
		then 
			echo "$ID2" >> blacklist.txt
			echo "SB已被关入地下小黑屋"
		else
			echo "这个SB已经在小黑屋"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	2)
	echo "============================================"
	echo "请输入要解除黑名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ `grep "$ID2" blacklist.txt` ]]
		then 
			sed -i "/$ID2/d" blacklist.txt
			cd $HOME
			echo "已放出地上小黑屋"
		else
			echo "这个基佬不在小黑屋"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ `grep "$ID2" blacklist.txt` ]]
		then 
			sed -i "/$ID2/d" blacklist.txt
			cd $HOME
			echo "已放出地下小黑屋"
		else
			echo "这个基佬不在小黑屋"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	esac
	Main
}
function SetAdmin()
{	
	echo "============================================"
	echo "[1]提升管理员 [2]解除管理员 "
	read admin1
	case $admin1 in
	1)
	echo "============================================"
	echo "请输入要提升管理员的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ ! `grep "$ID2" adminlist.txt` ]]
		then 
			echo "$ID2" >> adminlist.txt
			echo "地上管理员已设置"
		else
			echo "这个基佬已经是管理员"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ ! `grep "$ID2" adminlist.txt` ]]
		then 
			echo "$ID2" >> adminlist.txt
			echo "地下管理员已设置"
		else
			echo "这个基佬已经是管理员"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	2)
	echo "============================================"
	echo "请输入要解除管理员的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ `grep "$ID2" adminlist.txt` ]]
		then 
			sed -i "/$ID2/d" adminlist.txt
			cd $HOME
			echo "地上管理员已移除"
		else
			echo "这个基佬不是管理员"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber
		if [[ `grep "$ID2" adminlist.txt` ]]
		then 
			sed -i "/$ID2/d" adminlist.txt
			cd $HOME
			echo "地下管理员已移除"
		else
			echo "这个基佬不是管理员"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	esac
	Main
}
function Listmanage()
{
 echo "============================================"
 echo "存档目录"
	cd $HOME
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "请输入要管理Mod的存档代码"
	read filenumber
 while :
 do
	echo "============================================"
	echo "[1]设置管理员 [2]管理黑名单 [3]管理白名单"
	read list1
	case $list1 in
		1)SetAdmin
		break;;
		2)SetBlack
		break;;
		3)SetWhite
		break;;
	esac
 done
}
function RemMod()
{
 while :
 do
	echo "============================================"
	echo "请输入要移除的modID（返回主菜单输入0）"
	read ID1
	case $ID1 in
		0)break;;
		*)
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master
		if [[ `grep "$ID1" modoverrides.lua` ]]
		then 
			sed -i "/$ID1/d" modoverrides.lua
			cd $HOME
			echo "地上世界Mod移除完成"
		else
			echo "地上世界该Mod不存在"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Caves
		if [[ `grep "$ID1" modoverrides.lua` ]]
		then 
			sed -i "/$ID1/d" modoverrides.lua
			cd $HOME
			echo "地下世界Mod移除完成"
		else
			echo "地下世界该Mod不存在"
		fi
	else
		echo "该存档没有地下世界"
	fi
	esac
 done
 Main
}
function AddMod()
{
 while :
 do
	echo "============================================"
	echo "请输入要添加的modID（返回主菜单输入0）"
    read ID1
	case $ID1 in
		0)break;;
		*)
			if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master ]
			then
				cd ./.klei/DoNotStarveTogether/$filenumber/Master
				if [[ ! `grep "$ID1" "modoverrides.lua"` ]]
				then 
					sed -i '$d' modoverrides.lua
					echo "[\"workshop-$ID1\"]={ configuration_options={  }, enabled=true }," >> modoverrides.lua
					echo "}" >> modoverrides.lua
					cd $HOME
					mod3=1
					echo "地上世界Mod添加完成"
				else
					echo "地上世界该Mod已存在"
				fi
			else
				echo "该存档没有地上世界"
				mod3=0
			fi
			cd $HOME 
			if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves ]
			then
				cd ./.klei/DoNotStarveTogether/$filenumber/Caves
				if [[ ! `grep "$ID1" modoverrides.lua` ]]
				then 
					sed -i '$d' modoverrides.lua
					echo "[\"workshop-$ID1\"]={ configuration_options={  }, enabled=true }," >> modoverrides.lua
					echo "}" >> modoverrides.lua
					cd $HOME
					mod4=$[mod3+1]
					echo "地下世界Mod添加完成"
				else
					echo "地下世界该Mod已存在"
				fi
			else
				echo "该存档没有地下世界"
				mod4=$[mod3+0]
			fi
			cd "./Steam/steamapps/common/DSTServer/mods"
				if [[ ! `grep "$ID1" dedicated_server_mods_setup.lua` ]]
				then        
					echo "ServerModSetup(\"$ID1\")" >> dedicated_server_mods_setup.lua
				fi
			cd "$HOME"
			case mod4 in
				0)  echo "该存档不存在"
				;;
				*)
				;;
			esac
			echo "$mod4"
	esac
 done
 Main
}
function Modmanage()
{
 echo "============================================"
 echo "存档目录"
	cd $HOME
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "请输入要管理Mod的存档代码"
	read filenumber
 while :
 do
 echo "============================================"
 echo "[1]添加Mod [2]移除Mod [3]清空MOD（慎用）"
 read mod1
	case $mod1 in
		1)AddMod
		break;;
		2)RemMod
		break;;
		3)echo "请再次输入要清空Mod的存档代码"
		  read filenumber
		  if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master ]
		  then 
		  echo "return {
				 }" > ./.klei/DoNotStarveTogether/$filenumber/Master/modoverrides.lua
		  fi
		  if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves ]
		  then 
		  echo "return {
				 }" > ./.klei/DoNotStarveTogether/$filenumber/Caves/modoverrides.lua
		  fi
		  echo "Mod已清空"
		break;;
	esac	
 done
}
function Delete()
{
	echo "============================================"
	echo "存档目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}' 
	echo "请输入要删除的存档代码"
	read filenumber
		cd "./.klei/DoNotStarveTogether"
		if [ -d $filenumber/Master/save ]
		then
		rm -r $filenumber/Master/save
		fi
		if [ -d $filenumber/Caves/save ]
		then
		rm -r $filenumber/Caves/save
		fi
		echo "存档已删除"
		if [ -f "${filenumber}.tar.gz" ] 
		then
			echo "是否删除备份？[y/n]"
			read delbackup1
				case delbackup1 in
					1)rm ${filenumber}.tar.gz
					echo "备份已删除"
					;;
					2)
					;;
				esac
		fi
		cd $HOME
		Filemanage
}
function Recovery()
{
	echo "============================================"
	echo "存档目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}' 
	echo "请输入要恢复的存档代码"
	read filenumber 
		cd "./.klei/DoNotStarveTogether"
		if [ -f "${filenumber}.tar.gz" ]
		then
			echo "存档已找到，正在恢复"
			if [ -d "$filenumber" ]
			then
				rm -r $filenumber
			fi
			tar -zxf ${filenumber}.tar.gz $filenumber
			echo "存档已恢复"
		else
			echo "存档未找到"
		fi
		cd $HOME
		Filemanage
			
}
function Backup()
{
	echo "============================================"
	echo "存档目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "请输入要备份的存档代码"
	read filenumber
		cd "./.klei/DoNotStarveTogether"
		if [ -d "$filenumber" ]
		then
			if [ ! -f "${filenumber}.tar.gz" ]
			then
				tar -zcf ${filenumber}.tar.gz $filenumber
				echo  "备份成功"
			else
			echo "备份已存在，是否覆盖？[y/n]"
				read backup2
				case $backup2 in
					y)tar -zcf ${filenumber}.tar.gz $filenumber
					  echo  "备份成功"
					  cd $HOME
					  Filemanage
					;;
					n)cd $HOME
					  Filemanage
				esac
			fi
		else 
			echo "该存档不存在"
		fi
		cd $HOME
		Filemanage
}

function Delall()
{
	echo "============================================"
	echo "存档槽目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "请输入要全部删除的存档槽代码"
	read filenumber
	rm -fr $HOME/.klei/DoNotStarveTogether/$filenumber
	echo "$filenumber 槽里的内容已经全部被删除"
	Main
}

function Filemanage()
{
	echo "============================================"
	echo "[1]备份存档 [2]恢复存档 [3]删除存档 [4]删除存档槽"
	read filemanage1
		case $filemanage1 in
			1)Backup
			;;
			2)Recovery
			;;
			3)Delete
			;;
			4)Delall
			;;
			*)
			echo "指令无效"
			Filemanage
			;;
		esac

}
function StartCaves()
{
	echo "#!/bin/bash

	gamesPath=\"Steam/steamapps/common/Don't Starve Together Dedicated Server/bin\"
	cd \"\$HOME\"
	cd \"\$gamesPath\"
	run_shared=(./dontstarve_dedicated_server_nullrenderer)
	run_shared+=(-console)
	run_shared+=(-cluster "$filenumber")
	run_shared+=(-monitor_parent_process $)
	
	\"\${run_shared[@]}\" -shard Caves" > ./.klei/DoNotStarveTogether/$filenumber/startcaves.sh
	cd ./.klei/DoNotStarveTogether/$filenumber
	chmod u+x ./startcaves.sh
	cd $HOME
	echo "cluster_name=$filenumber" > $HOME/.klei/cluster.txt
	screen -S "DST_Caves $filenumber" "./.klei/DoNotStarveTogether/$filenumber/startcaves.sh"
}
function StartMaster()
{
	echo "#!/bin/bash

	gamesPath=\"Steam/steamapps/common/Don't Starve Together Dedicated Server/bin\"
	cd \"\$HOME\"
	cd \"\$gamesPath\"
	run_shared=(./dontstarve_dedicated_server_nullrenderer)
	run_shared+=(-console)
	run_shared+=(-cluster "$filenumber")
	run_shared+=(-monitor_parent_process $)
	
	\"\${run_shared[@]}\" -shard Master" > ./.klei/DoNotStarveTogether/$filenumber/startmaster.sh
	cd ./.klei/DoNotStarveTogether/$filenumber
	chmod u+x ./startmaster.sh
	cd $HOME
	echo "cluster_name=$filenumber" > $HOME/.klei/cluster.txt
	screen -S "DST_Master $filenumber" "./.klei/DoNotStarveTogether/$filenumber/startmaster.sh"
}

function Serversetting2()
{
gamemodeen="无尽"
gamemode="endless"
pvpen="否"
pvp="false"
styleen="合作"
style="cooperative"
pauseen="是"
pause="true"
number=6
conen="是"
con="true"
voteen="否"
vote="false"
kicken="是"
kick="true"
name="名称"
passwords="xzy75"
introduction=""
serverip="127.0.0.1"
key="pds-g^KU_HqKLtX3j^PfmzQd7ZhPZNA83j8kBGxGw0NW+35d8zjUg7aYpYWdM="
ifgroupen="否"
ifgroup="false"

while :
do 
clear
echo "
[1]模式：                $gamemodeen
[2]是否开启PVP:          $pvpen
[3]风格:                 $styleen
[4]是否开启无人暂停:     $pauseen
[5]最大玩家数量:         $number
[6]是否打开控制台:       $conen
[7]是否允许投票重置世界: $voteen
[8]是否允许投票踢人:     $kicken
[9]服务器名称:           $name
[10]服务器密码:          $passwords
[11]服务器介绍:          $introduction
[12]饥荒令牌：
$key
[13]是否加入群组:		 $ifgroupen
[14]地上服务器外网ip：   $serverip
" 
echo "============================================"
echo "请输入需要修改的项目的编号，输入0结束"
read chioce
case $chioce in
	1)
	echo "请选择模式：[1]无尽 [2]生存 [3]荒野"
	read chioce1
	case $chioce1 in
		1)
		gamemodeen="无尽"
		gamemode="endless"
		;;
		2)
		gamemodeen="生存"
		gamemode="survival"
		;;
		3)
		gamemodeen="荒野"
		gamemode="wilderness"
		;;
		*)
		echo "非法输入,默认无尽"
		gamemodeen="无尽"
		gamemode="endless"
		;;
	esac
	;;
	2)
	echo "是否开启PVP?[y/n]"
	read chioce2
	case $chioce2 in
		y)
		pvpen="是"
		pvp="true"
		;;
		n)
		pvpen="否"
		pvp="false"
		;;
		*)
		echo "非法输入，默认为否"
		pvpen="否"
		pvp="false"
		;;
	esac
	;;
	3)
	echo "请选择风格：[1]休闲 [2]合作 [3]竞赛 [4]疯狂"
	read chioce3
	case $chioce3 in
		1)
		styleen="休闲"
		style="social"
		;;
		2)
		styleen="合作"
		style="cooperative"
		;;
		3)
		styleen="竞赛"
		style="competitive"
		;;
		4)
		styleen="疯狂"
		style="madness"
		;;
		*)
		echo "非法输入,默认合作"
		styleen="合作"
		style="cooperative"
		;;
	esac
	;;
	4)
	echo "是否开启无人暂停[y/n]"
	read chioce4
	case $chioce4 in
		y)
		pauseen="是"
		pause="true"
		;;
		n)
		pauseen="否"
		pause="false"
		;;
		*)
		echo "非法输入，默认为是"
		pauseen="是"
		pause="true"
		;;
	esac
	;;
	5)
	echo "请输入最大玩家数量"
	read number
	;;
	6)
	echo "是否开启控制台[y/n]"
	read chioce6
	case $chioce6 in
		y)
		conen="是"
		con="true"
		;;
		n)
		conen="否"
		con="false"
		;;
		*)
		echo "非法输入，默认为是"
		conen="是"
		con="true"
		;;
	esac
	;;
	7)
	echo "是否允许投票重置世界?[y/n]"
	read chioce7
	case $chioce7 in
		y)
		voteen="是"
		vote="true"
		;;
		n)
		voteen="否"
		vote="false"
		;;
		*)
		echo "非法输入，默认为否"
		voteen="否"
		vote="false"
		;;
	esac
	;;
	8)
	echo "是否允许投票踢人[y/n]"
	read chioce6
	case $chioce6 in
		y)
		kicken="是"
		kick="true"
		;;
		n)
		kicken="否"
		kick="false"
		;;
		*)
		echo "非法输入，默认为是"
		kicken="是"
		kick="true"
		;;
	esac
	;;
	9)
	echo "请输入服务器名称"
	read name
	;;
	10)
	echo "请输入服务器密码，若无请直接按enter"
	read passwords
	;;
	11)
	echo "请输入服务器介绍，若无请直接按enter"
	read introduction
	;;
	12)
	echo "请输入你的饥荒令牌"
	read key
	;;
	13)
	echo "是否加入群组？[y/n]"
	read chioce13
	case $chioce13 in
		y)
		ifgroup="true"
		ifgroupen="是(已设置)"
		echo "请输入Steam群组数字id"
		read numberen
		echo "群组管理是否自动成为服务器管理？[y/n]"
		read adminc
		case $adminc in
			y)
			admin="true"
			;;
			n)
			admin="false"
			;;
			*)
			echo "非法输入,默认为是"
			admin="true"
			;;
		esac
		echo "是否只允许Steam群组成员加入服务器？[y/n]"
		read groupc
		case $groupc in 
			y)
			group="true"
			;;
			n)
			group="false"
			;;
			*)
			echo "非法输入,默认为否"
			group="false"
			;;
		esac
		;;
		n)
		echo "不加入群组"
		ifgroup="false"
		ifgroupen="否"
		;;
		*)
		echo "非法输入，默认不加入"
		ifgroup="false"
		ifgroupen="否"
		;;
	esac
	;;
	14)
	echo "请输入地上服务器外网ip"
	read serverip
	;;
	0)
	break
	;;
esac
done

echo "$key" > ./.klei/DoNotStarveTogether/$filenumber/cluster_token.txt

echo "[GAMEPLAY]
game_mode = $gamemode
max_players = $number
pvp = $pvp
pause_when_empty = $pause
vote_enabled = $vote
vote_kick_enabled = $kick


[NETWORK]
cluster_description = $description
cluster_name = $name
cluster_intention = $style
cluster_password = $passwords


[MISC]
console_enabled = $con


[SHARD]
shard_enabled = true
bind_ip = 0.0.0.0
master_ip = $serverip
master_port = 10889
cluster_key = supersecretkey" > ./.klei/DoNotStarveTogether/$filenumber/cluster.ini

if [ "$ifgroup" == "true" ];then
echo "

[STEAM]
steam_group_admins = $admin
steam_group_id = $numberen
steam_group_only = $group 
" >> "$HOME/.klei/DoNotStarveTogether/$filenumber/cluster.ini"
fi

clear
echo "服务器配置完成！"
}

function Serversetting1()
{
gamemodeen="无尽"
gamemode="endless"
pvpen="否"
pvp="false"
styleen="合作"
style="cooperative"
pauseen="是"
pause="true"
number=6
conen="是"
con="true"
voteen="否"
vote="false"
kicken="是"
kick="true"
name="服务器名称"
passwords="xzy75"
introduction=""
key="pds-g^KU_HqKLtX3j^PfmzQd7ZhPZNA83j8kBGxGw0NW+35d8zjUg7aYpYWdM="
ifgroupen="否"
ifgroup="false"

while :
do 
clear
echo "============================================
[1]模式：                $gamemodeen
[2]是否开启PVP:          $pvpen
[3]风格:                 $styleen
[4]是否开启无人暂停:     $pauseen
[5]最大玩家数量:         $number
[6]是否打开控制台:       $conen
[7]是否允许投票重置世界: $voteen
[8]是否允许投票踢人:     $kicken
[9]服务器名称:           $name
[10]服务器密码:          $passwords
[11]服务器介绍:          $introduction
[12]饥荒令牌：
$key
[13]是否加入STEAM群组    $ifgroupen
" 
echo "============================================"
echo "请输入需要修改的项目的编号，输入0结束"
read chioce
case $chioce in
	1)
	echo "请选择模式：[1]无尽 [2]生存 [3]荒野"
	read chioce1
	case $chioce1 in
		1)
		gamemodeen="无尽"
		gamemode="endless"
		;;
		2)
		gamemodeen="生存"
		gamemode="survival"
		;;
		3)
		gamemodeen="荒野"
		gamemode="wilderness"
		;;
		*)
		echo "非法输入,默认无尽"
		gamemodeen="无尽"
		gamemode="endless"
		;;
	esac
	;;
	2)
	echo "是否开启PVP?[y/n]"
	read chioce2
	case $chioce2 in
		y)
		pvpen="是"
		pvp="true"
		;;
		n)
		pvpen="否"
		pvp="false"
		;;
		*)
		echo "非法输入，默认为否"
		pvpen="否"
		pvp="false"
		;;
	esac
	;;
	3)
	echo "请选择风格：[1]休闲 [2]合作 [3]竞赛 [4]疯狂"
	read chioce3
	case $chioce3 in
		1)
		styleen="休闲"
		style="social"
		;;
		2)
		styleen="合作"
		style="cooperative"
		;;
		3)
		styleen="竞赛"
		style="competitive"
		;;
		4)
		styleen="疯狂"
		style="madness"
		;;
		*)
		echo "非法输入,默认合作"
		styleen="合作"
		style="cooperative"
		;;
	esac
	;;
	4)
	echo "是否开启无人暂停[y/n]"
	read chioce4
	case $chioce4 in
		y)
		pauseen="是"
		pause="true"
		;;
		n)
		pauseen="否"
		pause="false"
		;;
		*)
		echo "非法输入，默认为是"
		pauseen="是"
		pause="true"
		;;
	esac
	;;
	5)
	echo "请输入最大玩家数量"
	read number
	;;
	6)
	echo "是否开启控制台[y/n]"
	read chioce6
	case $chioce6 in
		y)
		conen="是"
		con="true"
		;;
		n)
		conen="否"
		con="false"
		;;
		*)
		echo "非法输入，默认为是"
		conen="是"
		con="true"
		;;
	esac
	;;
	7)
	echo "是否允许投票重置世界?[y/n]"
	read chioce7
	case $chioce7 in
		y)
		voteen="是"
		vote="true"
		;;
		n)
		voteen="否"
		vote="false"
		;;
		*)
		echo "非法输入，默认为否"
		voteen="否"
		vote="false"
		;;
	esac
	;;
	8)
	echo "是否允许投票踢人[y/n]"
	read chioce6
	case $chioce6 in
		y)
		kicken="是"
		kick="true"
		;;
		n)
		kicken="否"
		kick="false"
		;;
		*)
		echo  "非法输入，默认为是"
		kicken="是"
		kick="true"
		;;
	esac
	;;
	9)
	echo "请输入服务器名称"
	read name
	;;
	10)
	echo "请输入服务器密码，若无请直接按enter"
	read passwords
	;;
	11)
	echo "请输入服务器介绍，若无请直接按enter"
	read introduction
	;;
	12)
	echo "请输入你的饥荒令牌"
	read key
	;;
	13)
	echo "是否加入群组？[y/n]"
	read chioce13
	case $chioce13 in
		y)
		ifgroup="true"
		ifgroupen="是(已设置)"
		echo "请输入Steam群组数字id"
		read numberen
		echo "群组管理是否自动成为服务器管理？[y/n]"
		read adminc
		case $adminc in
			y)
			admin="true"
			;;
			n)
			admin="false"
			;;
			*)
			echo "非法输入,默认为是"
			admin="true"
			;;
		esac
		echo "是否只允许Steam群组成员加入服务器？[y/n]"
		read groupc
		case $groupc in 
			y)
			group="true"
			;;
			n)
			group="false"
			;;
			*)
			echo "非法输入,默认为否"
			group="false"
			;;
		esac
		;;
		n)
		echo "不加入群组"
		ifgroup="false"
		ifgroupen="否"
		;;
		*)
		echo "非法输入，默认不加入"
		ifgroup="false"
		ifgroupen="否"
		;;
	esac
	;;
	0)
	break
	;;
esac
done

echo "$key" > ./.klei/DoNotStarveTogether/$filenumber/cluster_token.txt

echo "[GAMEPLAY]
game_mode = $gamemode
max_players = $number
pvp = $pvp
pause_when_empty = $pause
vote_enabled = $vote
vote_kick_enabled = $kick


[NETWORK]
cluster_description = $description
cluster_name = $name
cluster_intention = $style
cluster_password = $passwords


[MISC]
console_enabled = $con


[SHARD]
shard_enabled = true
bind_ip = 127.0.0.1
master_ip = 127.0.0.1
master_port = 10889
cluster_key = supersecretkey" > ./.klei/DoNotStarveTogether/$filenumber/cluster.ini

if [ "$ifgroup" == "true" ];then
echo "

[STEAM]
steam_group_admins = $admin
steam_group_id = $numberen
steam_group_only = $group 
" >> "$HOME/.klei/DoNotStarveTogether/$filenumber/cluster.ini"
fi
clear
echo "服务器配置完成！"
}

function CreatCavesini()
{
	echo "[NETWORK]
	server_port = 11001


	[SHARD]
	is_master = false
	name = Caves


	[STEAM]
	master_server_port = 27019
	authentication_port = 8769" > ./.klei/DoNotStarveTogether/$filenumber/Caves/server.ini
	echo "return {
	}" >> "./.klei/DoNotStarveTogether/$filenumber/Caves/modoverrides.lua"
}

function CreatMasterini()
{
	echo "[NETWORK]
	server_port = 11000

	[SHARD]
	is_master = true

	[STEAM]
	master_server_port = 27018
	authentication_port = 8768" > ./.klei/DoNotStarveTogether/$filenumber/Master/server.ini
	echo "return {
	}" >> "./.klei/DoNotStarveTogether/$filenumber/Master/modoverrides.lua"
}

function Cavesfile()
{
echo "============================================"
echo "请输入存档代码"
read filenumber
	if [ ! -d "./klei/DoNotStarveTogether/$filenumber" ]
	then 
		mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Caves
	fi
CreatCavesini
Serversetting2
cavesettings
StartCaves
}
function Masterfile()
{
echo "============================================"
echo "请输入存档代码"
read filenumber
	if [ ! -d "./klei/DoNotStarveTogether/$filenumber" ]
	then 
		mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Master
	fi
CreatMasterini
Serversetting2
mastersettings
StartMaster
}

function MasterCaves()
{
echo "============================================"
while :
do
echo "[1]地上 [2]地下"
read masterCaves1
	case $masterCaves1 in
		1)Masterfile
		break;;
		2)Cavesfile
		break;;
	esac
done
}

function Modechose()
{
echo "============================================"
while :
do
echo "[1]单服务器搭建 [2]双服务器搭建 "
	read servermode
	case $servermode in
		1)Newfile
		break;;
		2)MasterCaves
		break;;
	esac
done	
}

function Filechose()
{ 
	if [  -d "./.klei/DoNotStarveTogether/$filenumber/Master" ]; then
		zzz=1
	else
		zzz=0
	fi
	if [ -d "./.klei/DoNotStarveTogether/$filenumber/Caves" ] ; then
		zz=$[zzz+2]
	else
		zz=$[zzz+4]
	fi
	case $zz in
			2)StartCaves
			;;
			3)StartMaster;StartCaves;
			;;
			4)echo "存档没有内容，是否新建？[Y/n]"
			  read newfile1
			  case $newfile1 in
				y)Modechose
				;;
				n)Main
			  esac
			;;
			5)StartMaster
			;;
	esac
}

function setworld()
{
	mastersettings
	cavesettings
}

# 地上世界设置
function mastersettings()
	{
	    alternatehunt="default"
	    angrybees="default"
	    antliontribute="default"
	    autumn="default"
	    bearger="default"
	    beefalo="default"
	    beefaloheat="default"
	    bees="default"
	    berrybush="default"
	    birds="default"
	    boons="default"
	    branching="default"
	    butterfly="default"
	    buzzard="default"
	    cactus="default"
	    carrot="default"
	    catcoon="default"
	    chess="default"
	    day="default"
	    deciduousmonster="default"
	    deerclops="default"
	    disease_delay="default"
	    dragonfly="default"
	    flint="default"
	    flowers="default"
	    frograin="default"
	    goosemoose="default"
	    grass="default"
	    houndmound="default"
	    hounds="default"
	    hunt="default"
	    krampus="default"
	    layout_mode="LinkNodesByKeys"
	    liefs="default"
	    lightning="default"
	    lightninggoat="default"
	    loop="default"
	    lureplants="default"
	    marshbush="default"
	    merm="default"
	    meteorshowers="default"
	    meteorspawner="default"
	    moles="default"
	    mushroom="default"
	    penguins="default"
	    perd="default"
	    petrification="default"
	    pigs="default"
	    ponds="default"
	    prefabswaps_start="default"
	    rabbits="default"
	    reeds="default"
	    regrowth="default"
	    roads="default"
	    rock="default"
	    rock_ice="default"
	    sapling="default"
	    season_start="default"
	    specialevent="default"
	    spiders="default"
	    spring="default"
	    start_location="default"
	    summer="default"
	    tallbirds="default"
	    task_set="default"
	    tentacles="default"
	    touchstone="default"
	    trees="default"
	    tumbleweed="default"
	    walrus="default"
	    weather="default"
	    wildfires="default"
	    winter="default"
	    world_size="small"
	    wormhole_prefab="wormhole"
	    while :
		do	
	    echo -e "\e[33m==================================地上世界设置==================================\e[0m"
	    echo -e "\e[92m====================================世界环境====================================\e[0m"
		printf "%s\t %s\t %s\t\n" [1]生物群落：$task_set [2]初始环境：$start_location [3]地图大小：$world_size
		printf "%s\t %s\t %s\t\n" [4]岔路地形：$branching [5]环状地形：$loop [6]节日活动：$specialevent
		printf "%s\t %s\t %s\t\n" [7]秋天：$autumn [8]冬天：$winter [9]春天：$spring
		printf "%s\t %s\t %s\t\n" [10]夏天：$summer [11]开始季节：$season_start [12]昼夜长短：$day
		printf "%s\t %s\t %s\t\n" [13]再生速度：$regrowth [14]作物患病：$disease_delay [15]初始多样性：$prefabswaps_start
		printf "%s\t %s\t %s\t\n" [16]石化速率：$petrification [17]雨：$weather [18]复活石：$touchstone
		printf "%s\t %s\t %s\t\n" [19]前辈：$boons [20]青蛙雨：$frograin [21]自燃：$wildfires
		printf "%s\t %s\t %s\t\n" [22]闪电：$lightning
		echo -e "\e[92m======================================资源======================================\e[0m"
		printf "%s\t %s\t %s\t\n" [25]树枝：$sapling [23]花：$flowers [24]草：$grass
		printf "%s\t %s\t %s\t\n" [26]风滚草：$tumbleweed [27]芦苇：$reeds [28]树木：$trees
		printf "%s\t %s\t %s\t\n" [29]燧石：$flint [30]岩石：$rock [31]冰川：$rock_ice
		printf "%s\t %s\t %s\t\n" [32]陨石区域：$meteorshowers [33]陨石频率：$meteorspawner [34]尖刺灌木：$marshbush
		echo -e "\e[92m======================================食物======================================\e[0m"
		printf "%s\t %s\t %s\t\n" [35]浆果从：$berrybush [36]蘑菇：$mushroom [37]萝卜：$carrot
		printf "%s\t %s\t %s\t\n" [38]仙人掌：$cactus
		echo -e "\e[92m======================================动物======================================\e[0m"
		printf "%s\t %s\t %s\t\n" [39]足迹：$alternatehunt [40]杀人蜂：$angrybees [41]牛：$beefalo
		printf "%s\t %s\t %s\t\n" [42]发情的牛：$beefaloheat [43]蜜蜂：$bees [44]鸟：$birds
		printf "%s\t %s\t %s\t\n" [45]蝴蝶：$butterfly [46]秃鹫：$buzzard [47]浣猫：$catcoon
		printf "%s\t %s\t %s\t\n" [48]象/羊/狼：$hunt [49]池塘：$ponds [50]电羊：$lightninggoat
		printf "%s\t %s\t %s\t\n" [51]鼹鼠：$moles [52]火鸡：$perd [53]猪人：$pigs
		printf "%s\t %s\t %s\t\n" [54]兔子：$rabbits [55]高脚鸟：$tallbirds [71]企鹅：$penguins
	    echo -e "\e[92m======================================怪物======================================\e[0m"	
		printf "%s\t %s\t %s\t\n" [56]蚁狮事件：$antliontribute [57]齿轮怪：$chess [58]猎犬丘：$houndmound
		printf "%s\t %s\t %s\t\n" [59]猎狗袭击：$hounds [60]坎普斯：$krampus [61]树精：$liefs
		printf "%s\t %s\t %s\t\n" [62]鱼人：$merm [63]食人花：$lureplants [64]蜘蛛：$spiders
		printf "%s\t %s\t %s\t\n" [65]触手：$tentacles [66]海象巢：$walrus [67]独眼巨鹿：$deerclops
		printf "%s\t %s\t %s\t\n" [68]鹿角鹅：$goosemoose [69]龙蝇：$dragonfly [70]熊：$bearger
	    echo -e "\e[33m================================================================================\e[0m"
		echo -e "\e[92m请选择你要更改的选项(修改完毕输入数字 0 确认修改并退出)：\e[0m\c"
		read cmd
		case $cmd in
			0)
			setmasterlevel
			break
			;;
			1)
			echo -e "\e[92m请选择生物群落：1.经典（没有巨人）  2.默认(联机)\e[0m"
		    read smaster
		    case $smaster in
			1)
			    task_set="classic"
				;;
				2)
				task_set="default"
				;;
		    esac
			;;
			2)
			echo -e "\e[92m请选择初始环境：1.三箱  2.永夜 3.默认\e[0m"
		    read smaster
		    case $smaster in
			1)
			    start_location="plus"
				;;
			    2)
			    start_location="darkness"
				;;
			    3)
			    start_location="default"
				;;
		    esac
		    ;;
			3)
			echo -e "\e[92m请选择地图大小：1.小型 2.中等 3.巨型 4.默认（大型）\e[0m"
		    read scaves
		    case $scaves in
			1)
			    world_size="small"
				;;
			    2)
			    world_size="medium"
				;;
			    3)
			    world_size="huge"
				;;
			    4)
			    world_size="default"
				;;
		    esac
			;;
			4)
			echo -e "\e[92m请设置岔路地形：1.无 2.最少  3.默认  4.最多\e[0m"
		    branching="default"
		    read scaves
		    case $scaves in
			1)
			    branching="never"
				;;
			    2)
			    branching="least"
				;;
			    3)
			    branching="default"
				;;
				4)
				branching="most"
				;;
		    esac
			;;
			5)
			echo -e "\e[92m请设置环状地形：1.无  2. 默认  3.总是\e[0m"
		    loop="default"
		    read scaves
		    case $scaves in
			1)
			    loop="never"
				;;
			    2)
				loop="default"
				;;
				3)
			    loop="always"
				;;
		    esac
			;;
			6)
			echo -e "\e[92m请选择要参与的活动：1.无  2.默认  3.万圣夜  4.冬季盛宴  5.鸡年吉祥\e[0m"
		    read scaves
		    case $scaves in
			1)
			    specialevent="none"
				;;
			    2)
				specialevent="default"
				;;
				3)
			    specialevent="hallowed_nights"
				;;
			    4)
			    specialevent="winters_feast"
				;;
			    5)
			    specialevent="year_of_the_gobbler"
				;;
		    esac
		    ;;
			7)
			echo -e "\e[92m请设置秋天长度：1.无 2.很短 3.短 7.默认 4.长 5.很长 6.随机\e[0m"
		    setseason
		    autumn="$season"
		    ;;
			8)
		    echo -e "\e[92m请设置冬天长度：1.无 2.很短 3.短 7.默认 4.长 5.很长 6.随机\e[0m"
		    setseason
		    winter="$season"
		;;
			9)
		    echo -e "\e[92m请设置春天长度：1.无 2.很短 3.短 7.默认 4.长 5.很长 6.随机\e[0m"
		    setseason
		    spring="$season"
		    ;;
			10)
		    echo -e "\e[92m请设置夏天长度：1.无 2.很短 3.短 7.默认 4.长 5.很长 6.随机\e[0m"
		    setseason
		    summer="$season"
			;;
			11)
			echo -e "\e[92m请设置开始季节：7.默认（秋季） 1. 冬季  2.春季  3.夏季  4.秋或春  5.冬或夏  6.随机\e[0m"    
		    read scaves
		    case $scaves in
			1)
			    season_start="winter"
				;;
			    2)
			    season_start="spring"
				;;
			    3)
			    season_start="summer"
				;;
			    4)
			    season_start="autumnorspring"
				;;
			    5)
			    season_start="winterorsummer"
				;;
			    6)
			    season_start="random"
				;;
				7)
				season_start="default"
				;;
		    esac
			;;
			12)
			echo -e "\e[92m请设置昼夜长短：\e[0m"
		    echo -e "\e[92m      10.默认           1.长白昼\e[0m"
		    echo -e "\e[92m      2.长黄昏          3.长夜晚\e[0m"
		    echo -e "\e[92m      4.无白昼          5.无黄昏\e[0m"
		    echo -e "\e[92m      6.无夜晚          7.仅有白昼\e[0m"
		    echo -e "\e[92m      8.仅有黄昏        9.仅有夜晚\e[0m"
		    read scaves
		    case $scaves in
			1)
			    day="longday"
				;;
			    2)
			    day="longdusk"
				;;
			    3)
			    day="longnight"
				;;
			    4)
			    day="noday"
				;;
			    5)
			    day="nodusk"
				;;
			    6)
			    day="nonight"
				;;
			    7)
			    day="onlyday"
				;;
			    8)
			    day="onlydusk"
				;;
			    9)
			    day="onlynight"
				;;
			    10)
			    day="default"
				;;
		    esac
			;;
			13)
			echo -e "\e[92m请设置再生速度：1.极慢 2.慢 5.默认 3.快 4.极快\e[0m"
		    read scaves
		    case $scaves in
			1)
			    regrowth="veryslow"
				;;
			    2)
			    regrowth="slow"
				;;
			    3)
			    regrowth="fast"
				;;
			    4)
			    regrowth="veryfast"
				;;
				5)
				regrowth="default"
				;;
		    esac
			;;
			14)
			echo -e "\e[92m请设置作物患病：1.无 2.随机 3.慢 5.默认 4.快\e[0m"	    
		    read scaves
		    case $scaves in
			1)
			    disease_delay="none"
				;;
			    2)
			    disease_delay="random"
				;;
			    3)
			    disease_delay="long"
				;;
			    4)
			    disease_delay="short"
				;;
				5)
				disease_delay="default"
				;;
		    esac
			;;
			15)
			echo -e "\e[92m请设置初始多样性：1.经典 3.默认 2.高度随机\e[0m"
		    read scaves
		    case $scaves in
			1)
			    prefabswaps_start="classic"
				;;
			    2)
			    prefabswaps_start="highly random"
				;;
				3)
				prefabswaps_start="default"
				;;
		    esac
			;;
			16)
			echo -e "\e[92m请设置树石化速率：1.无 2.慢 5.默认 3.快 4.极快\e[0m"
		    read scaves
		    case $scaves in
			1)
			    petrification="none"
				;;
			    2)
			    petrification="few"
				;;
			    3)
			    petrification="many"
				;;
			    4)
			    petrification="max"
				;;
				5)
				petrification="default"
				;;
		    esac
			;;
			19)
			echo -e "\e[92m请设置前辈：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    boons="$preset"
		    ;;
		    18)
			echo -e "\e[92m请设置复活台：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    touchstone="$preset"
		    ;;
		    17)
			echo -e "\e[92m请设置雨：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    weather="$preset"
		    ;;
		    39)
			echo -e "\e[92m请设置足迹：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    alternatehunt="$preset"
		    ;;
		    40)
			echo -e "\e[92m请设置杀人蜂巢穴：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    angrybees="$preset"
		    ;;
		    70)
			echo -e "\e[92m请设置秋季BOSS：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    bearger="$preset"
		    ;;
		    41)
			echo -e "\e[92m请设置牛：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    beefalo="$preset"
		    ;;
		    42)
			echo -e "\e[92m请设置牛发情频率：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    beefaloheat="$preset"
		    ;;
		    43)
			echo -e "\e[92m请设置蜜蜂巢穴：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    bees="$preset"
		    ;;
		    44)
			echo -e "\e[92m请设置鸟：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    birds="$preset"
		    ;;
		    24)
		    echo -e "\e[92m请设置草：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    grass="$preset"
		    ;;
		    45)
			echo -e "\e[92m请设置蝴蝶：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    butterfly="$preset"
		    ;;
		    46)
			echo -e "\e[92m请设置秃鹫：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    buzzard="$preset"
		    ;;
		    38)
			echo -e "\e[92m请设置仙人掌：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    cactus="$preset"
		    ;;
		    37)
			echo -e "\e[92m请设置胡萝卜：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    carrot="$preset"
		    ;;
		    47)
			echo -e "\e[92m请设置浣熊猫：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    catcoon="$preset"
		    ;;
		    67)
			echo -e "\e[92m请设置冬季BOSS：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    deerclops="$preset"
		    ;;
		    68)
			echo -e "\e[92m请设置春季BOSS：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    goosemoose="$preset"
		    ;;
		    69)
			echo -e "\e[92m请设置夏季BOSS：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    dragonfly="$preset"
		    ;;
		    23)
			echo -e "\e[92m请设置花：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    flower="$preset"
		    ;;
		    20)
			echo -e "\e[92m请设置青蛙雨：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    frograin="$preset"
		    ;;
		    25)
			echo -e "\e[92m请设置树枝：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    sapling="$preset"
		    ;;
		    34)
			echo -e "\e[92m请设置尖刺灌木：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    marshbush="$preset"
		    ;;
		    27)
			echo -e "\e[92m请设置芦苇：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    reeds="$preset"
		    ;;
		    28)
			echo -e "\e[92m请设置树木：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    trees="$preset"	
		    ;;
		    29)
			echo -e "\e[92m请设置燧石：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    flint="$preset"
		;;	
		    30)
			echo -e "\e[92m请设置岩石：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    rock="$preset"
		    ;;
		    58)
			echo -e "\e[92m请设置猎犬丘：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    houndmound="$preset"
		    ;;
		59)
			echo -e "\e[92m请设置猎犬袭击：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    hounds="$preset"
		    ;;
		    48)
			echo -e "\e[92m请设置象/羊/狼：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    hunt="$preset"
		    ;;
		60)
			echo -e "\e[92m请设置小偷 ：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    krampus="$preset"	
		;;
		35)
			echo -e "\e[92m请设置浆果丛：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    berrybush="$preset" 	
		    ;;
		    36)
			echo -e "\e[92m请设置蘑菇：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    mushroom="$preset"
		    ;;
		    22)
			echo -e "\e[92m请设置闪电：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    lightning="$preset"
		    ;;
		    50)
			echo -e "\e[92m请设置电羊：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    lightninggoat="$preset"
		    ;;
		    49)
			echo -e "\e[92m请设置池塘：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    ponds="$preset"
		;;
		    63)
			echo -e "\e[92m请设置食人花：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    lureplants="$preset"
		    ;;
		    54)
			echo -e "\e[92m请设置兔子：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    rabbits="$preset"
		    ;;
		    62)
			echo -e "\e[92m请设置鱼人：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    merm="$preset"
		    ;;
		    32)
			echo -e "\e[92m请设置陨石区域：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    meteorshowers="$preset"
		    ;;
		    33)
			echo -e "\e[92m请设置陨石频率：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    meteorspawner="$preset"  
		;;
		64)
			echo -e "\e[92m请设置蜘蛛：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    spiders="$preset"		
		    ;;
		    65)
			echo -e "\e[92m请设置触手：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    tentacles="$preset"	
		    ;;
		    57)
			echo -e "\e[92m请设置齿轮马：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    chess="$preset"
		;;
		    61)
			echo -e "\e[92m请设置树人：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    liefs="$preset"
		    ;;
		    51)
			echo -e "\e[92m请设置鼹鼠：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    moles="$preset"     	
		    ;;
		    71)
			echo -e "\e[92m请设置企鹅：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    penguins="$preset"
		    ;;
		    52)
			echo -e "\e[92m请设置火鸡：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    perd="$preset"
		    ;;
		    53)
			echo -e "\e[92m请设置猪人：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    pigs="$preset"
		    ;;
		    31)
			echo -e "\e[92m请设置冰川：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    rock_ice="$preset"
		    ;;
		    26)
			echo -e "\e[92m请设置风滚草：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    tumbleweed="$preset"
		    ;;
		    66)
			echo -e "\e[92m请设置海象巢穴：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    walrus="$preset"
		    ;;
		    21)
			echo -e "\e[92m请设置自燃：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    wildfires="$preset"
		    ;;
		    55)
			echo -e "\e[92m请设置高脚鸟：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    tallbirds="$preset"
			;;
		    56)
			echo -e "\e[92m请设置蚁狮事件：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    antliontribute="$preset"
			;;
		esac
		done
	}

# 写入地上世界设置文件 leveldataoverride.lua
function setmasterlevel()
	{
		echo "return {
	  desc=\"The World is created by GoforFun's script.\",
	  hideminimap=false,
	  id=\"SURVIVAL_TOGETHER\",
	  location=\"forest\",
	  max_playlist_position=999,
	  min_playlist_position=0,
	  name=\"Default\",
	  numrandom_set_pieces=8,
	  ordered_story_setpieces={ \"Sculptures_1\", \"Maxwell5\" },
	  override_level_string=false,
	  overrides={
	    alternatehunt=\"$alternatehunt\",
	    angrybees=\"$angrybees\",
		antliontribute=\"$antliontribute\",
	    autumn=\"$autumn\",
	    bearger=\"$bearger\",
	    beefalo=\"$beefalo\",
	    beefaloheat=\"$beefaloheat\",
	    bees=\"$bees\",
	    berrybush=\"$berrybush\",
	    birds=\"$birds\",
	    boons=\"$boons\",
	    branching=\"$branching\",
	    butterfly=\"$butterfly\",
	    buzzard=\"$buzzard\",
	    cactus=\"$cactus\",
	    carrot=\"$carrot\",
	    catcoon=\"$catcoon\",
	    chess=\"$chess\",
	    day=\"$day\",
	    deciduousmonster=\"default\",
	    deerclops=\"$deerclops\",
	    disease_delay=\"$disease_delay\",
	    dragonfly=\"$dragonfly\",
	    flint=\"$flint\",
	    flowers=\"$flower\",
	    frograin=\"$frograin\",
	    goosemoose=\"$goosemoose\",
	    grass=\"$grass\",
	    houndmound=\"$houndmound\",
	    hounds=\"$hounds\",
	    hunt=\"$hunt\",
	    krampus=\"$krampus\",
	    layout_mode=\"LinkNodesByKeys\",
	    liefs=\"$liefs\",
	    lightning=\"$lightning\",
	    lightninggoat=\"$lightninggoat\",
	    loop=\"$loop\",
	    lureplants=\"$lureplants\",
	    marshbush=\"$marshbush\",
	    merm=\"$merm\",
	    meteorshowers=\"$meteorshowers\",
	    meteorspawner=\"$meteorspawner\",
	    moles=\"$moles\",
	    mushroom=\"$mushroom\",
	    penguins=\"$penguins\",
	    perd=\"$perd\",
	    petrification=\"$petrification\",
	    pigs=\"$pigs\",
	    ponds=\"$ponds\",
	    prefabswaps_start=\"$prefabswaps_start\",
	    rabbits=\"$rabbits\",
	    reeds=\"$reeds\",
	    regrowth=\"$regrowth\",
	    roads=\"default\",
	    rock=\"$rock\",
	    rock_ice=\"$rock_ice\",
	    sapling=\"$sapling\",
	    season_start=\"$season_start\",
	    specialevent=\"$specialevent\",
	    spiders=\"$spiders\",
	    spring=\"$spring\",
	    start_location=\"$start_location\",
	    summer=\"$summer\",
	    tallbirds=\"$tallbirds\",
	    task_set=\"$task_set\",
	    tentacles=\"$tentacles\",
	    touchstone=\"$touchstone\",
	    trees=\"$trees\",
	    tumbleweed=\"$tumbleweed\",
	    walrus=\"$walrus\",
	    weather=\"$weather\",
	    wildfires=\"$wildfires\",
	    winter=\"$winter\",
	    world_size=\"$world_size\",
	    wormhole_prefab=\"wormhole\" 
	  },
	  random_set_pieces={
	    \"Sculptures_2\",
	    \"Sculptures_3\",
	    \"Sculptures_4\",
	    \"Sculptures_5\",
	    \"Chessy_1\",
	    \"Chessy_2\",
	    \"Chessy_3\",
	    \"Chessy_4\",
	    \"Chessy_5\",
	    \"Chessy_6\",
	    \"Maxwell1\",
	    \"Maxwell2\",
	    \"Maxwell3\",
	    \"Maxwell4\",
	    \"Maxwell6\",
	    \"Maxwell7\",
	    \"Warzone_1\",
	    \"Warzone_2\",
	    \"Warzone_3\" 
	  },
	  required_prefabs={ \"multiplayer_portal\" },
	  substitutes={  },
	  version=3 
	}" > "./.klei/DoNotStarveTogether/$filenumber/Master/leveldataoverride.lua"
	    echo -e "\e[92m地上世界设置完成！\e[0m"
	}

# 统一设置
function setoverride()
	{
		read s
		case $s in
		    1)
			preset="never"
			;;
			2)
			preset="rare"
			;;
			3)
			preset="often"
			;;
			4)
			preset="always"
			;;
			5)
			preset="default"
			;;
		esac
	}

# 季节设置
function setseason()
	{
		read scaves
		case $scaves in
		    1)
			season="noseason"
			;;
			2)
			season="veryshortseason"
			;;
			3)
			season="shortseason"
			;;
			4)
			season="longseason"
			;;
			5)
			season="verylongseason"
			;;
			6)
			season="random"
			;;
			7)
			season="default"
			;;
		esac
	}

# 洞穴世界设置
function cavesettings()
	{
	    banana="default"
	    bats="default"
	    berrybush="default"
	    boons="default"
	    branching="default"
	    bunnymen="default"
	    cave_ponds="default"
	    cave_spiders="default"
	    cavelight="default"
	    chess="default"
	    disease_delay="default"
	    earthquakes="default"
	    fern="default"
	    fissure="default"
	    flint="default"
	    flower_cave="default"
	    grass="default"
	    layout_mode="RestrictNodesByKey"
	    lichen="default"
	    liefs="default"
	    loop="default"
	    marshbush="default"
	    monkey="default"
	    mushroom="default"
	    mushtree="default"
	    petrification="default"
	    prefabswaps_start="default"
	    reeds="default"
	    regrowth="default"
	    roads="never"
	    rock="default"
	    rocky="default"
	    sapling="default"
	    season_start="default"
	    slurper="default"
	    slurtles="default"
	    start_location="caves"
	    task_set="cave_default"
	    tentacles="default"
	    touchstone="default"
	    trees="default"
	    weather="default"
	    world_size="small"
	    wormattacks="default"
	    wormhole_prefab="tentacle_pillar"
	    wormlights="default"
	    worms="default" 
		while :
		do
	    echo -e "\e[33m==================================洞穴世界设置==================================\e[0m"
	    echo -e "\e[92m====================================世界环境====================================\e[0m"
		printf "%s\t %s\t %s\t\n" [1]地图大小：$world_size [2]岔路地形：$branching [3]环状地形：$loop
		printf "%s\t %s\t %s\t\n" [4]再生速度：$regrowth [5]作物患病：$disease_delay [6]初始多样性：$prefabswaps_start
		printf "%s\t %s\t %s\t\n" [7]石化速率：$petrification [9]复活石：$touchstone [8]雨：$weather 
		printf "%s\t %s\t %s\t\n" [10]前辈：$boons [12]洞穴光照：$cavelight [13]地震频率：$earthquakes
		echo -e "\e[92m======================================资源======================================\e[0m"
		printf "%s\t %s\t %s\t\n" [14]蘑菇树：$mushtree [15]草：$grass [16]树枝：$sapling
		printf "%s\t %s\t %s\t\n" [18]芦苇：$reeds [19]树木：$trees [25]尖刺灌木：$marshbush
		printf "%s\t %s\t %s\t\n" [20]燧石：$flint [21]岩石：$rock [22]蕨类植物：$fern
		printf "%s\t %s\t %s\t\n" [23]荧光花：$flower_cave [24]发光浆果：$wormlights 
		echo -e "\e[92m======================================食物======================================\e[0m"
		printf "%s\t %s\t %s\t\n" [26]浆果从：$berrybush [27]蘑菇：$mushroom [28]香蕉：$banana
		printf "%s\t %s\t %s\t\n" [29]苔藓：$lichen
		echo -e "\e[92m=====================================动物======================================\e[0m"
		printf "%s\t %s\t %s\t\n" [30]洞穴池塘：$cave_ponds [31]蜗牛：$slurtles [32]啜食者：$slurper
		printf "%s\t %s\t %s\t\n" [33]兔人：$bunnymen [34]石虾：$rocky [35]猴子：$monkey
	    echo -e "\e[92m======================================怪物======================================\e[0m"	
		printf "%s\t %s\t %s\t\n" [36]蝙蝠：$bats [37]齿轮怪：$chess [38]裂缝：$fissure
		printf "%s\t %s\t %s\t\n" [39]蠕虫袭击：$wormattacks [40]触手：$tentacles [41]树精：$liefs
		printf "%s\t %s\t %s\t\n" [42]蠕虫：$worms [43]蜘蛛：$cave_spiders
	    echo -e "\e[33m================================================================================\e[0m"
		echo -e "\e[92m请选择你要更改的选项(修改完毕输入数字 0 确认修改并退出)：\e[0m\c"
		read cmd
		case $cmd in
			0)
			setcaveslevel
			break
			;;
			22)
			echo -e "\e[92m请设置蕨类植物：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    fern="$preset"
			;;
			1)
			echo -e "\e[92m请选择地图大小：1.小型 2.中等 3.巨型 4.默认（大型）\e[0m"
		    read scaves
		    case $scaves in
			1)
			    world_size="small"
				;;
			    2)
			    world_size="medium"
				;;
			    3)
			    world_size="huge"
				;;
			    4)
			    world_size="default"
				;;
		    esac
			;;
			2)
			echo -e "\e[92m请设置岔路地形：1.无 2.最少  3.默认  4.最多\e[0m"
		    branching="default"
		    read scaves
		    case $scaves in
			1)
			    branching="never"
				;;
			    2)
			    branching="least"
				;;
			    3)
			    branching="default"
				;;
				4)
				branching="most"
				;;
		    esac
			;;
			3)
			echo -e "\e[92m请设置环状地形：1.无  2. 默认  3.总是\e[0m"
		    loop="default"
		    read scaves
		    case $scaves in
			1)
			    loop="never"
				;;
			    2)
				loop="default"
				;;
				3)
			    loop="always"
				;;
		    esac
			;;
			4)
			echo -e "\e[92m请设置再生速度：1.极慢 2.慢 5.默认 3.快 4.极快\e[0m"
		    read scaves
		    case $scaves in
			1)
			    regrowth="veryslow"
				;;
			    2)
			    regrowth="slow"
				;;
			    3)
			    regrowth="fast"
				;;
			    4)
			    regrowth="veryfast"
				;;
				5)
				regrowth="default"
				;;
		    esac
			;;
			5)
			echo -e "\e[92m请设置作物患病：1.无 2.随机 3.慢 5.默认 4.快\e[0m"	    
		    read scaves
		    case $scaves in
			1)
			    disease_delay="none"
				;;
			    2)
			    disease_delay="random"
				;;
			    3)
			    disease_delay="long"
				;;
			    4)
			    disease_delay="short"
				;;
				5)
				disease_delay="default"
				;;
		    esac
			;;
		    6)
			echo -e "\e[92m请设置初始多样性：1.经典 3.默认 2.高度随机\e[0m"
		    read scaves
		    case $scaves in
			1)
			    prefabswaps_start="classic"
				;;
			    2)
			    prefabswaps_start="highly random"
				;;
				3)
				prefabswaps_start="default"
				;;
		    esac
			;;
			7)
			echo -e "\e[92m请设置树石化速率：1.无 2.慢 5.默认 3.快 4.极快\e[0m"
		    read scaves
		    case $scaves in
			1)
			    petrification="none"
				;;
			    2)
			    petrification="few"
				;;
			    3)
			    petrification="many"
				;;
			    4)
			    petrification="max"
				;;
				5)
				petrification="default"
				;;
		    esac
			;;
			12)
			echo -e "\e[92m请设置洞穴光照：1.极慢 2.慢 5.默认 3.快 4.极快\e[0m"
		    read scaves
		    case $scaves in
			1)
			    cavelight="veryslow"
				;;
			    2)
			    cavelight="slow"
				;;
			    3)
			    cavelight="fast"
				;;
			    4)
			    cavelight="veryfast"
				;;
				5)
				cavelight="default"
				;;
		    esac
			;;
			13)
			echo -e "\e[92m请设置地震频率：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    earthquakes="$preset"
		    ;;
			10)
			echo -e "\e[92m请设置前辈：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    boons="$preset"
		    ;;
		    9)
			echo -e "\e[92m请设置复活台：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    touchstone="$preset"
		    ;;
		    8)
			echo -e "\e[92m请设置雨：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    weather="$preset"
		    ;;
		    15)
		    echo -e "\e[92m请设置草：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    grass="$preset"
		    ;;
		    16)
			echo -e "\e[92m请设置树枝：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    sapling="$preset"
		    ;;
		    25)
			echo -e "\e[92m请设置尖刺灌木：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    marshbush="$preset"
		    ;;
		    18)
			echo -e "\e[92m请设置芦苇：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    reeds="$preset"
		    ;;
		    19)
			echo -e "\e[92m请设置树木：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    trees="$preset"	
		    ;;
		    20)
			echo -e "\e[92m请设置燧石：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    flint="$preset"
		;;	
		    21)
			echo -e "\e[92m请设置岩石：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    rock="$preset"
		    ;;
		26)
			echo -e "\e[92m请设置浆果丛：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    berrybush="$preset" 	
		    ;;
		    27)
			echo -e "\e[92m请设置蘑菇：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    mushroom="$preset"
		    ;;
		    30)
			echo -e "\e[92m请设置洞穴池塘：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    cave_ponds="$preset"
		;;
		    14)
			echo -e "\e[92m请设置蘑菇树：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    mushtree="$preset"
		    ;;
		    23)
			echo -e "\e[92m请设置荧光花：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    flower_cave="$preset"
		    ;;
		    24)
			echo -e "\e[92m请设置发光浆果：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    wormlights="$preset"
		    ;;
		    28)
			echo -e "\e[92m请设置香蕉：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    banana="$preset"
		    ;;
		    29)
			echo -e "\e[92m请设置苔藓：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    lichen="$preset"  
		;;
		32)
			echo -e "\e[92m请设置啜食者：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    slurper="$preset"		
		    ;;
		    40)
			echo -e "\e[92m请设置触手：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    tentacles="$preset"	
		    ;;
		    37)
			echo -e "\e[92m请设置齿轮马：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    chess="$preset"
		;;
		    19)
			echo -e "\e[92m请设置树人：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    liefs="$preset"
		    ;;
		    31)
			echo -e "\e[92m请设置蜗牛：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    slurtles="$preset"     	
		    ;;
		    35)
			echo -e "\e[92m请设置猴子：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    monkey="$preset"
		    ;;
		    34)
			echo -e "\e[92m请设置石虾：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    rocky="$preset"
		    ;;
		    33)
			echo -e "\e[92m请设置兔人：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    bunnymen="$preset"
		    ;;
		    36)
			echo -e "\e[92m请设置蝙蝠：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    bats="$preset"
		    ;;
		    43)
			echo -e "\e[92m请设置蜘蛛：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    cave_spiders="$preset"
		    ;;
		    42)
			echo -e "\e[92m请设置蠕虫：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    worms="$preset"
			;;
		    39)
			echo -e "\e[92m请设置蠕虫袭击：1.无 2.较少 5.默认 3.较多 4.大量\e[0m"
		    setoverride
		    wormattacks="$preset"
			;;
		esac
		done
	}

# 写入洞穴世界设置文件 leveldataoverride.lua
function setcaveslevel()
	{
	    echo "return {
	  background_node_range={ 0, 1 },
	  desc=\"The World is created by GoforFun's script!\",
	  hideminimap=false,
	  id=\"DST_CAVE\",
	  location=\"cave\",
	  max_playlist_position=999,
	  min_playlist_position=0,
	  name=\"The Caves\",
	  numrandom_set_pieces=0,
	  override_level_string=false,
	  overrides={
	    banana=\"$banana\",
	    bats=\"$bats\",
	    berrybush=\"$berrybush\",
	    boons=\"$boons\",
	    branching=\"$branching\",
	    bunnymen=\"$bunnymen\",
	    cave_ponds=\"$cave_ponds\",
	    cave_spiders=\"$cave_spiders\",
	    cavelight=\"$cavelight\",
	    chess=\"$chess\",
	    disease_delay=\"$disease_delay\",
	    earthquakes=\"$earthquakes\",
	    fern=\"$fern\",
	    fissure=\"$fissure\",
	    flint=\"$flint\",
	    flower_cave=\"$flower_cave\",
	    grass=\"$grass\",
	    layout_mode=\"RestrictNodesByKey\",
	    lichen=\"$lichen\",
	    liefs=\"$liefs\",
	    loop=\"$loop\",
	    marshbush=\"$marshbush\",
	    monkey=\"$monkey\",
	    mushroom=\"$mushroom\",
	    mushtree=\"$mushtree\",
	    petrification=\"$petrification\",
	    prefabswaps_start=\"$prefabswaps_start\",
	    reeds=\"$reeds\",
	    regrowth=\"$regrowth\",
	    roads=\"never\",
	    rock=\"$rock\",
	    rocky=\"$rocky\",
	    sapling=\"$sapling\",
	    season_start=\"default\",
	    slurper=\"$slurper\",
	    slurtles=\"$slurtles\",
	    start_location=\"caves\",
	    task_set=\"cave_default\",
	    tentacles=\"$tentacles\",
	    touchstone=\"$touchstone\",
	    trees=\"$trees\",
	    weather=\"$weather\",
	    world_size=\"$world_size\",
	    wormattacks=\"$wormattacks\",
	    wormhole_prefab=\"tentacle_pillar\",
	    wormlights=\"$wormlights\",
	    worms=\"$worms\" 
	  },
	  required_prefabs={ \"multiplayer_portal\" },
	  substitutes={  },
	  version=3 
	}" > "./.klei/DoNotStarveTogether/$filenumber/Caves/leveldataoverride.lua"
		echo -e "\e[92m洞穴世界设置完成！\e[0m"
	}

function Newfile()
{ 
	mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Master
	mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Caves
	Serversetting1
	CreatMasterini
	CreatCavesini
        setworld
	echo "地上和洞穴已经创建好，是否要立刻启动游戏 [Y/n]"
	read ifstart
	[ -z $ifstart ]&&ifstart="y"
	case $ifstart in
	     y)
	     StartMaster
	     StartCaves
	     break;;
	     n)
	     Main
	     break;;
	esac
}

function Startserver()
{
	echo "============================================"
	echo "存档目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "============================================"
	echo "请输入存档代码"
	read filenumber
		if [ -d "./.klei/DoNotStarveTogether/$filenumber" ]
		then 
			Filechose
		else
			echo "存档不存在，是否新建？[y/n]" 
			read newfile2
			[ -z $newfile2 ]&&newfile2="y"
			while :
			do
				case $newfile2 in
					y)Modechose
					break;;
					n)Main
					break;;
				esac
			done
		fi
}

function CloseServer()
{
	echo "============================================"
	screen -ls
	echo "============================================"
	echo "输入要切换的PID"
	echo "PS:回车后会进入地上或地下的运行界面"
	echo "   手动输入c_shutdown(true)回车保存退出"
	echo "   进入后不想关闭请按ctrl+a+d"
	read pid1
	screen -r $pid1
}


function Gameupdate()
{
	cd ./steamcmd
	./steamcmd.sh +login anonymous +force_install_dir "$HOME/Steam/steamapps/common/Don't Starve Together Dedicated Server" +app_update 343050 validate +quit
	cd "$HOME"
	echo "更新完毕"
	Main
}

#准备环境
function Library()
{
	 apt-get -y update
	 apt-get -y install screen
	 apt-get -y install lib32gcc1
	 apt-get -y install lib32stdc++6
	 apt-get -y install libcurl4-gnutls-dev:i386
	 apt-get -y install htop
}

#准备steam必要软件
function Prepare()
{
	if [ ! -d "./steamcmd" ]
	then
	Library
	mkdir ./steamcmd
	cd ./steamcmd
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	tar -xvzf steamcmd_linux.tar.gz
	rm -f steamcmd_linux.tar.gz
	./steamcmd.sh +login anonymous +force_install_dir "$HOME/Steam/steamapps/common/Don't Starve Together Dedicated Server" +app_update 343050 validate +quit
	fi
	#cp ~/steamcmd/linux32/libstdc++.so.6 ~/Steam/steamapps/common/Don't Starve Together Dedicated Server/bin/lib32/
	#cp /usr/lib/libcurl.so.4 ~/Steam/steamapps/common/Don't Starve Together Dedicated Server/bin/lib32/libcurl-gnutls.so.4
	cd "$HOME"
}

#主菜单
function Main()
{
	echo "===================================================================="
	while :
	do
	echo "[1]更新服务器               [2]启动服务器        [3]关闭服务器"
	echo "[4]管理存档                 [5]管理MOD           [6]管理特殊名单"
	echo "[7]控制台                   [8]更改房间设置      [9]查看服务器信息"
	echo "[10]查看游戏服务器状态      [11]开启swap分区"
	echo "===================================================================="
	echo -e "\e[92m请输入命令代号：\e[0m"
		read main1
			case $main1 in
				1)Gameupdate
				break;;
				2)Startserver
				break;;
				3)CloseServer
				break;;
				4)Filemanage
				break;;
				5)Modmanage
				break;;
				6)Listmanage
				break;;
				7)console
				break;;
				8)changesetting
				break;;
				9)serverinfo
				Main
				break;;
				10)checkserver
				break;;
				11)Openswapchoose
				break;;
			esac
	done
}

function serverinfo()
{
       echo -e "\e[92m=============================世界信息==========================================\e[0m"
	getpresentcluster
	getworldstate
	getpresentserver
	getplayernumber		
        echo -e "\e[33m当前服务器开启的世界：$server  当前存档槽：【$cluster】\e[0m"
	echo -e "\e[33m当前季节：【$presentseason】的第【$presentday】天\e[0m"
	echo -e "\e[33m当前是第【$presentcycles】天【$presentphase】【$presentmoonphase】【$presentrain】【$presentsnow】【$presenttemperature°C】\e[0m"
	if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
		getmonster
		getworldname
		echo -e "\e[33m猪人火炬:【$pigtorch】个  海象巢:【$walrus_camp】个  触手怪:【$tentacle】个  蜘蛛巢:【$spiderden】个\e[0m"
		echo -e "\e[33m高脚鸟巢:【$tallbirdnest】个  齿轮怪:【$chilun】个  猎犬丘:【$houndmound】个  芦苇:【$reeds】株  墓地:【$mudi】个\e[0m"
	        echo -e "\e[31m房名: 【$world_name】 密码: 【$passkey】 人数: 【$number/$maxplayer】 【$gamemode】\e[0m"
	fi
	getplayerlist
        echo -e "\e[33m================================================================================\e[0m"
}

function checkserver()
{    
	if [[ $(screen -ls | grep -c "DST_Master") > 0 || $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
	    echo -e "\e[92m即将跳转游戏服务器窗口，要退回本界面，在游戏服务器窗口按 ctrl+a+d 再执行脚本即可。\e[0m"
		sleep 3
	    if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
	        screen -r DST_Master
	    fi
	    if [[ $(screen -ls | grep -c "DST_Master") = 0 && $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
	        screen -r DST_Caves
	    fi
	else
	    echo "游戏服务器未开启！"
		Main
	fi
}

function console()
{	
    getpresentcluster
    while :
    do
	        echo -e "\e[33m====================欢迎使用饥荒联机版独立服务器脚本控制台======================\e[0m"
		echo
                echo -e "\e[31m注: 对玩家的操作要在玩家所在服务器后台执行才会生效！\e[0m"
		echo -e "\e[92m[1]查看当前玩家                         [2]踢出玩家\e[0m"  
                echo -e "\e[92m[4]禁止离线玩家加入游戏                 [3]禁止玩家\e[0m"   
		echo -e "\e[92m[5]允许离线玩家加入游戏                 [6]返回主菜单\e[0m" 
		echo -e "\e[92m[8]回档                                 [7]停止投票\e[0m"
		echo -e "\e[92m[9]重置世界                             [10]查看聊天记录\e[0m"
		echo -e "\e[92m[11]复活当前服务器所有玩家              [12]复活指定玩家\e[0m"
		echo -e "\e[92m[13]杀死当前服务器所有玩家              [14]杀死指定玩家\e[0m"
		echo -e "\e[92m[15]发送公告                            [16]开启上帝模式\e[0m"
		echo -e "\e[92m[17]全物品制造权限(要取消再操作一次，上帝模式同理)\e[0m"
		echo
        echo -e "\e[33m================================================================================\e[0m"
        echo -e "\e[92m请输入命令代号：\e[0m"
        read cmd  
	    case $cmd in
			17)
			getplayerlist
			echo "请输入你要给与全物品制造权限的玩家的KLEIID："
			read kleiid
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "UserToPlayer(\"$kleiid\").components.builder:GiveAllRecipes()$(printf \\r)"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "UserToPlayer(\"$kleiid\").components.builder:GiveAllRecipes()$(printf \\r)"
			fi
			getuser
			echo "已给予玩家 $name<$character> 全物品制造权限！"
			;;
			16)
			getplayerlist
			echo "请输入你要给与上帝模式的玩家的KLEIID："
			read kleiid
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "c_supergodmode(\"$kleiid\")$(printf \\r)"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "c_supergodmode(\"$kleiid\")$(printf \\r)"
			fi
			getuser
			echo "已给予玩家 $name<$character> 上帝模式！"
			;;
			1)
			getplayerlist
		        ;;	
                        2)
			getplayerlist
			echo "请输入你要踢出的玩家的KLEIID："
			read kleiid
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "TheNet:Kick(\"$kleiid\")$(printf \\r)"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "TheNet:Kick(\"$kleiid\")$(printf \\r)"
			fi
			getuser
			echo "玩家 $name<$character> 已被踢出游戏"
		        ;;	
                        3)
			getplayerlist
			echo "请输入你要禁止的玩家的KLEIID："
			read kleiid
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "TheNet:Ban(\"$kleiid\")$(printf \\r)"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "TheNet:Ban(\"$kleiid\")$(printf \\r)"
			fi
			getuser
			echo "玩家 $name<$character> 已被禁止加入游戏"
		        ;;	
                        4)
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "TheNet:SetAllowIncomingConnections(false)$(printf \\r)"
				echo "已允许玩家加入地上服务器！"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "TheNet:SetAllowIncomingConnections(false)$(printf \\r)"
				echo "已允许玩家加入洞穴服务器！"
			fi
			;;
                        5)
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "TheNet:SetAllowIncomingConnections(true)$(printf \\r)"
				echo "已禁止玩家加入地上服务器！"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "TheNet:SetAllowIncomingConnections(true)$(printf \\r)"
				echo "已禁止玩家加入洞穴服务器！"
			fi
			;;
                        6)
			Main
			break
		        ;;	
                        7)
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "c_stopvote()$(printf \\r)"
				echo "已停止当前进行的投票！"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "c_stopvote()$(printf \\r)"
				echo "已停止当前进行的投票！"
			fi
			;;
			8)
			echo "请输入你要回档的天数（1~5）:"
			read rollbackday
			if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
			    screen -S "DST_Master" -p 0 -X stuff "c_rollback($rollbackday)$(printf \\r)"
			fi
			if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
			    screen -S "DST_Caves" -p 0 -X stuff "c_rollback($rollbackday)$(printf \\r)"
			fi
		        echo "已回档$rollbackday 天！"
			;;
                        9)
				if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
				    screen -S "DST_Master" -p 0 -X stuff "c_regenerateworld()$(printf \\r)"
				fi
				if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
				    screen -S "DST_Caves" -p 0 -X stuff "c_regenerateworld()$(printf \\r)"
				fi
				echo "正在重置当前世界。。。请稍候。。。。"
				sleep 20
			    echo "已重置当前世界！"
				menu
				;;
                        10)
				echo -e "\e[92m按Ctrl+C退出！\e[0m"
				echo -e "\e[33m================================================================================\e[0m"
				if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
				    tail -f "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_chat_log.txt" | cut -f 2-20 -d' '
				fi
				if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
				    tail -f "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_chat_log.txt" | cut -f 2-20 -d' '
				fi
			;;
			11)
			resurrectallplayer
			;;
				12)
				getplayerlist
				echo "请输入你要复活的玩家KLEIID："
				read kleiid
				getuser
				if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
				    screen -S "DST_Master" -p 0 -X stuff "UserToPlayer(\"$kleiid\"):PushEvent('respawnfromghost')$(printf \\r)"
				fi
				if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
				    screen -S "DST_Caves" -p 0 -X stuff "UserToPlayer(\"$kleiid\"):PushEvent('respawnfromghost')$(printf \\r)"
				fi
				echo "玩家 $name<$character> 已复活！"
			    ;;
				13)
				killallplayer
				;;
				14)
				getplayerlist
				echo "请输入你要杀死的玩家KLEIID："
				read kleiid
				getuser
				if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
				    screen -S "DST_Master" -p 0 -X stuff "UserToPlayer(\"$kleiid\"):PushEvent('death')$(printf \\r)"
				fi
				if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
				    screen -S "DST_Caves" -p 0 -X stuff "UserToPlayer(\"$kleiid\"):PushEvent('death')$(printf \\r)"
				fi
				echo "玩家 $name<$character> 已被杀死！"
			    ;;
				15)
				echo "请输入公告内容："
				read str
				if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
				    screen -S "DST_Master" -p 0 -X stuff "c_announce(\"$str\")$(printf \\r)"
				fi
				if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
				    screen -S "DST_Caves" -p 0 -X stuff "c_announce(\"$str\")$(printf \\r)"
				fi
				echo "公告已发送！"
				;;
		    esac
    done
}

function resurrectallplayer()
{
    if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
	    screen -S "DST_Master" -p 0 -X stuff "for k,v in pairs(AllPlayers) do v:PushEvent('respawnfromghost') end$(printf \\r)"
		echo "已复活地上服务器中所有已死玩家！"
	fi
	if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
	    screen -S "DST_Caves" -p 0 -X stuff "for k,v in pairs(AllPlayers) do v:PushEvent('respawnfromghost') end$(printf \\r)"
        echo "已复活洞穴服务器中所有已死玩家！"
	fi
}

function killallplayer()
{
    if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
	    screen -S "DST_Master" -p 0 -X stuff "for k,v in pairs(AllPlayers) do v:PushEvent('death') end$(printf \\r)"
		echo "已杀死地上服务器中所有玩家！"
	fi
	if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
	    screen -S "DST_Caves" -p 0 -X stuff "for k,v in pairs(AllPlayers) do v:PushEvent('death') end$(printf \\r)"
        echo "已杀死洞穴服务器中所有玩家！"
	fi
}

function rebootannounce()
{
    if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then   									        
	    screen -S "DST_Master" -p 0 -X stuff "c_announce(\"服务器设置因做了改动需要重启，预计耗时三分钟，给你带来的不便还请谅解！\")$(printf \\r)"	
	fi
	if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then						        
		screen -S "DST_Caves" -p 0 -X stuff "c_announce(\"服务器设置因做了改动需要重启，预计耗时三分钟，给你带来的不便还请谅解！\")$(printf \\r)"
	fi
}

function deldir()
{
    echo -e "\e[92m已有存档：\e[0m"
	ls -l ${DST_conf_basedir}/${DST_conf_dirname} |awk '/^d/ {print $NF}'
	echo -e "\e[92m请输入要删除的存档[请谨慎选择]：\e[0m"
	read clustername
	rm -rf ${DST_conf_basedir}/${DST_conf_dirname}/$clustername
	echo -e "\e[92m存档删除完毕！\e[0m"
}

function getplayernumber()
{	
    number=0
	if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
	    allplayersnumber=$( date +%s%3N )
	    screen -S "DST_Master" -p 0 -X stuff "print(\"AllPlayersNumber \" .. (table.getn(TheNet:GetClientTable())-1) .. \" $allplayersnumber\")$(printf \\r)"
	    sleep 1
	    number=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$allplayersnumber" | cut -f3 -d ' ' | tail -n +2 )
	fi
	if [[ $(screen -ls | grep -c "DST_Master") = 0 && $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
	    allplayersnumber=$( date +%s%3N )
	    screen -S "DST_Caves" -p 0 -X stuff "print(\"AllPlayersNumber \" .. (table.getn(TheNet:GetClientTable())-1) .. \" $allplayersnumber\")$(printf \\r)"
	    sleep 1
		number=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$allplayersnumber" | cut -f3 -d ' ' | tail -n +2 )
	fi
}

function getplayerlist()
{	
	if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
	    allplayerslist=$( date +%s%3N )
		screen -S "DST_Master" -p 0 -X stuff "for i, v in ipairs(TheNet:GetClientTable()) do  print(string.format(\"playerlist %s [%d] %s %s %s\", $allplayerslist, i-1, v.userid, v.name, v.prefab )) end$(printf \\r)"
        sleep 1
        list=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "playerlist $allplayerslist" | cut -d ' ' -f 4-15 | tail -n +2)
		if [[ ! "$list" = "" ]]; then
		    echo -e "\e[92m服务器玩家列表：\e[0m"
	        echo -e "\e[92m================================================================================\e[0m"
		echo "$list"
		echo -e "\e[92m================================================================================\e[0m"
			echo "$list" > $HOME/.klei/playerlist.txt
		fi
	fi
	if [[ $(screen -ls | grep -c "DST_Master") = 0 && $(screen -ls | grep -c "DST_Caves") > 0 ]]; then	    
	    allplayerslist=$( date +%s%3N )
		screen -S "DST_Caves" -p 0 -X stuff "for i, v in ipairs(TheNet:GetClientTable()) do  print(string.format(\"playerlist %s [%d] %s %s %s\", $allplayerslist, i-1, v.userid, v.name, v.prefab)) end$(printf \\r)"
        sleep 1
        list=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "playerlist $allplayerslist" | cut -d ' ' -f 4-15 | tail -n +2)
		if [[ ! "$list" = "" ]]; then
		    echo -e "\e[92m服务器玩家列表：\e[0m"
	        echo -e "\e[92m================================================================================\e[0m"
		echo "$list"
		echo -e "\e[92m================================================================================\e[0m"
			echo "$list" > $HOME/.klei/playerlist.txt
		fi
	fi
}

function getuser()
{ 
    name=$( grep "$HOME/.klei/playerlist.txt" -e "$kleiid" | cut -d ' ' -f3 )
	character=$( grep "$HOME/.klei/playerlist.txt" -e "$kleiid" | cut -d ' ' -f4 )
}

function Openswap()
{
    dd if=/dev/zero of=/swapfile bs=1M count=2048
    mkswap /swapfile
    swapon /swapfile
    chmod 0646 /etc/fstab
    echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
	clear
    echo -e "\e[92m虚拟内存已开启！\e[0m"
}


function Openswapchoose ()
{
echo "============================================"
echo "swap分区是在物理内存不够的前提下开启的虚拟内存"
while :
do
echo "swap分区只能开启一次，您确定这是第一次开启？[y/n]"
read swapcho
	case $swapcho in
		y) Openswap
		break;;
		n) Main
		break;;
	esac
done
}


function getpresentserver()
{ 
    server="【无】"
	if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then
        server="【地上】" 
    fi	
	if [[ $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
        server="【洞穴】"
	fi
	if [[ $(screen -ls | grep -c "DST_Master") > 0 && $(screen -ls | grep -c "DST_Caves") > 0 ]]; then
        server="【地上+洞穴】"
	fi
}

function getpresentcluster()
{   
    if [[ -f "$HOME/.klei/cluster.txt" ]]; then
	    cluster="$(cat "$HOME/.klei/cluster.txt" | cut -d '=' -f2 )"
	fi
}

function changesetting()
{
        getpresentcluster
	filename="$DST_conf_basedir/$DST_conf_dirname/$cluster/cluster.ini"
	while :
        do
	echo -e "\e[33m==================设置完成后，须重启服务器才会生效。============================\e[0m"
	echo
        echo -e "\e[92m[1]更改游戏模式     [2]更改最大玩家数量      [3]是否开启PVP\e[0m"  
        echo -e "\e[92m[4]更改房间简介     [5]更改房间名称          [6]更改房间密码\e[0m"		
		echo -e "\e[92m[7]更改steam群组    [8]更改白名单人员数量    [9]返回主菜单\e[0m"
        echo -e "\e[33m================================================================================\e[0m"
        echo -e "\e[92m请输入命令代号：\e[0m"
        read cmd  
		case $cmd in
		    1)
			oldstr="$(grep game_mode $filename)"
			echo -e "\e[92m请选择新的游戏模式：1.无尽 2.生存 3.荒野\e[0m"
                read newstr
                case $newstr in
                    1)
		            newstr="endless";;
                    2)
		            newstr="survival";;
                    3)
		            newstr="wilderness";;
                esac
				newmode="game_mode = $newstr"
				sed -i "s/$oldstr/$newmode/g" $filename
				;;
				2)
				oldstr="$(grep max_players $filename)"
				echo -e "\e[92m请输入新的最大玩家数量：\e[0m"
				read newstr
				newplayers="max_players = $newstr"
				sed -i "s/$oldstr/$newplayers/g" $filename
				;;
				3)
				oldstr="$(grep pvp $filename)"
				echo -e "\e[92m是否开启PVP：1.是 2.否\e[0m"
                read ispvp
                case $ispvp in
                    1)
		            ifpvp="true";;
                    2)
		            ifpvp="false";;
                esac
				newpvp="pvp = $ifpvp"
				sed -i "s/$oldstr/$newpvp/g" $filename
				;;
				4)
				oldstr="$(grep cluster_description $filename)"
				echo -e "\e[92m请输入新的房间简介：\e[0m"
				read newstr
				new="cluster_description = $newstr"
				sed -i "s/$oldstr/$new/g" $filename
				;;
				5)
				oldstr="$(grep cluster_name $filename)"
				echo -e "\e[92m请输入新的房间名称：\e[0m"
				read newstr
				new="cluster_name = $newstr"
				sed -i "s/$oldstr/$new/g" $filename
				;;
				6)
				oldstr="$(grep cluster_password $filename)"
				echo -e "\e[92m请输入新的房间密码：\e[0m"
				read newstr
				new="cluster_password = $newstr"
				sed -i "s/$oldstr/$new/g" $filename
				;;
				7)
				oldstr="$(grep steam_group_id $filename)"
				echo "请输入新的steam群id"
				read newid
				new="steam_group_id = $newid"
				sed -i "s/$oldstr/$new/g" $filename
				oldstr="$(grep steam_group_admins $filename)"
				echo -e "\e[92m群组管理员是否自动成为服务器管理：1.是 2.否\e[0m"
                read isadmin
                case $isadmin in
                    1)
		            ifadmin="true";;
                    2)
		            ifadmin="false";;
                esac
				newadmin="steam_group_admins = $ifadmin"
				sed -i "s/$oldstr/$newadmin/g" $filename
				oldstr="$(grep steam_group_only $filename)"
				echo -e "\e[92m是否仅允许群组成员加入服务器：1.是 2.否\e[0m"
                read only
                case $only in
                    1)
		            onlyl="true";;
                    2)
		            onlyl="false";;
                esac
				newonly="steam_group_only = $onlyl"
				sed -i "s/$oldstr/$newonly/g" $filename
				;;
				9)
				Main
				break;;
				8)
				oldstr="$(grep whitelist_slots $filename)"
				echo -e "\e[92m请新的最大玩家数量：\e[0m"
				read newstr
				newplayers="whitelist_slots = $newstr"
				sed -i "s/$oldstr/$newplayers/g" $filename
				;;
			esac
		echo "更改完成！"
	done
}

function getworldstate()
{
        presentseason=""
	presentday=""
	presentcycles=""
	presentphase=""
	presentmoonphase=""
	presentrain=""
	presentsnow=""
	presenttemperature=""
	if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then   									        
	    datatime=$( date +%s%3N )	
		screen -S "DST_Master" -p 0 -X stuff "print(\"\" .. TheWorld.net.components.seasons:GetDebugString() .. \" $datatime print\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "print(\"\" .. TheWorld.components.worldstate.data.phase .. \" $datatime phase\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "print(\"\" .. TheWorld.components.worldstate.data.moonphase .. \" $datatime moonphase\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "print(TheWorld.components.worldstate.data.temperature .. \" $datatime temperature\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "print(TheWorld.components.worldstate.data.cycles .. \" $datatime cycles\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "print(\"$datatime:rain:\",TheWorld.components.worldstate.data.israining)$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "print(\"$datatime:snow:\",TheWorld.components.worldstate.data.issnowing)$(printf \\r)"
		sleep 1
	        presentseason=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime print" | cut -d ' ' -f2 | tail -n +2 )
		presentday=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime print" | cut -d ' ' -f3 | tail -n +2 )
		presentphase=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime phase" | cut -d ' ' -f2 | tail -n +2 )
		presentmoonphase=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime moonphase" | cut -d ' ' -f2 | tail -n +2 )
		presenttemperature=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime temperature" | cut -d ' ' -f2 | tail -n +2 )
		presentrain=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime:rain" | cut -d ':' -f6 | tail -n +2 )
		presentsnow=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime:snow" | cut -d ':' -f6 | tail -n +2 | cut -d ' ' -f2 )
		presentcycles=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "$datatime cycles" | cut -d ' ' -f2 | tail -n +2 )
		
		if [[ "$presentseason" == "autumn" ]]; then
		    presentseason="秋天"
		fi
		if [[ "$presentseason" == "spring" ]]; then
		    presentseason="春天"
		fi
		if [[ "$presentseason" == "summer" ]]; then
		    presentseason="夏天"
		fi
		if [[ "$presentseason" == "winter" ]]; then
		    presentseason="冬天"
		fi
		
		if [[ "$presentphase" == "day" ]]; then
		    presentphase="白天"
		fi
		if [[ "$presentphase" == "dusk" ]]; then
		    presentphase="黄昏"
		fi
		if [[ "$presentphase" == "night" ]]; then
		    presentphase="黑夜"
		fi
		
		if [[ "$presentmoonphase" == "new" ]]; then
		    presentmoonphase="新月"
		fi
		if [[ "$presentmoonphase" == "full" ]]; then
		    presentmoonphase="满月"
		fi
		if [[ "$presentmoonphase" == "threequarter" || "$presentmoonphase" == "quarter" || "$presentmoonphase" == "half" ]]; then
		    presentmoonphase="缺月"
		fi
		
		presenttemperature=${presenttemperature%.*}
		
		if [[ $( echo "$presentrain" | grep -c "true" ) > 0 ]]; then
		    presentrain="下雨"
		fi
		if [[ $( echo "$presentrain" | grep -c "false" ) > 0 ]]; then
		    presentrain="无雨"
		fi
		
		if [[ $( echo "$presentsnow" | grep -c "true" ) > 0 ]]; then
		    presentsnow="下雪"
		fi
		if [[ $( echo "$presentsnow" | grep -c "false" ) > 0 ]]; then
		    presentsnow="无雪"
		fi
	fi
	if [[ $(screen -ls | grep -c "DST_Master") = 0 && $(screen -ls | grep -c "DST_Caves") > 0 ]]; then						        
		datatime=$( date +%s%3N )	
		screen -S "DST_Caves" -p 0 -X stuff "print(\"\" .. TheWorld.net.components.seasons:GetDebugString() .. \" $datatime print\")$(printf \\r)"
		screen -S "DST_Caves" -p 0 -X stuff "print(\"\" .. TheWorld.components.worldstate.data.phase .. \" $datatime phase\")$(printf \\r)"
		screen -S "DST_Caves" -p 0 -X stuff "print(\"\" .. TheWorld.components.worldstate.data.moonphase .. \" $datatime moonphase\")$(printf \\r)"
		screen -S "DST_Caves" -p 0 -X stuff "print(TheWorld.components.worldstate.data.temperature .. \" $datatime temperature\")$(printf \\r)"
		screen -S "DST_Caves" -p 0 -X stuff "print(TheWorld.components.worldstate.data.cycles .. \" $datatime cycles\")$(printf \\r)"
		screen -S "DST_Caves" -p 0 -X stuff "print(\"$datatime:rain:\",TheWorld.components.worldstate.data.israining)$(printf \\r)"
		screen -S "DST_Caves" -p 0 -X stuff "print(\"$datatime:snow:\",TheWorld.components.worldstate.data.issnowing)$(printf \\r)"
		sleep 1
	    presentseason=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime print" | cut -d ' ' -f2 | tail -n +2 )
		presentday=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime print" | cut -d ' ' -f3 | tail -n +2 )
		presentphase=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime phase" | cut -d ' ' -f2 | tail -n +2 )
		presentmoonphase=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime moonphase" | cut -d ' ' -f2 | tail -n +2 )
		presenttemperature=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime temperature" | cut -d ' ' -f2 | tail -n +2 )
		presentrain=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime:rain" | cut -d ':' -f6 | tail -n +2 )
		presentsnow=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime:snow" | cut -d ':' -f6 | tail -n +2 | cut -d ' ' -f2 )
		presentcycles=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Caves/server_log.txt" -e "$datatime cycles" | cut -d ' ' -f2 | tail -n +2 )
		
		if [[ "$presentseason" == "autumn" ]]; then
		    presentseason="秋天"
		fi
		if [[ "$presentseason" == "spring" ]]; then
		    presentseason="春天"
		fi
		if [[ "$presentseason" == "summer" ]]; then
		    presentseason="夏天"
		fi
		if [[ "$presentseason" == "winter" ]]; then
		    presentseason="冬天"
		fi
		
		if [[ "$presentphase" == "day" ]]; then
		    presentphase="白天"
		fi
		if [[ "$presentphase" == "dusk" ]]; then
		    presentphase="黄昏"
		fi
		if [[ "$presentphase" == "night" ]]; then
		    presentphase="黑夜"
		fi
		
		if [[ "$presentmoonphase" == "new" ]]; then
		    presentmoonphase="新月"
		fi
		if [[ "$presentmoonphase" == "full" ]]; then
		    presentmoonphase="满月"
		fi
		if [[ "$presentmoonphase" == "threequarter" || "$presentmoonphase" == "quarter" || "$presentmoonphase" == "half" ]]; then
		    presentmoonphase="缺月"
		fi
		
		presenttemperature=${presenttemperature%.*}
		
		if [[ $( echo "$presentrain" | grep -c "true" ) > 0 ]]; then
		    presentrain="下雨"
		fi
		if [[ $( echo "$presentrain" | grep -c "false" ) > 0 ]]; then
		    presentrain="无雨"
		fi
		
		if [[ $( echo "$presentsnow" | grep -c "true" ) > 0 ]]; then
		    presentsnow="下雪"
		fi
		if [[ $( echo "$presentsnow" | grep -c "false" ) > 0 ]]; then
		    presentsnow="无雪"
		fi
	fi
	
}

function getworldname()
{
    maxplayer=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/cluster.ini" -e "max_players =" | cut -d ' ' -f3 )
    world_name=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/cluster.ini" -e "cluster_name =" | cut -d ' ' -f3-20 )
	passkey=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/cluster.ini" -e "cluster_password =" | cut -d ' ' -f3 )
	gamemode=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/cluster.ini" -e "game_mode =" | cut -d ' ' -f3 )
	if [[ "$passkey" == "" ]]; then
	    passkey="无"
	fi
	if [[ "$gamemode" == "endless" ]]; then
	    gamemode="无尽模式"
	fi
	if [[ "$gamemode" == "survival" ]]; then
	    gamemode="生存模式"
	fi
	if [[ "$gamemode" == "wilderness" ]]; then
	    gamemode="荒野模式"
	fi
}

function getmonster()
{
    if [[ $(screen -ls | grep -c "DST_Master") > 0 ]]; then   									       	
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"walrus_camp\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"bishop\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"knight\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"rook\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"tallbirdnest\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"mound\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"houndmound\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"tentacle\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"reeds\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"pigtorch\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"gravestone\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"spiderden\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"spiderden_2\")$(printf \\r)"
		screen -S "DST_Master" -p 0 -X stuff "c_countprefabs(\"spiderden_3\")$(printf \\r)"
		sleep 1
	        walrus_camp=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "walrus_camps in the world." | cut -d ':' -f4 | tail -n 1| sed 's/[^0-9\]//g' )
		bishop=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "bishops in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		knight=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "knights in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		rook=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "rooks in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
	        reeds=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "reedss in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		tentacle=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "tentacles in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		pigtorch=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "pigtorchs in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		tallbirdnest=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "tallbirdnests in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		houndmound=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "houndmounds in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		mound=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "mounds in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		gravestone=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "gravestones in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		spiderden_1=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "spiderdens in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		spiderden_2=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "spiderden_2s in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		spiderden_3=$( grep "${DST_conf_basedir}/${DST_conf_dirname}/$cluster/Master/server_log.txt" -e "spiderden_3s in the world." | cut -d ':' -f4 | tail -n 1 | sed 's/[^0-9\]//g' )
		spiderden=$[ $spiderden_1 + $spiderden_2 + $spiderden_3 ]
		chilun=$[ $bishop + $knight + $rook ]
		mudi=$[ $mound + $gravestone ]
	fi
}

echo "欢迎使用"
Prepare
echo "准备完毕"
echo "============================================"
Main
