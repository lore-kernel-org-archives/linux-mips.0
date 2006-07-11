Received: from [220.76.242.187] ([220.76.242.187]:16269 "EHLO
	localhost.localdomain") by ftp.linux-mips.org with ESMTP
	id S8133892AbWGKBWK (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 11 Jul 2006 02:22:10 +0100
Received: from mrv ([192.168.11.157])
	by localhost.localdomain (8.12.8/8.12.8) with SMTP id k6B1NhiU020256
	for <linux-mips@linux-mips.org>; Tue, 11 Jul 2006 10:23:46 +0900
Message-ID: <000901c6a488$6f7e1800$9d0ba8c0@mrv>
From: "Roman Mashak" <mrv@corecom.co.kr>
Subject: SHT_REL bad size
Date: Tue, 11 Jul 2006 10:22:11 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="windows-1251";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@corecom.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060711012211.hA87ZVCcsLNJgw9edGs2MKzHx5yjoP1YWUcm3tsZTow@z>

Hello,

I'm trying to compile application for MIPS 4km (designed by "Cavium"). Here 
is the command line:

Compiling main.cpp
mips-g++ -c -Wall -D_GNU_SOURCE -mips32 -mtune=4kc  main.cpp -o main.o
Compiling cmd.cpp
mips-g++ -c -Wall -D_GNU_SOURCE -mips32 -mtune=4kc  cmdProc.cpp -o cmdProc.o
Linking binkd
mips-g++ main.o cmd.o ../lnkep.c ../lib/libapi.a  -o binkd

Compilation is fine, but on target I ran into error launching the program:

#./binkd
SHT_REL bad size=0
./binkd cannot execute

Seems like the problem with linker?

Appreciate any hints, thank you.

With best regards, Roman Mashak.  E-mail: mrv@corecom.co.kr 
