Received: by fw01.bwg.de (8.11.6p2G/8.11.6) id h9N9YH808554
	for linux-mips@linux-mips.org; Thu, 23 Oct 2003 11:34:17 +0200 (CEST)
From: =?iso-8859-1?Q?Ralf_R=F6sch?= <ralf.roesch@rw-gmbh.de>
Subject: Compiler Problems in tlbex-r4k.S
Date: Thu, 23 Oct 2003 11:33:16 +0200
Message-ID: <NHBBLBCCGMJFJIKAMKLHOEIJCBAA.ralf.roesch@rw-gmbh.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0000_01C39959.73C38B80"
Return-Path: <ralf.roesch@rw-gmbh.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031023093316.RBVo6MD7J3SWS2HRLrmNIuTwsUWsU-U-mTsYliVysAI@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C39959.73C38B80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

The latest update in tlbex-r4k.S (tag 2_4) produces
following compiler errors on my machine:

mipsel-linux-gcc -D__ASSEMBLY__ -D__KERNEL__ -I/build/linux-2.4.22-rthal5g-s
trom
boli/include -I /build/linux-2.4.22-rthal5g-stromboli/include/asm/gcc -G
0 -mno-
abicalls -fno-pic -pipe   -mcpu=r4600 -mips2 -Wa,--trap   -c -o tlbex-r4k.o
tlbe
x-r4k.S
tlbex-r4k.S: Assembler messages:
tlbex-r4k.S:179: Error: missing ')'
tlbex-r4k.S:179: Error: missing ')'
tlbex-r4k.S:179: Error: missing ')'
tlbex-r4k.S:179: Error: illegal operands `and'
tlbex-r4k.S:207: Error: missing ')'
tlbex-r4k.S:207: Error: missing ')'
tlbex-r4k.S:207: Error: missing ')'
tlbex-r4k.S:207: Error: illegal operands `and'
tlbex-r4k.S:243: Error: missing ')'
tlbex-r4k.S:243: Error: missing ')'
tlbex-r4k.S:243: Error: missing ')'
...

If I change the line 43 from:
#define PTE_PAGE_SIZE	(1L << PTE_PAGE_SHIFT)
to
#define PTE_PAGE_SIZE	(1 << PTE_PAGE_SHIFT)
the compiling is o.k.

Is that a compiler problem or an programming error ?

  Ralf



------=_NextPart_000_0000_01C39959.73C38B80
Content-Type: text/x-vcard;
	name="Ralf Roesch.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Ralf Roesch.vcf"

BEGIN:VCARD
VERSION:2.1
N:Roesch;Ralf
FN:Ralf Roesch
ORG:Roesch & Walter Industrie-Elektronik GmbH
TITLE:Managing Director
TEL;WORK;VOICE:+49 (7824) 6628-0
TEL;WORK;FAX:+49 (+49) 7824 6628-29
ADR;WORK:;;Im Heidenwinkel 5;Schwanau;;77963;Deutschland
LABEL;WORK;ENCODING=3DQUOTED-PRINTABLE:Im Heidenwinkel =
5=3D0D=3D0ASchwanau 77963=3D0D=3D0ADeutschland
URL;WORK:http://www.rw-gmbh.de
EMAIL;PREF;INTERNET:ralf.roesch@rw-gmbh.de
REV:20010405T072400Z
END:VCARD

------=_NextPart_000_0000_01C39959.73C38B80--
