Message-ID: <000a01c315cf$8171ac70$d017a8c0@pc208>
From: "smills_ho" <smills_ho@coventive.com>
References: <3EB0B329.9030603@ict.ac.cn> <16048.55936.346808.522687@cuddles.redhat.com> <3EB0DDC6.5080108@ict.ac.cn> <16048.57054.224964.883062@cuddles.redhat.com> <20030501085018.GA1885@greglaptop.attbi.com>
Subject: Problem of cross-mipsel-compiler GLIBC-2.3.X
Date: Fri, 9 May 2003 10:05:43 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <smills_ho@coventive.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Linux/MIPS Development <linux-mips@linux-mips.org>
Cc: gcc@gcc.gnu.org
Message-ID: <20030509020543.mnS6MQ-s46N008CpUT0gCGNUCL6uRYBaDavb5xOYzmw@z>

Dear All,
    I want to make a cross-compilered glibc-2.3.x and I get the source from
ftp.gun.org. GCC version is 3.2.3, binutils is 2.13.2.1. The step is as
following:

1. Try to build binutils
2. Try to make static GCC
3. Try to make glibc -----> Then it is failed

Is there anybody know what's going on or somebody had successfully to build
the crossed glibc-2.3.x?

Thanks and best regs,
