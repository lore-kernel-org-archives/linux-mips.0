From: "Robert Rusek" <robru@teknuts.com>
Subject: kernel: EXT2-fs error ?
Date: Tue, 7 May 2002 00:29:27 -0700
Message-ID: <000001c1f598$efc65070$0a01a8c0@sohotower>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020507072927.vrItHtkmj1_4NF3wvveIaG-L45wtOvKvDbA5vvxfS80@z>

I am running Kernel 2.4.17 on an SGI Indy.  I recently noticed that I
have been getting the following error sparatically.  What does this
mean?  The system boots up cleanly and then the fs gets corrupted
somehow.  Any help would be greatly appreciated.


May  6 04:02:17 catbert kernel: EXT2-fs error (device sd(8,1)):
ext2_check_page: bad entry in directory #110032: unaligned di
rectory entry - offset=0, inode=6226015, rec_len=95, name_len=95
May  6 04:02:17 catbert kernel: EXT2-fs error (device sd(8,1)):
ext2_check_page: bad entry in directory #110056: rec_len is s
maller than minimal - offset=0, inode=2551, rec_len=0, name_len=8
May  6 04:02:17 catbert kernel: EXT2-fs error (device sd(8,1)):
ext2_check_page: bad entry in directory #110071: rec_len is s
maller than minimal - offset=0, inode=0, rec_len=0, name_len=0
May  6 04:02:17 catbert kernel: EXT2-fs error (device sd(8,1)):
ext2_check_page: bad entry in directory #110081: rec_len is s
maller than minimal - offset=0, inode=547544874, rec_len=0, name_len=0


Thank you in advance,
Rob.
