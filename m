Received: from localhost (localhost.tusur.ru [127.0.0.1])
	by tusur.ru (Postfix) with SMTP id 1DA93B68FC
	for <linux-mips@linux-mips.org>; Wed, 21 Jul 2004 11:34:40 +0700 (TSD)
Received: from roman (unknown [211.189.32.204])
	by tusur.ru (Postfix) with ESMTP id 90E2EB68D7
	for <linux-mips@linux-mips.org>; Wed, 21 Jul 2004 11:34:32 +0700 (TSD)
Message-ID: <002601c46edc$809fe700$cc20bdd3@roman>
From: "Roman Mashak" <mrv@tusur.ru>
Subject: YAMON compiling
Date: Wed, 21 Jul 2004 13:37:52 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@tusur.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040721043752.iUjYCeNTbWK13XoXFGvBO0PFFrbpx-RJRzC1zfWEQe8@z>

Hello!

After installing  SDE toolkit onto Linux box I tried to compile the
YAMON bootloader source code (version of YAMON is 2.00). Few errors arised:

../arch/include/mips.h: Assembler messages:
../arch/include/mips.h:397: Warning: rest of line ignored; first ignored
character is `/'
../arch/include/mips.h:398: Warning: rest of line ignored; first ignored
character is `/'
../arch/include/mips.h:399: Warning: rest of line ignored; first ignored
character is `/'
../arch/include/pb1000.h:1: Warning: rest of line ignored; first ignored
character is `/'
../arch/include/pb1000.h:3: Warning: rest of line ignored; first ignored
character is `/'
../arch/include/pb1000.h:406: Warning: rest of line ignored; first ignored
character is `/'
./../init/reset/reset.S:98: Warning: rest of line ignored; first ignored
character is `/'
./../init/reset/reset.S:99: Warning: rest of line ignored; first ignored
character is `/'
../arch/init/reset_db1550.S:641: Warning: rest of line ignored; first
ignored character is `/'
../arch/init/reset_db1550.S:739: Error: absolute expression required `li'
../arch/init/reset_db1550.S:783: Error: absolute expression required `li'
../arch/init/reset_db1550.S:821: Error: absolute expression required `li'
make: *** [reset.o] Error1

The lines in mips.h that arise these warnings are the following:

// #define AU1000 0x00030100
//#define AU1000 0x01030200
//#define AU1000_2_1 0x00030200

It seems it doesn't understand the comment syntax.

    I have installed the version 5.03.06-LITE of SDE. Following is the code
extract around which error occures:

#define t1 $9
#define mem_sdconfiga  0x0840
#define MEM_SDCONFIGA_DDR   0x9030060A
#define MEM_SDREFCFG_D_DDR  MEM_SDCONFIGA_DDR

li      t1, MEM_SDREFCFG_D_DDR
sw      t1, mem_sdconfiga(t0)
sync

Compiler thinks  'li t1, MEM_SDREFCFG_D_DDR'  is 'bad expression',  may be
it guesses MEM_SDREFCFG_D_DDR is not defined correctly?

Thank you for every help in advance!

With best regards, Roman Mashak.  E-mail: mrv@tusur.ru
