From: "Martin C. Barlow" <mips@martin.barlow.name>
Subject: RE: hwclock and df seg fault
Date: Sun, 21 Mar 2004 03:47:55 +1100
Message-ID: <000101c40e9b$18d887e0$6500a8c0@colombia>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040320122201.GA32242@linux-mips.org>
Return-Path: <mips@martin.barlow.name>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040320164755.TaU9UbFljZPsiVwhZMXIqTU-y0fgFy_uPR6FmFv4HSQ@z>

I did a search for this problem and found that the sparc64 guys had a
similar problem that they solved. I don't know if the problem is
similar.
http://lists.debian.org/debian-sparc/2003/debian-sparc-200311/msg00068.h
tml

They solved it by analysing an strace.  I did the same. Looking at it,
it looks like some linking is failing and then later on SYS_4255(), the
critical function is failing.

Hope that helps someone to understand.

marty

Barcelona:~# strace df
execve("/bin/df", ["df"], [/* 16 vars */]) = 0
uname({sys="Linux", node="Barcelona", ...}) = 0
brk(0)                                  = 0x10001000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or
directory)
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x2aac2000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=9507, ...}) = 0
old_mmap(NULL, 9507, PROT_READ, MAP_PRIVATE, 3, 0) = 0x2aac4000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or
directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\10\0\0\0\1\0\1PD"...,
512) = 512
lseek(3, 588, SEEK_SET)                 = 588
read(3, "\0\0\0\4\0\0\0\20\0\0\0\1GNU\0\0\0\0\0\0\0\0\2\0\0\0\4"..., 32)
= 32
fstat64(3, {st_mode=S_IFREG|0644, st_size=1692012, ...}) = 0
old_mmap(NULL, 1872896, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =
0x2ab02000
mprotect(0x2ac7f000, 312320, PROT_NONE) = 0
old_mmap(0x2acbe000, 45056, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x17c000) = 0x2acbe000
old_mmap(0x2acc9000, 9216, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x2acc9000
close(3)                                = 0
munmap(0x2aac4000, 9507)                = 0
brk(0)                                  = 0x10001000
brk(0x10022000)                         = 0x10022000
brk(0)                                  = 0x10022000
open("/etc/mtab", O_RDONLY)             = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=162, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x2aac3000
read(3, "/dev/sda1 / ext3 rw,errors=remou"..., 4096) = 162
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x2aac3000, 4096)                = 0
fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(136, 0), ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x2aac3000
write(1, "Filesystem           1K-blocks  "..., 67Filesystem
1K-blocks      Used Available Use% Mounted on
) = 67
SYS_4255()                              = -1 EINVAL (Invalid argument)
write(2, "df: ", 4df: )                     = 4
write(2, "`/\'", 3`/')                     = 3
write(2, ": Invalid argument", 18: Invalid argument)      = 18
write(2, "\n", 1
)                       = 1
SYS_4255()                              = -1 EINVAL (Invalid argument)
write(2, "df: ", 4df: )                     = 4
write(2, "`/proc\'", 7`/proc')                 = 7
write(2, ": Invalid argument", 18: Invalid argument)      = 18
write(2, "\n", 1
)                       = 1
SYS_4255()                              = -1 EINVAL (Invalid argument)
write(2, "df: ", 4df: )                     = 4
write(2, "`/sys\'", 6`/sys')                  = 6
write(2, ": Invalid argument", 18: Invalid argument)      = 18
write(2, "\n", 1
)                       = 1


Barcelona:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
df: `/': Invalid argument
df: `/proc': Invalid argument
df: `/sys': Invalid argument
df: `/dev/pts': Invalid argument
df: `/dev/shm': Invalid argument

Barcelona:~# uname -a
Linux Barcelona 2.6.4 #3 Mon Mar 22 00:14:42 EST 2004 mips GNU/Linux

Barcelona:~# cat /proc/version
Linux version 2.6.4 (root@Barcelona) (gcc version 3.3.3 (Debian)) #3 Mon
Mar 22 00:14:42 EST 2004

Barcelona:~# dpkg -l coreutils libc6
ii  coreutils                 5.0.91-2                  The GNU core
utilities
ii  libc6                     2.3.2.ds1-11              GNU C Library:
Shared libraries and Timezone data

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org] 
Sent: Saturday, 20 March 2004 11:22 PM
To: Martin C. Barlow
Cc: linux-mips@linux-mips.org
Subject: Re: hwclock and df seg fault

I checked in the last fixes for the preemptible kernel less than two
days ago so if your kernel is older than that it's time to update :-)

  Ralf
